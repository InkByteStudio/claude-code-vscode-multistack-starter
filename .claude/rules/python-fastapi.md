---
paths:
  - "**/*.py"
  - "**/requirements*.txt"
  - "**/pyproject.toml"
---

# Python / FastAPI Guidance

## API design
- Keep route handlers thin.
- Move reusable business logic into services or domain modules.
- Prefer typed request and response models where the project already uses them.
- Preserve response compatibility unless a breaking change is intentional.

## Validation and errors
- Validate request bodies and query parameters clearly.
- Return structured errors consistent with the existing API.
- Avoid broad exception swallowing.

## Data and async
- Respect current async/sync patterns.
- Do not mix blocking calls into async code without reason.
- Consider transaction boundaries and retry implications for DB changes.

## Testing and checks
- `pytest -k ...`
- `ruff check`
- `mypy`
- `uv run pytest`

## Review checklist
- Type hints preserved?
- Models and schemas aligned?
- Async usage correct?
- Backward compatibility preserved?
- Logs and error handling safe?
