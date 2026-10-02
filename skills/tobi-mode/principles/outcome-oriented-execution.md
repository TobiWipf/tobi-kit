# Outcome-Oriented Execution

Optimize for the intended, verifiable end state rather than preserving smooth intermediate states.

**Why:** Keeping every intermediate step fully stable often creates temporary compatibility code that becomes long-lived debt. Converge on the target architecture and prove correctness at explicit verification boundaries. Keeping both old and new paths creates dual-path complexity, slows cleanup, and makes the codebase feel append-only.

**Core rule:**
- Prioritize end-state integrity over transitional stability
- Intermediate breakage is acceptable when it is planned, scoped, and reversible
- Always run final verification before declaring done

**Migrate callers, then delete the legacy API.** When a new internal API is the right design, migrate callers and remove the old API in the same wave.
- Do not keep a legacy path alive only because internal callers still exist
- Inventory callers, migrate them, and delete the old API immediately
- Treat temporary adapters as exceptional and time-boxed, not default architecture
- Update tests to assert the new contract, and delete tests that only protect pre-refactor implementation details

**Guardrails:**
- Use this for planned rewrites, migrations, and API reshapes with explicit phase boundaries
- Applies when no external users depend on backward compatibility and the project can absorb coordinated breaking changes
- Declare where temporary breakage is acceptable
- Keep high-signal checks for actively touched areas while migrating
- Require full static and runtime verification at plan completion
