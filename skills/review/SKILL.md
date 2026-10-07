---
name: review
description: Adversarial code review that hunts for bugs, wrong-layer fixes, and above all what to delete. Independent reviewers on different models when available, then a lead verdict sorted into act on, consider, noted, dismissed. Use for any code review request, /review, "review this", "review for over-engineering", "what can we delete", "tear this apart", "find blind spots", or before shipping a contested or large diff. For what a change breaks outside the diff, use `blast-radius`. Reports only, applies nothing.
---

# Review

Several reviewers try to break the diff from independent angles. The lead filters their findings with full context and hands back a verdict. The diff's best outcome is getting shorter.

The deliverable is the verdict. Do not auto-apply changes.

## 1. Scope

First read the repo's `## Git workflow` section for what review means here (a local verdict, PR comments, a requested reviewer) and follow it. Missing? Ask with the default, local verdict and nothing posted, and record the answer per `ship`.

From context. The files or diff the user pointed at. Otherwise `git diff <base>...HEAD` plus the working tree, base `main` unless the branch says otherwise. Package the diff plus the surrounding files a reviewer needs to understand it.

## 2. Intent

One paragraph. What is this code trying to accomplish, from the user's message, the commit messages, the PR body, and the code. Reviewers judge whether the work achieves the intent well, not whether the intent is right. Unsure of the intent? Write your best guess, mark it *assumed*, and proceed. The Intent section is where the user corrects it. Ask first only when there is no commit message, no PR, and no conversation to read it from.

## 3. Reviewers

When the host has subagents, spawn two to four in one message, read-only, each on a different model family when the host allows. Every reviewer gets the same brief: the intent, the diff, `references/rubric.md`, and the instruction to read surrounding code (callers, callees, types) before judging. The signal comes from model diversity, not from assigned personas. Agreement across reviewers is high-confidence. A lone finding is worth reading, weighted lower.

Without subagents, review it yourself in two passes with the rubric, once for correctness and once for what to delete, and say that the diversity signal is missing.

Each reviewer returns findings in this shape, one line each, then a one-line summary.

`<file>:L<line>: <tag> <what>. <fix or replacement>.`

Tags:

- `bug:` a traced execution path that produces wrong behavior. Show the path, not "this could be nil".
- `symptom:` a guard, retry, cast, or fallback that papers over a deeper contract violation. Name the real fix and its layer.
- `delete:` dead code, unused flexibility, speculative feature, obsolete compatibility path. Replacement is nothing.
- `stdlib:` a hand-rolled thing the standard library ships. Name the function.
- `native:` a dependency or code doing what the platform already does. Name the feature.
- `yagni:` an abstraction with one implementation, config nobody sets, a layer with one caller, a wrapper that only forwards.
- `shrink:` same logic, fewer lines. Show the shorter form.
- `shallow:` a module whose interface is as complex as what it hides, a pass-through layer, temporal decomposition, information leaking across modules. Per `architect/references/design-red-flags.md`.
- `boundary:` validation scattered inside instead of at the edge, or external data trusted without parsing. Per `boundary-discipline`.
- `type:` an illegal state the types allow, a lying cast, a non-exhaustive match, a primitive that should be branded. Per `type-system-discipline`.
- `verify:` a claim the diff does not prove. Missing regression test for a bug fix, a proxy checked instead of the real thing, a behavior-changing refactor with no pin.
- `security:` only with the input path traced to the sink.

## 4. Synthesize

Parse every finding. Merge duplicates and note which reviewers raised each. Consensus first. Note explicit disagreements between reviewers. They tell the user where judgment is needed.

## 5. Lead judgment

You are a pragmatic senior engineer with the full context the reviewers lacked. Read `references/lead-judgment.md`. Sort every finding.

- **Act on.** Real issues affecting correctness, security, or maintainability given the actual goal. These would block a real PR.
- **Consider.** Legitimate, but you are not sure it outweighs the cost right now.
- **Noted.** Valid but not actionable now.
- **Dismissed.** Wrong, taste, hypothetical, or missing context. Say why in one line. This section is how the user overrides you.

Calibration lives in `references/lead-judgment.md`. A single smoke test or `assert`-based self-check is the minimum, not bloat. Never flag it for deletion.

## Output

### Intent
> The paragraph from step 2.

### Reviewers
One bullet per reviewer. Model or "self", finding count.

### Act on
Each with the tag line, who raised it, why it matters.

### Consider
Each with the tag line, who raised it, the tradeoff.

### Noted
Brief list.

### Dismissed
Each with a one-line reason.

### Agreement
Where reviewers agreed, where they diverged, what the pattern says.

### Net
`net: -<N> lines possible` from the delete, stdlib, native, yagni, and shrink findings in Act on and Consider. Dismissed and Noted findings do not count. If the diff is already lean, say `Lean already. Ship.`

**Reply:** the verdict above. Apply nothing.
