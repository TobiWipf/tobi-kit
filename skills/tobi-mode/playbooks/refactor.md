### Refactor

**You own the contract. The structure changes, the behavior does not.** For "refactor", "rename", "extract", "inline", "dedupe", "restructure", "move this", "tidy this up". Distinct from Feature, which adds behavior, and Bug fix, which corrects it.

A refactor that smuggles in a behavior change loses its safety net. If the cleanup reveals a missing feature or a real bug, split it out. Ship the structural change first against the pinned contract, then route the rest to Feature or Bug fix.

1. Pin the behavior first. Run `how` over the area to learn the contract, then write a characterization test, snapshot, or equivalence harness that captures current behavior before anything moves. The pin makes "refactor" a checkable claim (`prove-it-works`). Type check and lint are not a pin.
2. Name the structure the code is missing (`model-the-domain`). The reshape must delete branches or invalid states, not add indirection. Boring code stays when the shape is already clear and local.
3. Name the target shape. What the module layout, types, and call graph should be if built today (`foundational-thinking`, `redesign-from-first-principles`, `deep-modules`). If it crosses a function boundary, `architect`.
4. Subtract before you add. Delete dead weight, collapse one-caller wrappers, drop redundant validators, remove orphan references, then introduce the new shape. A speculative cleanup that "might help" gets reverted.
5. Move in small behavior-preserving steps, each keeping the pin green. For an API reshape, migrate every caller and delete the old API in the same wave (`migrate-callers-then-delete-legacy-apis`). No shims, no parallel old-and-new paths. Grep every rename against strings, prose, and back-references.
6. Prove behavior is unchanged on the real artifact. For a larger reshape, a script that diffs old against new output, or a recorded baseline replayed against the new code.
7. Confirm the change earns its place. The measure is reader load (`minimize-reader-load`): fewer layers between question and answer, less hidden state, fewer one-consumer indirections. If the diff does not lower reader load somewhere, revert it.
8. Rebase into ordered commits. Subtraction, then reshape, then follow-on cleanup, so one revert undoes one slice. Run `ship`.

**Reply:** the structure that changed, the pin you held it against, the equivalence proof, the reader-load delta, what shipped and what you reverted. No new behavior.
