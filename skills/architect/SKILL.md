---
name: architect
description: Design before implementing. Write the caller's usage first, then types, signatures, and module boundaries, in at least two structurally distinct shapes, screen them for shallow modules and leakage, pick one, then implement against it. Use for /architect, "design this", "architect this", or any change that crosses a function boundary where jumping to code would lock in the wrong shape.
---

# Architect

Design it twice before you build it once. Sketch the caller's usage, then types, signatures, and module boundaries with `not implemented` bodies. Produce at least two structurally distinct candidates, screen them against the red flags, pick a base, graft the best of the rest into it, then fill in code against the chosen sketch. When implementation proves the sketch wrong, throw the sketch out.

## Start

Open a todo list with one entry per phase.

1. Ground
2. Sketch
3. Pick and graft
4. Implement
5. Scrap if wrong

## Phase A. Ground

Build a real mental model of every system the new code touches. Run `how` over the relevant areas, in Critique mode when existing structure is the constraint. When the design moves ownership or layering, run `why` on the existing shape so the old rationale becomes a constraint instead of a guess.

Naming a file is not grounding. Produce the traced model `how` prescribes. Skip Phase A only for genuinely greenfield work with nothing to integrate.

Restate the done-predicate from `scope` before sketching. The design serves it.

## Phase B. Sketch

Each candidate is a design package shaped per `references/rationale-template.md`. The caller's usage is written first. Types, signatures, and the module map are derived from it. When they disagree, reconcile the sketch to the usage, never the reverse.

**Design it twice.** Require at least two structurally distinct candidates before picking, even when the first looks sufficient (`exhaust-the-design-space`). Whole-shape alternatives, not point fixes inside one shape. A second flavor of the first shape does not count. Three when the decision is expensive to reverse.

When the host has subagents, fan the candidates out with the same brief and the Phase A grounding, one per subagent, each writing to its own path. Vary the model family when you can. Each returns the package and a rationale naming what it considered and rejected. Without subagents, write the candidates yourself, sequentially, and do not let the second one drift toward the first.

**Screen every candidate against `references/design-red-flags.md`.** Reject or revise a shallow module, information leakage, temporal decomposition, a pass-through method or variable, or a special case the design could define out of existence.

**Compare on interface depth** (`deep-modules`). Prefer the design that hides more complexity behind a smaller public surface. A rich interface keeps call chains short by concentrating capability instead of scattering it across layers. Prefer the cleaner boundary or smaller surface when two feel tied (`laziness-protocol`).

## Phase C. Pick and graft

Read every candidate end to end before picking. Skimming surfaces only the one whose surface looks most familiar. Score each against the predicate and the red flags, criterion by criterion, not on feel. When a subagent judge is available, have one on a different model score them too, and compare. Agreement confirms the pick. Disagreement means the rubric was ambiguous or one of you is biased. Read both rationales.

Pick the base a future maintainer can extend most easily without breaking invariants. Then walk each losing candidate once and port what is worth porting, usually one or two things, folded in by hand so the result stays coherent under one mental model. Record what was grafted from where and what was rejected and why. The rejections are the most useful part of the record.

Candidates that converge on one shape are a strong agreement signal. Ship the consensus. Candidates that wildly diverge mean the brief was under-specified. Re-ground and re-run rather than averaging.

By default, proceed into implementation. The human sees the design in the reply and course-corrects after. Pause for sign-off only when asked ("with checkpoint", "show me before implementing"), or when the shape is a one-way door. Pushback on the shape is Phase A evidence. Re-ground, re-sketch.

## Phase D. Implement against the sketch

Replace `not implemented` bodies with code, pseudocode with logic. The sketch is the contract. The synthesized sketch can land as its own commit, with later commits filling in bodies against a stable contract (`foundational-thinking`, scaffold first).

Deviations are signal, not friction. A function that needs a parameter the sketch did not anticipate means the sketch was wrong, the requirement was missed, or the implementation is overreaching. Surface it. Do not bolt it on.

## Phase E. Scrap when the architecture is wrong

If implementation keeps producing friction the sketch cannot absorb, throw the sketch out (`redesign-from-first-principles`, `fix-root-causes`). The signal is a pattern, not a single hard case.

- The same shape of workaround appearing across unrelated code.
- Several unrelated edge cases that all need special branches.
- Types that need escape hatches (`any`, casts, optional fields always set in practice) to compile.
- The "we need a lock" reflex when the sketch said the state was not shared.
- Callers having to know the abstraction's internal rules to use it.
- Two or more Phase D deviations of the same shape.

Complexity in the data is not complexity in the design. Some problems are legitimately hard. The rewrite signal is repeated friction of the same shape.

When you scrap: re-run `how` over what was built so the lessons enter as inputs, redesign as if the new constraints were day-one assumptions, subtract before adding so the new sketch is smaller than the old before it grows, then return to Phase B.

## Outputs

The chosen design package per `references/rationale-template.md`, including the usage sketch and the pick-and-graft record. One file with new types and signatures for a small change. A module map plus type definitions for larger work.

**Reply:** the caller's usage, the chosen shape and why, the alternatives and why they lost, the red flags you screened out, open questions. Then the implementation, or the checkpoint when one was asked for.
