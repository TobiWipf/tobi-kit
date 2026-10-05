# Review rubric

Review through whichever lenses apply. Not every lens fits every change. Read the surrounding code before judging. A diff alone cannot show whether a guard is redundant or a caller can pass null.

## Correctness

Digest of `make-operations-idempotent`, `separate-before-serializing-shared-state`. Edit a principle, update this lens.

Does the code do what the intent says?

- Edge cases: empty inputs, nil or undefined, boundary values, concurrent access.
- Error handling: caught, propagated, or silently swallowed?
- Off-by-one, type coercion, overflow, encoding.
- State: races, stale closures, dangling references.
- Happy path and sad path both work?
- Idempotency: what happens if this runs twice, or if the previous run crashed halfway? "Depends on what state was left" means a missing reconciliation step.
- Concurrency: if several actors can touch the same mutable state, is access serialized structurally or by a convention that will not hold?

When you find a potential bug, trace the execution path. Show the call chain that makes it fail.

## Root cause or symptom

Digest of `fix-root-causes`, `encode-lessons-in-structure`. Edit a principle, update this lens.

Is the code fixing the problem or papering over it?

- A guard that masks an invariant violation.
- Retry logic that hides a broken contract.
- A cast that silences a modeling error.
- A fix in module A that belongs in module B's contract.
- A comment or convention ("don't call this twice") where a type, lint, or runtime check could make the wrong thing impossible.

Ask why the workaround is needed. Name the proper fix and its layer.

## Structure

Digest of `deep-modules`, `boundary-discipline`, `model-the-domain`, `foundational-thinking`, `outcome-oriented-execution`. Edit a principle, update this lens.

Does the code fit the system it lives in?

- Boundary discipline: validation once where data enters, then trusted, or scattered through business logic?
- Interface depth: does each new module hide more than its interface costs? Pass-through layers, one-caller wrappers, and modules split by execution order are shallow.
- Coupling: does this add dependencies that make the next change harder?
- Data model fit: do the structures match the access patterns, or does the code fight them at every turn?
- Bolted on or integrated: if the requirement had been known from the start, would the code look like this?
- Legacy dual paths: a new API with the old one kept alive for no external consumer. Migrate callers and delete in the same wave.

Do not penalize simple code for lacking abstraction. Premature abstraction is worse than duplication.

## Verification

Digest of `prove-it-works`, `sequence-verifiable-units`. Edit a principle, update this lens.

Can you tell it works from reading it?

- Tests that test behavior, not implementation.
- A regression test for a bug fix. A pin for a refactor.
- The full path exercised for an integration boundary.
- The real thing checked, not a proxy (file mtime, cached state, a delegate's summary).

## Complexity budget

Digest of `laziness-protocol`, `subtract-before-you-add`, `experience-first`. Edit a principle, update this lens.

Is the complexity justified by what the code accomplishes?

- Code that could be simpler without being wrong.
- An abstraction serving one call site. Configuration for cases that do not exist.
- Dead code, unused imports, vestigial parameters, "just in case" paths.
- Compatibility scaffolding for a migration that is done.
- Hand-rolled stdlib. A dependency for what the platform does.
- Does the user experience justify the complexity? Every option earns its place. Half-finished features are worse than missing ones.

Simpler is better unless simpler is wrong. Three lines of duplication beat a premature abstraction.

## Security

Flag only what you can trace through the code. "This could be an injection vector" without the input path is not a finding.

- User input reaching SQL, shell, eval, or innerHTML without sanitization.
- Auth or authorization gaps in new endpoints.
- Secrets in code, logs, or error messages.
- Time-of-check versus time-of-use in security-critical paths.
