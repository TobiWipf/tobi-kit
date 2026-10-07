### Feature

**You own the design. Scope, shape, build, prove.**

1. `scope`. The done-predicate, the constraints the code imposes, what is out. Rung 1 of the ladder lives here. If a smaller ask covers the need, say so before building.
2. `how` over the affected area.
3. `architect` when the change crosses a function boundary. Skipping stays visible as `architect skipped: <reason>`. Do not fold the design decision silently into implementation.
4. Name the data shape and its organizing structure before writing logic (`model-the-domain`). A state machine over scattered booleans, a table or registry over branching, a typed model over repeated shape assumptions.
5. Build the smallest diff that meets the predicate. Subtract first (`subtract-before-you-add`). Reuse what exists (ladder rung 2). Comments per the mode's Comments section. When you fan out to subagents, give each its own write target (`separate-before-serializing-shared-state`) and review every diff yourself.
6. `verify` on the matching surface. "Inconclusive" or a different surface is not a pass.
7. Commit each verified unit as a checkpoint, per `ship` (`sequence-verifiable-units`).
8. If the design is contested or the diff is large, `review` before shipping.
9. Run `ship`.

**Reply:** what you built and for whom, what you chose and why, what you skipped and when to add it, open decisions. A table for design alternatives when there were real ones.
