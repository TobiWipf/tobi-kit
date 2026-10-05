---
name: tdd
description: Write the failing test before the fix when a bug has a cheap local test path, or when the user asks for TDD, a failing test, or a regression test. Skip when the test would be expensive, integration-heavy, mock-heavy, or unclear, and say so.
---

# TDD bug fix

When a bug has a clear, cheap test path, make the broken behavior executable before changing production code. The goal is one focused regression test that fails before the fix and passes after.

For new behavior, the same loop. The failing test encodes the done-predicate from `scope`.

Do not force a test that would be impractical. Broad harness setup, brittle mocks, slow end-to-end infrastructure, production-only state, vague reproduction, or large unrelated fixture churn all mean skip the new test and use the closest useful verification instead.

## Workflow

Called from Bug fix? The repro and cause are done. Start at step 2.

1. **Understand the bug.** Intended behavior, current behavior, affected path, the smallest observable reproduction.
2. **Choose the narrowest executable check.** The closest unit, component, or integration test already used for that code path. If no practical path is obvious, do not build one from scratch to satisfy the workflow.
3. **Write the failing test first.** The smallest focused test that would have caught the bug. It encodes intended behavior, not the current implementation.
4. **Run it before fixing.** Confirm it fails for the intended reason. Passing, or failing for an unrelated reason, means fix the test or the repro before touching the implementation.
5. **Fix the bug.** The smallest production change that satisfies the intended behavior and preserves nearby contracts.
6. **Rerun the test.** Confirm it passes.
7. **Run nearby validation.** Adjacent tests, type check, lint, when the change has broader risk.
8. **Commit red to green, every commit green.** The test lands first, marked as an expected failure with the runner's marker (`test.fails` in Vitest, `test.failing` in Jest), so it passes only while the bug exists. The fix commit removes the marker. CI and `git bisect` never see a failing commit, and the diff still shows broken, then fixed.

## When a failing test is impractical

Do not silently skip. Say why a failing test is impossible or not worth the cost, then pick the closest executable regression check. A targeted script, a manual reproduction command, browser automation, a snapshot comparison, a log assertion, a focused integration check.

Prefer no new test over a bad test. A bad test mostly tests mocks, encodes implementation details, depends on timing or unrelated global state, needs expensive infrastructure for a small fix, or would be deleted right after proving the fix.

## Guardrails

- Never change a test to match a wrong implementation.
- Never weaken an assertion unless the expected behavior genuinely changed and the reason is clear.
- Keep the regression test on the bug. No fixture churn, no unrelated coverage.
- A flaky bug gets a deterministic test where possible, with the locked-down signal named.
- A bug that exposes a class of failures gets the focused test first, then sibling coverage as a follow-up.

## Report

Evidence, not outcome.

- The failing-before test or check and the failure it produced.
- The passing-after run and any nearby validation.
- When failing-before could not be shown, why, and the closest check used instead.
