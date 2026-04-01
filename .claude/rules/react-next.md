---
paths:
  - "**/*.tsx"
  - "**/*.jsx"
  - "**/components/**"
  - "**/pages/**"
  - "**/next.config.*"
---

# React / Next.js Guidance

## Component design
- Prefer small, composable components.
- Keep presentational and data-loading concerns separate when the project already does that.
- Reuse existing UI primitives and design tokens before creating new ones.

## State and data
- Prefer existing state patterns already in the repo.
- Avoid adding new global state unless clearly needed.
- Keep async loading, error, and empty states explicit.

## Next.js specifics
- Follow the project's existing routing style (App Router vs Pages Router).
- Respect server/client boundaries.
- Avoid moving logic client-side unless necessary.
- Keep SEO-sensitive pages readable and structured.

## Styling
- Match the existing styling approach (CSS Modules, Tailwind, styled-components, etc.).
- Reuse theme utilities, shared classes, or component libraries where present.
- Avoid introducing visual inconsistency.

## Testing and checks
- `npm run lint`
- `npm run typecheck`
- `npm test -- <name>`
- `npm run build`

## Review checklist
- Accessibility basics preserved?
- Loading/error states covered?
- Types correct?
- Server/client boundaries respected?
- Existing component patterns reused?
