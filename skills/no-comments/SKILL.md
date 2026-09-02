---
name: no-comments
description: Strip comments that narrate, apologize, or justify workarounds, and flag the code they were covering for. Run before review on any diff, or for "no comments", "clean up the comments", "strip comments", "too many comments". Deletes comments, never edits application code.
---

# No comments

Comments that describe what the code does are a confession that the code does not say it. Delete the comment. Then decide whether the code needs to change so the comment is not missed.

Authoring agents defend their comments. So the pass runs with fresh eyes. When the host has subagents, spawn one with this file as its brief and the scope, and act on its report. Otherwise do the pass yourself after the diff is finished, not while writing it.

## Scope

The caller's files or diff. Otherwise the current diff against the base branch, working tree included. Never widen the scope to fix comments elsewhere.

## Keep list

Only these survive. When you are not sure a clause applies, the comment goes.

- Legal or license headers.
- Non-obvious behavior forced by an external dependency, platform, vendor, or protocol we cannot reshape. A surprise in our own code is not this. Delete the comment and flag the symbol `reshape` so the behavior becomes obvious without prose (rename, extract, type, restructure).
- `// prettier-ignore` and a lint suppression whose rule is faulty, pedantic, or style-only.
- A doc comment that defines a public API contract.
- An issue or RFC link that explains a constraint code cannot express.
- A `tobi:` corner-cut marker with its ceiling and upgrade path.

## Kill list

Everything else. In particular:

- Narration. `// loop over the users`, `// Phase 1: add cards`, `// return the result`. The code says it. A test's assertion message or a log string is the only doc a phase needs.
- Banners and section dividers.
- Commented-out code. Git has it.
- Workaround sermons. `// this is a hack but`, `// fine for now`, `// too risky to change`. A justification longer than the code it excuses means the code is wrong. Delete the comment and flag the symbol `root-cause` for the fix the comment was avoiding.
- `IMPORTANT`, `do not remove`, `NOTE`. Scent, not conviction. Read the nearby code. When the claim is not obvious there, run `how` or `why` on the symbol. A constraint that proves real and external gets encoded (a type, a test, a lint rule) and the comment deleted. A constraint that proves internal gets the `reshape` flag. Unproven gets deleted.
- `eslint-disable`, `@ts-ignore`, `@ts-expect-error`, and similar. Look up the rule. When it catches real bugs or protects correctness, kill the suppression and flag the symbol `root-cause`.
- Stale comments that describe a previous version of the code.
- TODOs with no owner, issue, or trigger. A TODO that names a trigger converts to a `tobi:` marker. The rest go.

## Steps

1. Walk every comment in scope against the two lists. Delete kills. Never polish a kill into a shorter alibi.
2. For each `reshape` or `root-cause` flag, apply the smallest in-scope fix that makes the comment unnecessary. A rename, a dropped parameter, the real API instead of the workaround. When the fix needs a new shape, run `architect` once for the set and implement. When the root cause is out of scope, apply the smallest in-scope fix and report the rest open.
3. For each constraint comment that proved real, offer the cheapest encoding (type, runtime check, test, lint). Encode it, then delete the comment. When encoding is out of scope, delete the comment and report the constraint open.
4. Report. Files touched, deletions, flags with one line each, fixes applied, constraints encoded, constraints left open, keeps and the clause that saved each.

## Boundaries

Never write application code beyond the flagged fixes. Never restore a deleted comment without a keep-list clause and proof the clause applies. Never touch files outside scope.

**Reply:** the report from step 4. Short.
