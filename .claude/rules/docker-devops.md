---
paths:
  - "**/Dockerfile*"
  - "**/docker-compose*.yml"
  - "**/compose*.yml"
  - "**/.github/workflows/**"
  - "**/nginx/**"
---

# Docker / DevOps Guidance

## Container changes
- Prefer minimal image changes.
- Keep layers cache-friendly.
- Avoid adding unnecessary packages.
- Preserve deterministic builds where possible.

## CI/CD
- Keep pipelines readable.
- Separate build, test, and deploy concerns.
- Fail fast on lint/test issues where appropriate.
- Do not change deployment behavior without calling it out clearly.

## Safety
- Flag production-impacting changes explicitly.
- Be careful with secrets, environment files, and service credentials.
- For resource or network changes, explain expected impact.

## Verification
- Suggest the smallest useful verification:
  - build command
  - compose validation
  - targeted pipeline job
  - smoke test
  - health endpoint check

## Review checklist
- Build still reproducible?
- Secrets handled safely?
- Startup/healthcheck impact reviewed?
- Pipeline step scope clear?
- Rollback path obvious?
