---
name: typescript
description: TypeScript rules for any .ts or .tsx file. Discriminated unions over optional-field bags, branded primitives, unknown over any, no as casts, exhaustive matches, parse at the boundary, schema-derived types. Grounds the type-system-discipline principle in syntax. Use when reading or editing TypeScript.
---

# TypeScript

Apply the `type-system-discipline` principle first. This skill grounds it in TypeScript syntax. Examples in `references/patterns.md`.

| Rule | Summary |
|------|---------|
| Discriminated unions | Model variants with a `kind` literal so impossible states cannot be represented. No optional-field bags. `{ completed: boolean; completedAt?: Date }` admits nonsense. |
| Branded types | Brand primitives with `& { readonly __brand: "X" }` so a `UserId` cannot be passed where an `OrderId` goes. Validate once at the boundary. |
| Constructive modeling | Build the shape so the illegal value cannot be constructed. `[T, ...T[]]` for non-empty. `start` plus `duration` for a range. Not a runtime guard. |
| Simplest total type | Keep `T[]` while every operation on it stays total. Strengthen to `NonEmpty<T>` only where the loose type forces `!`, a cast, or a "should never happen" throw. |
| `unknown` over `any` | External data is `unknown`. `any` disables checking everywhere it touches. |
| Schemas before guards | Before hand-writing a type guard, use the repo's runtime schema library and infer the type (`z.infer`). |
| No `as` casts | Every `as` is a runtime crash waiting. Cast only after validation. `satisfies` when you want the check without widening. |
| Narrowing hierarchy | Discriminant switch, then `in`, then `typeof` or `instanceof`, then a user-defined guard, then `as`. |
| Type guards tell the truth | A lying `isX` is worse than `as`. The bug hides behind a name that says safe. |
| Exhaustiveness | `const _exhaustive: never = x` in the default arm so a new variant fails compilation. |
| Boundary validation | Parse where data crosses in, into a named domain type. `Record<string, unknown>` stops at that parse. Trust types inside. Per `boundary-discipline`. |
| Derive, do not duplicate | `Pick`, `Omit`, `Parameters`, `ReturnType`, `Awaited`, `typeof`, schema inference, before declaring a parallel interface. |
| Object args | Pass an object, not positional args, when there are more than two. Skip on hot paths. |
| Real tests | Do not mock what you can run. Mock only what you cannot run locally. |
| No `console.log` in shipped code | Structured logger with enough context to debug from an id. |
