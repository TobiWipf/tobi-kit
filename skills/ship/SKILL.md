---
name: ship
description: Turn work into small verified commits and, when the repo lands work through PRs, a PR a reviewer can trust. Use at every commit, for "ship it", "open a PR", "commit this", "write the PR description", or when asked how to structure commits. Follows the repo's git workflow, and asks for one and records it when the repo has none. Covers commit shape, Conventional Commits titles, and the PR body.
---

# Ship

The commit sequence is an argument. Each commit lands on its own and the order proves the work. The PR body tells a reviewer why, what, what it touches, and how you know.

## Repository rules

Git workflow differs per repository, so never assume one. Before committing in a repo whose rules you have not read this session, look for a `## Git workflow` section in its `AGENTS.md`, `CLAUDE.md`, or `CONTRIBUTING.md`.

- **Found.** Follow it. It overrides anything below.
- **Missing.** Ask once, batched, with a default for each question. Write the answers into the repo's `AGENTS.md` as `## Git workflow` and commit that on its own.

Skip any question the repo already answers through branch protection, CI config, or a PR template. Read those first. Ask the rest:

1. Where do commits go? Default: a branch off trunk, never trunk directly.
2. When do you push? Default: push the branch after each commit. Ask before pushing trunk.
3. How does work land? Default: a PR the user merges.
4. What does "review this" mean here? Default: run `review` locally and report. Post nothing to the PR.

## Before committing

Called from a playbook that already ran `no-comments` and `verify` on this diff? Skip to Commits.

1. `no-comments` over the diff. Apply its fix list.
2. `verify`. Evidence in hand for every claim the commit or PR will make.
3. Run the repo's lint and typecheck once.

## Commits

A commit is a checkpoint. One logical step, verified, that builds and passes checks on its own.

- Commit when a unit is verified, not at the end of the session. Never batch unrelated steps into one commit.
- Over about 200 changed lines? Find the logical split before committing. The subtraction apart from the reshape, a mechanical rename apart from the behavior change, one module apart from another. Do not split what cannot stand alone. A generated file or one codemod run can be large and still be one step.
- Order proves the work. Failing test (marked as an expected failure, per `tdd`), then fix. Subtraction, then reshape. Scaffold, then feature (`sequence-verifiable-units`).
- Amend when the fix belongs in the commit you just made and it is not pushed. New commit when it is separable.
- Never force-push a shared branch without asking.

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

Only when the repo's workflow lands work through PRs. Push with hooks on, then `gh pr create --base <branch>`, never as a draft. Prefer several narrow PRs to one large one. Stack them when they depend on each other. The root targets trunk, each child targets its parent branch. Post the URL and stop. Opening a PR does not start a review-watching loop. Run one only when asked, after the whole stack exists.

**Reply:** the commit list in order, the PR URL when there is one, and one line on anything left open.
