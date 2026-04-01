---
paths:
  - "**/*.php"
  - "**/routes/**"
  - "**/app/**"
  - "**/database/migrations/**"
  - "**/resources/views/**"
---

# Laravel / PHP Guidance

## Architecture
- Prefer existing Laravel conventions before custom patterns.
- Keep controllers thin.
- Put reusable business logic in services, actions, or domain classes if that pattern already exists.
- Use Form Requests for request validation when appropriate.
- Prefer Eloquent scopes, relationships, and query builders over duplicated query logic.

## Validation
- Validate user input at the request boundary.
- Keep validation rules readable and grouped logically.
- Reuse request objects or shared rule builders when the codebase already does that.

## Database
- Treat migrations as review-sensitive changes.
- Prefer additive schema changes unless a breaking change is intentional.
- For large updates, think about indexing, chunking, locking, and rollback impact.

## Testing
- Prefer focused feature or unit tests for the changed area.
- Reuse factories, seeders, and test helpers already in the project.

## Commands
- `php artisan test --filter=...`
- `php artisan route:list`
- `php artisan migrate --pretend`
- `composer test`
- `composer pint`
- `./vendor/bin/phpunit`

## Review checklist
- Validation correct?
- Auth/authorization preserved?
- N+1 or query performance issues?
- Migration safety reviewed?
- API response shape consistent?
