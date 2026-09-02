---
name: reflect
description: After a long or corrected task, mine what generalizes and route it into a skill edit, a lint, or a script. Use for "reflect", "what did we learn", "capture this so it does not happen again", after a task with several dead ends, or after the user corrected your approach mid-task.
---

# Reflect

Turn what this session taught into something durable. A learning that lives in the transcript is lost. A learning that lives in a skill, a lint rule, or a script is applied next time without anyone remembering it.

## When

- The user said "reflect".
- A complex task landed and the recipe is worth keeping.
- You hit dead ends, found the path, and the path generalizes.
- The user corrected your approach.
- A workflow emerged that no skill captures.

Skip when the session was trivial, one-off, or already covered by a skill you followed correctly. One-offs are not learnings.

## Steps

1. **Collect candidates.** Walk the session. Corrections received. Steps that took several attempts. Facts you had to discover that the code or a skill should have told you. A routing that should have fired and did not. When the host has subagents, run two independent passes over the transcript or a digest of it, one for judgment (what went wrong in the reasoning) and one for tooling (what a script or check would have caught), and merge.
2. **Filter.** For each candidate ask: would this change a decision next time, in a different task? Drop anything that only applies here. Drop anything a skill already says. Drop taste.
3. **Route** each survivor to the strongest mechanism (`encode-lessons-in-structure`).
   - A structural fix. A lint rule, a type, a test, a check script, a hook. Prefer this whenever the rule can be enforced without judgment.
   - A one-line edit to an existing skill or principle. A tightened sentence, a stale fact, a missing bullet.
   - A description tweak so a skill triggers when it should have.
   - A new skill. Rare. Only when a real workflow has no home.
4. **Present before applying.** List Accepted (with the routing and the exact edit), Rejected (with the reason), and Backlog (worth doing, not now). Skill changes affect every future session. Wait for the user to pick.
5. **Apply** the approved edits. Run `scripts/check.sh` in the skills repo. Commit with `docs(skills): <what changed>`.

## Output

- Applied. `<path>`. One line each.
- Backlog. One line each.
- Dropped. One line per rejected candidate with the reason.

No preamble.
