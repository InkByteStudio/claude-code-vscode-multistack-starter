#!/usr/bin/env bash
# Standalone stack detection script.
# Outputs detected stacks as JSON for use by other tools.

stacks=()

{ [ -f artisan ] || [ -f composer.json ]; } && stacks+=("laravel")
{ [ -f next.config.js ] || [ -f next.config.mjs ] || [ -f next.config.ts ]; } && stacks+=("react-next")
[ -f package.json ] && grep -q '"react"' package.json 2>/dev/null && stacks+=("react")
{ [ -f pyproject.toml ] || [ -f requirements.txt ]; } && stacks+=("python-fastapi")
[ -f package.json ] && { [ -f server.js ] || [ -f app.js ]; } && stacks+=("node-express")
{ [ -f Dockerfile ] || [ -f docker-compose.yml ] || [ -f compose.yml ]; } && stacks+=("docker-devops")

# Check for SQL-heavy projects
sql_count=$(find . -maxdepth 3 -name "*.sql" 2>/dev/null | head -5 | wc -l)
[ "$sql_count" -gt 0 ] && stacks+=("sql")

# Output as JSON
json="["
for i in "${!stacks[@]}"; do
  [ "$i" -gt 0 ] && json+=","
  json+="\"${stacks[$i]}\""
done
json+="]"

echo "{\"stacks\": $json, \"detected_at\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"}"
