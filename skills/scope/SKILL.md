---
name: scope
description: Turn a vague ask into a checkable brief before any code. Use at the start of a feature, for "scope this", "what do we actually need", "what are the constraints", or when a request names a solution instead of a need or has more than one reasonable reading. Produces the done-predicate, the constraints the codebase already imposes, what is out of scope, and which open questions to settle by running versus asking.
---

# Scope

The ask is a symptom of a need. Before code, find the need, the smallest thing that meets it, and the constraints the codebase already imposes. Building the wrong thing well is the expensive failure. The output is one short brief, then you start.

## Steps

1. **Restate the ask as a done-predicate.** One or two sentences a reviewer can check as true or false against the real artifact. "The export never writes a duplicate row when a retry lands mid-run" is a predicate. "Fix the export" is not. When the user gave a checkable outcome, use their words.
2. **Ask whether it needs to exist.** Rung 1 of the ladder. Is there a smaller ask that covers the need? Does something here already do it? Is the request a workaround for a bug that should be fixed at its root? Say so in one line and name the smaller thing. Then build what they confirm, or build the lazy version with the question attached.
3. **Read the constraints out of the code.** Run `how` over the area the change touches, unless you already read it this session. List what the change must fit. The existing types and helpers it should reuse (rung 2). The callers that must keep working. The conventions the surrounding code follows. The tests that pin current behavior. The boundary where external data enters. When the change moves ownership or layering, run `why` too, so the old rationale becomes a constraint instead of a guess.
4. **Name what is out.** The adjacent things a reader might expect and you will not do. Scope creep is refused here, in advance.
5. **Sort the open questions.** For each fork, one of two tags.
   - `prototype`. A run could answer it (behavior, timing, output, whether an API works). Not the human's to answer. Note the smallest experiment, per `tobi-mode/playbooks/prototype.md`.
   - `ask`. A product or preference call no run settles. One batched question with options and the default you will take. Proceed on the default when the work is reversible.
6. **Route.** Called from a playbook? Return to its next step. Otherwise name the playbook (investigation, bug fix, feature, refactor, prototype) and start it.

## Output

One block, no preamble. One line per item unless it needs more.

- Goal. The need in one sentence.
- Done when. The predicate.
- Constraints. From the code, with `file:line` where it matters.
- Out of scope. What you will not touch.
- Open. Each question tagged `prototype` or `ask`, with the default.
- Playbook. The one you run next, or the step you return to.

Then run it. Wait for approval only when an `ask` item blocks the first step.

## Boundaries

Scope is a page, never a plan document. If the brief runs past a screen, the task is several tasks. Split it, scope the first, name the rest.
