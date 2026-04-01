# Claude Code Project Guide

This repository is a multi-stack starter configuration for Claude Code in VS Code.

## How this repo works

- **Unconditional rules** in `.claude/rules/` (common, testing, git, security) load every session.
- **Stack-specific rules** in `.claude/rules/` use `paths` frontmatter to load only when you touch matching files (e.g., Laravel rules load when reading `.php` files).
- **Subagents** in `.claude/agents/` handle focused tasks like architecture review, UI work, or SQL investigation.
- **Hooks** in `.claude/settings.json` run lightweight automation on session start and after edits.
- **Prompts** in `.claude/prompts/` provide reusable workflow templates for common tasks.

## Stack detection

Identify the active stack from the repository structure before making changes.

Common stack indicators:
- Laravel/PHP: `composer.json`, `artisan`, `routes/`, `app/`, `config/`
- React/Next.js: `package.json`, `next.config.*`, `app/`, `pages/`, `src/components/`
- Python/FastAPI: `pyproject.toml`, `requirements.txt`, `app/`, `main.py`
- Node/Express: `package.json`, `server.js`, `src/`, `routes/`
- Docker/DevOps: `Dockerfile`, `docker-compose.yml`, `.github/workflows/`
- SQL/Data: migration files, schema dumps, reporting queries, ETL scripts

## Default behavior

- Explain the plan before major edits.
- Prefer the smallest useful diff.
- Reuse existing patterns before adding new abstractions.
- Do not add dependencies unless there is a clear reason.
- Update docs when behavior changes.
- When unsure, inspect nearby code and existing conventions first.

## Testing and validation

- Run the narrowest relevant test first.
- Prefer lint + targeted test + typecheck over full-suite runs unless necessary.
- If you cannot run something locally, say exactly what should be run.

## Safety and repo hygiene

- Never commit secrets or `.env` values.
- Avoid destructive commands unless explicitly requested.
- Confirm migrations, schema changes, and bulk updates before applying them broadly.

## Git workflow

- Keep commits focused.
- Include a concise summary of what changed and why.
- Call out risks, follow-ups, and anything not verified.

## Imported rules (always loaded)

@.claude/rules/common.md
@.claude/rules/testing.md
@.claude/rules/git.md
@.claude/rules/security.md

## Prompt helpers (available on demand)

@.claude/prompts/bugfix.md
@.claude/prompts/refactor.md
@.claude/prompts/code-review.md
@.claude/prompts/onboarding.md
