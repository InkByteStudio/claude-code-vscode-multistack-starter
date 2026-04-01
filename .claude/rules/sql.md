---
paths:
  - "**/*.sql"
  - "**/migrations/**"
  - "**/seeds/**"
  - "**/seeders/**"
---

# SQL / Data Guidance

## Query design
- Prefer readable SQL over compressed SQL.
- Keep joins explicit.
- Call out assumptions and cardinality risks.
- Be careful with null handling and implicit casts.

## Safety
- Treat UPDATE and DELETE statements as high risk.
- Explain filters and blast radius before changing production data.
- For large operations, consider batching, indexes, locks, and runtime impact.

## Performance
- Prefer predicate clarity and index-friendly filters.
- Avoid unnecessary SELECT * in operational queries.
- When helpful, suggest how to inspect the query plan.

## Validation
- Show a preview SELECT before mass updates.
- Suggest backup, transaction, or temp-table strategy when appropriate.
- For schema changes, call out data migration and rollback implications.

## Review checklist
- Null handling correct?
- Join duplication risk checked?
- Update scope verified?
- Performance considered?
- Rollback strategy noted?
