### Bug fix

**You own this task. Reproduce, isolate, fix, prove.**

Be scientific. Every shipped line traces to runtime evidence. A belt-and-suspenders change that "might help" is a hypothesis, not a fix, and it does not ship. When evidence refutes a hypothesis, revert what it motivated. The smallest change the evidence justifies ships, nothing more.

1. Reproduce it yourself on the surface where it happens. A test, a script, the CLI, the browser through whatever driver you have. Do not hand the repro to the user. Will not reproduce directly? Force it. Synthesize the trigger, tighten conditions, or instrument until it fires. A bug you cannot reproduce, you cannot prove fixed. Ask the user only with a specific reason the surface is out of your reach, and only after driving it as far as it goes.
2. Binary-search the cause. Seed hypotheses with `how` over the affected area and `why` for regression history. Each pass, take the split that cuts the most remaining problem space, get runtime evidence, eliminate. Unclear program state? Add logging and read it as the code runs. Do not guess. Confirm the mechanism with runtime evidence before designing the fix. A fix grounded on a plausible but unconfirmed cause is confidently wrong while the real cause sits one module over.
3. Find every caller of what you are about to touch. The root-cause fix is one guard in the shared path, not one per caller. Fixing only the path the ticket names leaves the sibling callers broken (`fix-root-causes`, `laziness-protocol`).
4. Plan the fix. If it crosses a function boundary, `architect` first. Otherwise write the smallest change the evidence justifies.
5. Verify on the same surface. The original repro now passes. "Inconclusive" or a different surface is not a pass. Unit tests show branch behavior, not bug absence.
6. Stage the commits so the failing repro lands before the fix, marked as an expected failure so every commit stays green (`tdd` step 8). The diff tells the story. Use `tdd` when the bug has a cheap local test path. Skip it when the test would be expensive, integration-heavy, or unclear, and say why (`sequence-verifiable-units`).
7. Run `ship`.

**Reply:** what was broken, the root cause, the fix, how you verified. Paste the failing-then-passing repro output verbatim.
