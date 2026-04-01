# Code Review Workflow

Use this prompt when reviewing code changes for quality, safety, and correctness.

## Review areas

### Security
- Are secrets, tokens, or credentials exposed?
- Is user input validated and sanitized?
- Are auth and permission checks in place?
- Are there SQL injection, XSS, or command injection risks?

### Correctness
- Does the code do what it claims?
- Are edge cases handled (nulls, empty inputs, boundary values)?
- Are error paths covered?
- Is the logic consistent with existing patterns?

### Performance
- Are there N+1 queries, unnecessary loops, or missing indexes?
- Is async/await used correctly?
- Are large datasets handled with pagination or streaming?

### Readability
- Is the code clear without excessive comments?
- Are names descriptive and consistent?
- Is the diff focused (no unrelated changes)?

### Testing
- Are new paths covered by tests?
- Do existing tests still pass?
- Are test assertions meaningful (not just checking "no error")?

## Output format
Rate each finding:
- **Critical**: Must fix before merge (security, data loss, broken functionality)
- **Warning**: Should fix (performance, maintainability, missing edge case)
- **Suggestion**: Nice to have (style, naming, minor improvement)
