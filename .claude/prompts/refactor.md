# Refactor Workflow

Use this prompt when restructuring or improving existing code without changing behavior.

## Steps

1. **Identify the target**: What code needs refactoring and why? Name the specific smell, duplication, or structural issue.
2. **Scope the impact**: Which files, tests, and consumers are affected? Map dependencies before changing anything.
3. **Plan incremental steps**: Break the refactor into small, independently verifiable steps. Each step should leave tests passing.
4. **Execute**: Apply changes one step at a time. Run tests after each step.
5. **Verify**: Confirm all tests pass, types check, and lint is clean. Verify no behavior change occurred.
6. **Document**: Summarize what changed and why in the commit message.

## Checklist before committing
- [ ] Behavior is unchanged (same inputs produce same outputs)
- [ ] All tests pass at each step
- [ ] No new dependencies introduced without justification
- [ ] Code is clearer or more maintainable than before
- [ ] Commit message explains the motivation
