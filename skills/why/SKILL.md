---
name: why
description: Find out why code is the way it is, from history and the record rather than from the code alone. Use for "why was this built this way", "why is this flag off", "what were they thinking", "did we try X before", regression history during a bug hunt, or when a design must respect an old decision. Use `how` for mechanism.
---

# Why

`how` tells you what the code does. `why` tells you why it is shaped that way. The answer lives in the record, not the code, so read the record.

## Sources, cheapest first

1. **Git.** `git log -S '<symbol>' --oneline`, `git log --follow <file>`, `git blame -L<a>,<b> <file>`, then the commit messages and diffs that introduced or last changed the shape. Look for the commit that added the odd thing and the one before it. Reverts are the loudest evidence.
2. **Pull requests.** `gh pr list --search '<term>'`, `gh pr view <n> --comments`. The review thread is where the alternative was rejected.
3. **Linked issues and tickets.** Anything the commits or PRs reference. The issue tracker MCP if one is connected.
4. **Docs in the repo.** ADRs, RFCs, `docs/`, READMEs near the code, comments that cite an issue.
5. **Chat and incident history.** Only when the repo record runs dry and the host has a chat or error-tracker MCP. Search the symbol or feature name. Postmortems explain more odd guards than any commit message.

Stop when the question is answered or the sources are exhausted. Do not run every source for a narrow question.

## Posture

- A search that finds nothing is a finding. Say "no record found" instead of inferring a reason.
- Separate what the record says from what you infer. Mark inferences as such. Hedges here are findings, not style.
- Cite each claim. A commit SHA, a PR number, a `file:line`, an issue id, a permalink. Never a fabricated one.
- When a source is unavailable (no MCP, no access), say so and move on.

## Output

- **Answer.** One or two sentences. Confidence stated plainly.
- **Evidence.** The cited trail, in the order you found it.
- **What this constrains.** If a change is planned, name what the old rationale still requires, and what it no longer does because the conditions changed.
- **Not found.** The sources you checked that had nothing.

Write it through `unslop`.

**Reply:** the four sections above. Short when the answer is short.
