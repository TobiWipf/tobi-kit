# Deep modules

A module is deep when a small, simple interface hides a lot of functionality. It is shallow when the interface is nearly as complex as what it hides. Depth is the ratio. A shallow module costs its readers the interface and the implementation both, so avoid shallow modules unless the boundary buys something concrete: a test seam, a security boundary, a hard ownership line.

**Why:** Complexity is anything about the structure that makes the code hard to understand or change. It comes from dependencies and obscurity, and it accumulates one small increment at a time. Deep modules cut both. Callers learn one small surface and never the decisions behind it.

## Reader load

Measured from the reader's side, maintainability is the work a reader must do to understand code. Track two axes.

1. **Layers to trace.** How many indirections sit between the question and the answer.
2. **State to hold.** How much hidden or mutable context the reader must keep in their head.

LOC, cyclomatic complexity, and "clean architecture" are proxies. Reader load is the thing that matters. The two axes are independent. A flat file with 50 globals can be as hard to reason about as a 6-layer adapter stack. Guard both. This is the human analog of [Guard the Context Window](guard-the-context-window.md). Working memory is finite for readers too.

**Tells of a shallow module:**

- Callers coordinate several methods to complete one operation.
- Public options expose internal stages or implementation choices.
- Learning the interface does not spare the caller from learning the implementation.
- A class or file exists to hold one function that forwards to another.
- A wrapper with one caller, an adapter with no second implementation, or indirection introduced for a future that never came.
- A pass-through variable. A value threaded through layers that never use it, only to reach one that does.
- Conjoined methods. Two methods a reader cannot understand without flipping between them. They are one method.
- Overexposure. Callers must learn rarely used features to use the common ones.

**The pattern:**

- Pull complexity downward. When a decision has to live somewhere, put it inside the module, not on every caller. A module that is a little harder to write and much easier to use is the right trade.
- Define errors out of existence. Redesign the operation so the edge case is not special. `unset` on a missing key succeeds. `substring` clamps an out-of-range index. Fewer exceptions to handle is a smaller interface.
- Somewhat general-purpose beats special-purpose. Design the interface for the general problem you actually have, then implement only today's cases. General interfaces are smaller and deeper.
- Different layer, different abstraction. Adjacent layers that expose the same methods and arguments are pass-through layers. Collapse them.
- Information hiding. One design decision lives in one module. A representation, format, or protocol detail that shows up in two modules is leakage. Parse it into a domain type at the boundary and keep it there.
- Group by knowledge, not by execution order. Separate load, validate, transform, and save modules repeat the same invariants across four boundaries. That is temporal decomposition. One module owns the representation and every time it is touched.
- Shrink state scope. Prefer pure functions (returns over mutations), locals over fields, fields over module state, and module state over globals. Derive instead of sync.
- Move the consumer to the value. Kill a pass-through variable with a context the deep layer already has, or by moving the consumer closer to the producer. Threading a new signal through types, schemas, and pipelines is the `laziness-protocol` "question the threading" tell.
- Split a method only when each piece is understandable alone.
- Defaults make the common case a single call. Rare configuration goes behind a second, optional entry point, not into every caller's argument list.
- Name the invariant at the boundary, not in every consumer, so the reader learns it once.
- Before adding a layer or a piece of state, ask whether it reduces reader load somewhere else by at least as much.

**The tests:**

- "Can I describe this module's interface in a sentence and its implementation in a page?" Deep.
- "Does a caller need to know the implementation to use it correctly?" Shallow.
- "If I inline this module into its single caller, does anything get harder to understand?" If no, inline it.
- "Can a new reader answer 'where does X come from?' and 'what can change X?' in under 30 seconds?" If not, cut layers or cut state.

Source: Ousterhout, A Philosophy of Software Design. `architect/references/design-red-flags.md` turns this into a screening checklist.
