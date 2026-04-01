---
paths:
  - "**/server/**"
  - "**/routes/**/*.js"
  - "**/routes/**/*.ts"
  - "**/middleware/**"
  - "**/server.js"
  - "**/app.js"
---

# Node / Express Guidance

## API structure
- Keep route files readable and focused.
- Move shared business logic into services/helpers if the project uses that structure.
- Keep middleware responsibilities narrow and predictable.

## Validation and safety
- Validate input near the request boundary.
- Preserve auth and permission checks.
- Avoid adding implicit behavior that is hard to trace.

## Error handling
- Use the project's existing error pattern.
- Prefer structured errors and consistent status codes.
- Avoid silent failures.

## Testing and checks
- `npm test -- <name>`
- `npm run lint`
- `npm run typecheck`
- `npm run test:unit`

## Review checklist
- Validation added?
- Error path covered?
- Auth preserved?
- Logging safe?
- Existing middleware conventions followed?
