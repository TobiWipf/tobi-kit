# Design red flags

Screen every candidate before picking. A red flag is a reason to revise or reject the shape. Source: Ousterhout, A Philosophy of Software Design, plus the `deep-modules`, `minimize-reader-load`, and `boundary-discipline` principles.

## Shallow module

A shallow module exposes a large interface while hiding little complexity. Judge depth by the capability and policy hidden behind the public surface relative to the size of that surface. Prefer a simple interface backed by substantial behavior.

Do not confuse a deep module with a deep call chain. A deep call chain scatters understanding across layers. A deep module concentrates capability behind one interface.

Signs:

- Callers coordinate several methods to complete one operation.
- Public options expose internal stages or implementation choices.
- Learning the interface does not save the caller from learning the implementation.
- A class, file, or module exists to hold one function that forwards to another.

## Information leakage

Information leakage makes multiple modules depend on the same internal decision. A representation, policy, or protocol detail appears in more than one place, so changing it requires coordinated edits.

Public re-exports of transport or wire types are leakage. Parse external data into domain types behind the interface. Keep storage schemas, framework objects, and protocol details private.

## Temporal decomposition

Temporal decomposition organizes modules by execution order instead of by the knowledge they own. Separate load, validate, transform, and save stages repeat one representation and its invariants across several boundaries.

Group code around domain knowledge and ownership. Methods that run at different times still belong to one module when they protect the same decisions.

## Pass-through method

A pass-through method forwards the same arguments to another method with the same shape. It adds a layer without hiding complexity.

Remove it or move responsibility to the module that can complete the operation. Keep a forwarding boundary only when it adds policy, adaptation, or a distinct abstraction.

## Pass-through variable

A value threaded through several layers that never use it, only to reach one that does. Each layer now knows about a thing it does not care about.

Look for a shared context object the deep layer already has, or move the consumer closer to the producer. Threading a new signal through types, schemas, and pipelines is the `laziness-protocol` "question the threading" tell.

## Special case the design could remove

An edge case handled by an exception, a guard, or a special branch when a small redesign of the operation would make the case ordinary. `unset` on a missing key that succeeds instead of throwing. `substring` that clamps instead of raising. A default value instead of an optional field.

Define the error out of existence before you handle it. Fewer exceptional paths is a smaller interface and fewer branches to keep in sync.

## Conjoined methods

Two methods that cannot be understood independently because each assumes the other's internal behavior. Splitting a method only helps when the pieces are separately understandable. If a reader must flip between them, they are one method.

## Overexposure

An interface that forces callers to learn rarely-used features to use common ones. Defaults should make the common case a single call. The rare configuration belongs behind a second, optional entry point, not in every caller's argument list.

## Same abstraction on two adjacent layers

Two layers that expose the same methods and arguments. Each layer should change the abstraction. If the layer below already offers what the layer above offers, one of them is a pass-through layer. Collapse it.
