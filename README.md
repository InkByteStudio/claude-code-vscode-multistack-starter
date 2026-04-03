# Claude Code VS Code Multi-Stack Starter

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-VS%20Code-blueviolet)](https://code.claude.com)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/InkByteStudio/claude-code-vscode-multistack-starter/pulls)

A practical, modular Claude Code configuration for VS Code that works across multiple tech stacks.

This starter gives you a clean `CLAUDE.md` setup with conditional stack-specific rules, focused subagents, lightweight hooks, and reusable prompt templates -- instead of one giant instruction file that tries to do everything.

## What you get

- A root `CLAUDE.md` that stays short and readable (under 200 lines)
- **Two-tier rules**: universal rules that always load + stack-specific rules that load only when relevant
- 6 custom subagents for focused work (Laravel, React, Python, Node, DevOps, SQL)
- Hook automation for session start and post-edit checks
- Reusable prompt templates for bugfixing, refactoring, code review, and onboarding
- An interactive install script for adding this config to existing projects
- A stack detection script that identifies your project's tech stack

## Supported stacks

| Stack | Rule file | Triggers when reading |
|-------|-----------|----------------------|
| Laravel / PHP | `.claude/rules/laravel.md` | `**/*.php`, `**/routes/**`, `**/app/**` |
| React / Next.js | `.claude/rules/react-next.md` | `**/*.tsx`, `**/*.jsx`, `**/components/**` |
| Python / FastAPI | `.claude/rules/python-fastapi.md` | `**/*.py`, `**/pyproject.toml` |
| Node / Express | `.claude/rules/node-express.md` | `**/server/**`, `**/routes/**/*.js` |
| Docker / DevOps | `.claude/rules/docker-devops.md` | `**/Dockerfile*`, `**/docker-compose*` |
| SQL / Data | `.claude/rules/sql.md` | `**/*.sql`, `**/migrations/**` |

## Who this is for

Developers working in one or more of these stacks who want Claude Code to behave consistently without maintaining a bloated instruction file. Works well for:

- Personal starter templates
- Internal engineering playbooks
- Repo onboarding helpers
- Multi-stack freelancing or agency work
- Monorepo projects with mixed technologies

## How it works

### Two-tier rules architecture

This is the core pattern. Rules in `.claude/rules/` are split into two types:

**Unconditional rules** (always loaded at session start):
- `common.md` -- naming, formatting, and general behavior
- `testing.md` -- test runner commands and coverage expectations
- `git.md` -- commit style, branch naming, and deployment awareness
- `security.md` -- secrets, input validation, and safe operations

**Path-conditional rules** (loaded only when Claude reads matching files):

Each stack rule uses `paths` frontmatter to declare when it should activate:

```yaml
---
paths:
  - "**/*.php"
  - "**/routes/**"
  - "**/app/**"
---

# Laravel / PHP Guidance
...
```

This means Laravel rules only load when Claude is working with PHP files. React rules only load when touching TSX/JSX. Your context window stays lean.

### Custom subagents

Six subagents in `.claude/agents/` for focused delegation:

| Agent | Model | Purpose |
|-------|-------|---------|
| `laravel-architect` | Sonnet | Eloquent, migrations, API resources, service patterns |
| `react-ui` | Sonnet | Components, state, accessibility, styling |
| `python-api` | Sonnet | FastAPI, request models, async patterns |
| `node-backend` | Sonnet | Express routes, middleware, error handling |
| `devops-reviewer` | Haiku | Docker, CI/CD, deployment risk review (read-only) |
| `sql-investigator` | Haiku | Query analysis, migration safety, schema review (read-only) |

### Hooks

Configured in `.claude/settings.json` (not separate files):

- **SessionStart**: Runs `session-start.sh` to detect stacks and check environment readiness
- **PostToolUse** (Edit/Write): Runs `post-edit-check.sh` for lightweight lint checks based on file type

### Prompt templates

Reusable workflow guides in `.claude/prompts/`. Invoke them as slash commands in Claude Code:
- `/bugfix` -- structured diagnosis, reproduction, fix, and verification
- `/refactor` -- incremental restructuring with tests passing at each step
- `/code-review` -- security, correctness, performance, readability checklist
- `/onboarding` -- project exploration and documentation for new developers

## Quick start

### Option 1: Clone and customize

```bash
git clone https://github.com/InkByteStudio/claude-code-vscode-multistack-starter.git
cd claude-code-vscode-multistack-starter
```

1. Open the project in VS Code
2. Review `CLAUDE.md` and adjust for your project
3. Delete stack rules in `.claude/rules/` you don't need
4. Remove agents in `.claude/agents/` you won't use
5. Start Claude Code

### Option 2: Install into an existing project

```bash
git clone https://github.com/InkByteStudio/claude-code-vscode-multistack-starter.git
./claude-code-vscode-multistack-starter/scripts/install-local.sh /path/to/your/project
```

The install script will:
- Copy `.claude/` config (settings, rules, agents, hooks, prompts)
- Copy `CLAUDE.md` if one doesn't exist
- Detect your project's stacks
- Print next steps for customization

### Option 3: Detect your stack first

```bash
bash scripts/detect-stack.sh
```

Outputs JSON with detected stacks so you know which rules and agents to keep.

## Repo structure

```
.
├── CLAUDE.md                          # Root instructions (<200 lines)
├── .claude/
│   ├── settings.json                  # Hooks configuration
│   ├── rules/
│   │   ├── common.md                  # Always loaded
│   │   ├── testing.md                 # Always loaded
│   │   ├── git.md                     # Always loaded
│   │   ├── security.md                # Always loaded
│   │   ├── laravel.md                 # Conditional: PHP files
│   │   ├── react-next.md              # Conditional: TSX/JSX files
│   │   ├── python-fastapi.md          # Conditional: Python files
│   │   ├── node-express.md            # Conditional: Node server files
│   │   ├── docker-devops.md           # Conditional: Docker/CI files
│   │   └── sql.md                     # Conditional: SQL/migration files
│   ├── agents/
│   │   ├── laravel-architect.md
│   │   ├── react-ui.md
│   │   ├── python-api.md
│   │   ├── node-backend.md
│   │   ├── devops-reviewer.md
│   │   └── sql-investigator.md
│   ├── hooks/
│   │   ├── session-start.sh
│   │   └── post-edit-check.sh
│   └── prompts/
│       ├── bugfix.md
│       ├── refactor.md
│       ├── code-review.md
│       └── onboarding.md
├── scripts/
│   ├── detect-stack.sh
│   └── install-local.sh
└── docs/
    ├── tutorial-outline.md
    ├── blog-outline.md
    ├── why-modular-claude-md.md
    └── stack-detection.md
```

## Customization guide

### Add a new stack

1. Create `.claude/rules/your-stack.md` with `paths` frontmatter targeting relevant file extensions
2. Optionally create `.claude/agents/your-stack-agent.md` with appropriate frontmatter
3. Add the stack's indicator files to `scripts/detect-stack.sh`

### Modify hooks

Edit `.claude/settings.json` to add, remove, or change hook event handlers. Hook types supported: `command`, `http`, `prompt`, `agent`.

### Add a prompt template

Create a new `.md` file in `.claude/prompts/` and add an `@` import reference in `CLAUDE.md` under the prompt helpers section.

## Local overrides

Create `.claude/settings.local.json` (gitignored) to add personal permission overrides without affecting the shared config:

```json
{
  "permissions": {
    "allow": ["Bash(git push:*)"]
  }
}
```

## Best practices

- Keep the root `CLAUDE.md` short -- move details into rules and prompts
- Prefer real commands over vague instructions
- Use `paths` frontmatter to keep stack rules conditional
- Add subagents only for tasks that benefit from focused delegation
- Add hooks only for lightweight, deterministic automation
- Delete what you don't need -- this is a starting point, not a finished system

## What's not included (on purpose)

This repo does not try to auto-configure everything. It is meant to be understandable first, then customized for your specific project. There is no magic -- just a clean structure you can inspect and adapt.

## Coming next

- Monorepo example configuration
- Framework-specific starter packs
- Additional hook examples (pre-commit, file watcher)
- Community-contributed stack modules

## Related content

This repo pairs with content on [igotasite4that.com](https://igotasite4that.com):
- [Tutorial: step-by-step Claude Code setup in VS Code](https://igotasite4that.com/blog/claude-code-vscode-multistack-starter-tutorial)
- [Blog: why modular CLAUDE.md beats a giant instruction file](https://igotasite4that.com/blog/why-most-claude-md-files-are-too-big)

## License

[MIT](LICENSE)
