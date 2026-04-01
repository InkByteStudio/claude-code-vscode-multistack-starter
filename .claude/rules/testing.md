# Testing Rules

- Run only the most relevant tests first.
- Prefer one file, one suite, or one command over full-suite runs.
- If adding logic, add or update tests when the project already has test coverage in that area.
- If tests are missing, suggest the smallest useful test addition.
- Report what was run, what passed, and what was not verified.
- Use the stack-appropriate test runner:
  - PHP/Laravel: `php artisan test --filter=...` or `./vendor/bin/phpunit`
  - React/Next.js: `npm test -- <name>` or `npx vitest run <name>`
  - Python: `pytest -k ...` or `uv run pytest`
  - Node/Express: `npm test -- <name>` or `npm run test:unit`
