---
name: verify
description: Prove a change works against the real artifact before calling it done. Use before any "done", "fixed", "works now", or commit, and for "verify this", "prove it", "did you actually test that". Reports evidence, not outcomes.
---

# Verify

Unverified work has unknown correctness. "It compiles", a green type check, a subagent's summary, and a file's mtime are proxies. Check the real thing.

## The bar

1. Build it. Necessary, not sufficient.
2. Run the actual feature path with the actual inputs. For a bug fix, the original repro. For a feature, the done-predicate from `scope`. For a refactor, the pin.
3. Check the full chain. Data flows from input to output, on the surface where the user meets it. A unit test shows branch behavior, not bug absence.
4. Read the actual value. Not a cached or derived representation. Process liveness directly, not through a status file. Rendered output, not the template.
5. For delegated work, inspect the artifact (`git diff`, file contents, runtime behavior), never the delegate's report. Agents report what they intended.

When a check passes too easily, suspect the observation before the system. A blank screenshot passes a lazy gate. A test that cannot fail proves nothing. Make it fail once on purpose when you are unsure it can.

## Script the check

The strongest proof is a deterministic script that re-runs the same comparison. Write it, run it, keep the output. A script comparing old and new output catches what an eyeball misses, and a reviewer can rerun it instead of trusting you (`build-the-lever`).

Non-trivial logic leaves one runnable check behind, the smallest thing that fails if the logic breaks. An `assert`-based self-check, one small test file, a script. No framework, no fixtures, no per-function suite unless asked. Trivial one-liners need none.

## Verdicts

`VERIFIED`, `NOT VERIFIED`, or `INCONCLUSIVE`, per claim. Inconclusive is not a pass. A different surface than the one that matters is not a pass. Never hide a negative. When you cannot verify cheaply, say so and name the cheapest thing that would.

## Report

Evidence, not outcome. One line per claim.

- What you ran. The exact command, script path, or interaction.
- What you observed. Pasted output, the value read, the screenshot path.
- The verdict.

Failing-then-passing output for a bug fix, pasted verbatim.

**Reply:** the report. Then, and only then, "done".
