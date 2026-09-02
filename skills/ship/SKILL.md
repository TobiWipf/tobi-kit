---
name: ship
description: Turn finished work into small ordered commits and a PR that a reviewer can trust. Use at the end of every task, for "ship it", "open a PR", "commit this", "write the PR description", or when asked how to structure commits. Covers commit shape, Conventional Commits titles, and the PR body.
---

# Ship

The commit sequence is an argument. Each commit lands on its own and the order proves the work. The PR body tells a reviewer why, what, what it touches, and how you know.

## Before committing

1. `no-comments` over the diff.
2. `verify`. Evidence in hand for every claim the PR body will make.
3. Run the repo's lint and typecheck once. Push with hooks on.

## Commits

- Commit liberally while working. Rebase into small, ordered commits before opening the PR.
- Each commit lands alone and reads as one step. Failing test, then fix. Subtraction, then reshape. Scaffold, then feature (`sequence-verifiable-units`).
- Amend when the fix belongs in the commit you just made. New commit when it is separable.
- Prefer several narrow PRs to one large one. Stack them when they depend on each other. The root targets trunk. Each child targets its parent branch.
- Work on a branch off trunk. Never commit to `main` directly. Never force-push a shared branch without asking.

## Titles

Conventional Commits. `type(scope): subject`. Types: `feat`, `fix`, `refactor`, `perf`, `test`, `docs`, `chore`. Scope is the changed area. Subject is short, imperative, names a real symbol when one carries the change. No trailing period.

`fix(export): dedupe rows when a retry lands mid-run`

A commit body does not restate its subject. It says why, when why is not obvious.

## PR body

Write it with `technical-writing` (every layer except Diátaxis) and `unslop`. These sections, in this order. Drop a section that would be empty. No `## Summary`, no `## Test plan` boilerplate.

- `## Why`. The intent and why this approach fits. One paragraph.
- `## Scope`. Facts from the diff. Real symbols and paths. Both sides of a rename. What is in and what is out when the boundary matters.
- `## Tradeoffs`. Real choices only. What you accepted in exchange for what. Any `tobi:` markers you left and their ceilings. Skip when there are none.
- `## Blast radius`. Who and what the change touches. Why it is safe, or where it is risky. Link the `blast-radius` proof when you ran one.
- `## Verification`. How you ran each check and what it showed. The command, the surface, the outcome. Not just the command name. Screenshots or recordings when they prove a claim.

## Opening

`gh pr create --base <branch>`, never as a draft. Post the URL and stop. Opening a PR does not start a review-watching loop. Run one only when asked, after the whole stack exists.

**Reply:** the PR URL, the commit list in order, and one line on anything left open.
