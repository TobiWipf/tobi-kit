# Rationale template

The prose that ships alongside the type sketch. One page. Sentence-case headings, no boilerplate. Replace the italic notes with content.

## Problem

*One paragraph. What we are trying to do, and what about the existing system or constraints makes the shape non-obvious. Name the constraints Phase A surfaced (existing types to interoperate with, callers we cannot break, invariants that cross our boundary) so the reader sees what you saw. Restate the done-predicate from `scope`.*

## Usage (caller's view)

*Write this first, before the type sketch. Show the README or quickstart the consumer reads, plus two or three realistic call sites in their own code. What they import, what they call, what comes back. The Shape section is derived from this. When they diverge, reconcile the sketch to the usage, not the reverse. The caller's experience is the spec.*

## Shape

*The recommended architecture. Data structures first, then how data flows through the signatures. Name the load-bearing decisions. State which invariants are encoded in types, where validation lives, and what the system deliberately does not do. Judge interface depth explicitly. What complexity does the public surface hide, what remains exposed to callers, and why is the interface no larger than needed. Cite the principle behind each decision (`per boundary-discipline`). Do not restate it.*

## Pick and graft

*Which candidate became the base and why. What was ported from each of the others. What was rejected and why. The rejections are the most useful part.*

## Tradeoffs accepted

*One bullet per tradeoff the chosen shape makes. "We accept X in exchange for Y." Name anything a future reader might mistake for an oversight, including what looks like premature optimization or premature simplification.*

## Alternatives considered

*Required. At least one concrete alternative shape with one line on why it lost. Judge each on interface depth, not implementation simplicity alone. Name the complexity it exposes to callers and the complexity it hides. Two or three when the design space had real contenders. One is fine when constraints forced the answer, phrased as "this was the only viable shape because...". Not flavors of the same shape.*

## Red flags screened

*Which items from `design-red-flags.md` the chosen shape was checked against, and what was changed as a result. "None found" is a valid entry once you have actually looked.*

## Open questions and risks

*What the human needs to weigh in on, and risks worth flagging before implementation starts. Phrased as questions, so the human's answer is the resolution.*

## Next implementation step

*The first thing to build against the sketch. One sentence.*
