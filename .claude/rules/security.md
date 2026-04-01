# Security Rules

- Never expose secrets, tokens, or private keys in code or logs.
- Never commit `.env`, credentials, or key files.
- Avoid logging sensitive values (passwords, tokens, PII).
- Validate input boundaries on API and DB changes.
- Sanitize user input before rendering (prevent XSS) or querying (prevent SQL injection).
- Flag auth, permission, or data exposure risks clearly.
- For destructive shell or SQL operations, explain scope before execution.
- Run `npm audit`, `pip audit`, or `composer audit` when adding dependencies.
