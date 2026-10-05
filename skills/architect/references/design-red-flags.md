# Design red flags

Screen every candidate before picking. A red flag is a reason to revise or reject the shape. Each flag is defined, with its fix, in `tobi-mode/principles/deep-modules.md`. Information leakage at the edges is also covered in `tobi-mode/principles/boundary-discipline.md`.

- [ ] **Shallow module.** The interface is nearly as complex as what it hides.
- [ ] **Information leakage.** One representation, policy, or protocol detail lives in two modules. Wire or storage types in the public surface count.
- [ ] **Temporal decomposition.** Modules split by execution order (load, validate, save) instead of by the knowledge they own.
- [ ] **Pass-through method.** Forwards the same arguments to a method of the same shape.
- [ ] **Pass-through variable.** Threaded through layers that never use it.
- [ ] **Removable special case.** A guard or branch that a small redesign would make ordinary.
- [ ] **Conjoined methods.** Two methods a reader cannot understand apart.
- [ ] **Overexposure.** The common case needs rarely used options.
- [ ] **Same abstraction on adjacent layers.** Two layers expose the same methods and arguments.

Record the result in the rationale's Red flags screened section. "None found" is valid once you have actually looked.
