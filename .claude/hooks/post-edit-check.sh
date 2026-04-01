#!/usr/bin/env bash
# Runs after Edit/Write tool use via .claude/settings.json
# Performs lightweight lint checks based on the edited file type.
# Reads tool input JSON from stdin to extract the file path.

INPUT=$(cat)
if command -v jq &>/dev/null; then
  FILE=$(echo "$INPUT" | jq -r '.file_path // empty' 2>/dev/null)
else
  FILE=$(echo "$INPUT" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//;s/"$//')
fi

if [ -z "$FILE" ]; then
  exit 0
fi

EXT="${FILE##*.}"

case "$EXT" in
  php)
    if command -v php &>/dev/null; then
      php -l "$FILE" 2>&1 || true
    fi
    ;;
  py)
    if command -v ruff &>/dev/null; then
      ruff check "$FILE" 2>&1 || true
    elif command -v python3 &>/dev/null; then
      python3 -m py_compile "$FILE" 2>&1 || true
    fi
    ;;
  ts|tsx|js|jsx)
    if command -v npx &>/dev/null; then
      npx eslint "$FILE" --no-error-on-unmatched-pattern 2>&1 || true
    fi
    ;;
  sql)
    echo "SQL file edited: $FILE -- review before executing."
    ;;
esac

exit 0
