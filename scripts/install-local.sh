#!/usr/bin/env bash
# Install this Claude Code starter config into an existing project.
# Usage: ./scripts/install-local.sh [target-directory]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
TARGET="${1:-.}"

# Resolve to absolute path
TARGET="$(cd "$TARGET" && pwd)"

echo "Claude Code Multi-Stack Starter Installer"
echo "==========================================="
echo ""
echo "Source: $REPO_DIR"
echo "Target: $TARGET"
echo ""

# Check if .claude/ already exists
if [ -d "$TARGET/.claude" ]; then
  echo "Warning: $TARGET/.claude/ already exists."
  read -rp "Overwrite existing config? (y/N): " confirm
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
  fi
fi

# Copy .claude/ directory
echo "Copying .claude/ config..."
mkdir -p "$TARGET/.claude"
cp "$REPO_DIR/.claude/settings.json" "$TARGET/.claude/settings.json"
cp -r "$REPO_DIR/.claude/rules" "$TARGET/.claude/"
cp -r "$REPO_DIR/.claude/agents" "$TARGET/.claude/"
cp -r "$REPO_DIR/.claude/hooks" "$TARGET/.claude/"
cp -r "$REPO_DIR/.claude/prompts" "$TARGET/.claude/"

# Copy CLAUDE.md if it doesn't exist
if [ -f "$TARGET/CLAUDE.md" ]; then
  echo "CLAUDE.md already exists in target. Skipping (review manually)."
else
  cp "$REPO_DIR/CLAUDE.md" "$TARGET/CLAUDE.md"
  echo "Copied CLAUDE.md"
fi

# Make hook scripts executable
chmod +x "$TARGET/.claude/hooks/"*.sh 2>/dev/null || true

# Detect stacks
echo ""
echo "Detecting stacks in target project..."
cd "$TARGET"
stacks_output=$("$REPO_DIR/scripts/detect-stack.sh" 2>/dev/null || echo '{"stacks": []}')
if command -v python3 &>/dev/null; then
  echo "$stacks_output" | python3 -c "
import sys, json
data = json.load(sys.stdin)
stacks = data.get('stacks', [])
if stacks:
    print('Detected: ' + ', '.join(stacks))
else:
    print('No specific stacks detected.')
" 2>/dev/null || echo "$stacks_output"
else
  echo "$stacks_output"
fi

# Summary
echo ""
echo "Installation complete."
echo ""
echo "Installed to $TARGET/.claude/:"
echo "  - settings.json (hooks config)"
echo "  - rules/ (4 unconditional + 6 stack-specific)"
echo "  - agents/ (6 subagents)"
echo "  - hooks/ (session-start, post-edit-check)"
echo "  - prompts/ (bugfix, refactor, code-review, onboarding)"
echo ""
echo "Next steps:"
echo "  1. Review CLAUDE.md and adjust for your project"
echo "  2. Remove stack rules you don't need from .claude/rules/"
echo "  3. Remove agents you don't need from .claude/agents/"
echo "  4. Customize .claude/settings.json hooks"
echo "  5. Open the project in VS Code and start Claude Code"
