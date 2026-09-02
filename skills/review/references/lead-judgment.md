# Lead judgment

The reviewers have produced findings. Do not aggregate. Filter, contextualize, decide.

## Why this step exists

Adversarial reviewers are useful because they are aggressive. Aggression without context is noise. They saw a slice of the codebase and a paragraph of intent. They do not know what was already tried, what constraints live outside the code, which parts are scaffolding, or what the next commit addresses. You do. Use it.

## Filters

**Nitpick gravity.** Reviewers fill the space they are given. When a reviewer's findings are all nits and style, the code is probably fine. Say so.

**Hypothetical or actual.** "What if someone passes null?" is a finding only if a caller can. Trace the call site. Validated upstream or prevented by the types means dismissed.

**Premature abstraction.** Reviewers suggest extracting, interfacing, generalizing. Does the code need to change in a second way? If not, the abstraction is premature. Inline code that works beats a clean abstraction that is overkill.

**"I would have done it differently."** The most common false positive. Not a bug, not a flaw, not actionable unless the reviewer shows a concrete problem with the current approach. Dismiss and say why.

**Missing context.** Suggestions to change code the author did not touch, flags on patterns consistent with the rest of the codebase, recommendations that conflict with constraints you know. Honest mistakes from limited information. Dismiss gracefully.

## When reviewers are right

Do not dismiss a finding because it is uncomfortable. Signs it deserves attention:

- Several reviewers raised it independently.
- It names a concrete execution path, not a hypothetical.
- It reveals a gap in your own mental model.
- You read it and think "yes, actually".

Be slowest to dismiss correctness and security findings, even from one reviewer.

## Calibration

A good verdict is useful, not comprehensive. The user reads Act on, fixes those, and ships with confidence. More than five items there means you are not filtering.

Dismissed is not busywork. It is the trust mechanism. Showing what you rejected and why lets the user override you where they disagree.
