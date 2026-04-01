# Bugfix Workflow

Use this prompt when diagnosing and fixing a bug.

## Steps

1. **Describe the bug**: What is the expected behavior vs. actual behavior?
2. **Reproduce**: Find or write a minimal reproduction. If tests exist, write a failing test first.
3. **Diagnose**: Trace the code path. Check logs, error messages, and recent changes. Narrow down to the root cause before proposing a fix.
4. **Fix**: Apply the smallest change that addresses the root cause. Do not refactor unrelated code.
5. **Verify**: Run the failing test (or the narrowest relevant test suite) to confirm the fix. Run lint and typecheck.
6. **Document**: Note what caused the bug, what the fix does, and any follow-up work needed.

## Checklist before committing
- [ ] Root cause identified (not just symptoms addressed)
- [ ] Fix is scoped to the bug (no unrelated changes)
- [ ] Test covers the failure case
- [ ] Existing tests still pass
- [ ] No regressions introduced
