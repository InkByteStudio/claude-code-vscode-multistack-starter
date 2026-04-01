#!/usr/bin/env bash
# Runs on SessionStart via .claude/settings.json
# Detects active stacks and checks environment readiness.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DETECT_SCRIPT="$SCRIPT_DIR/../../scripts/detect-stack.sh"

if [ -x "$DETECT_SCRIPT" ] || [ -f "$DETECT_SCRIPT" ]; then
  stacks_json=$(bash "$DETECT_SCRIPT" 2>/dev/null || echo '{"stacks": []}')
  # Parse JSON array into display string
  stacks_list=$(echo "$stacks_json" | grep -o '"[^"]*"' | grep -v stacks | grep -v detected_at | tr -d '"' | paste -sd', ' -)
  if [ -n "$stacks_list" ]; then
    echo "Detected stacks: $stacks_list"
  else
    echo "No specific stack detected. Check project files manually."
  fi
else
  echo "No specific stack detected. Check project files manually."
fi

# Check for missing .env
if [ -f .env.example ] && [ ! -f .env ]; then
  echo "Warning: .env.example exists but .env is missing. Copy and configure it."
fi

exit 0
