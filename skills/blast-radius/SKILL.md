---
name: blast-radius
description: Find what a change could break somewhere else before it ships, beyond the diff, and prove the one fact it is safe because of by running real code instead of writing it up. Use for "blast radius of X", "what could this break", "is this safe to ship", or any question about effects outside the diff.
---

# Blast radius

Find what a change breaks somewhere else, before it ships. Companion to `how` and `why`. `how` tells you what the code does. `why` tells you why it is shaped that way. Blast radius tells you what it breaks somewhere else.

Listing the callers is not the job. You can grep those in a second. The job is the breakage grep will not show you.

## Do not trust your own writeup

A blast-radius writeup that sounds right is worthless. It reads as convincing whether or not it is true. So do not hand back the writeup. Find the one or two facts the whole thing depends on and prove them by running code. Words are where you start, not what you ship.

### How sure are you

Grade each fact the change's safety depends on with the evidence ladder in `tobi-mode/principles/prove-it-works.md`, and say where it stopped. Any safety fact you cannot get to step 4, say so out loud. Step 4 is usually one small script that imports the same library the app ships and calls the exact function you are worried about.

## Steps

1. Read the change. The diff, the symbols it adds, changes, and deletes, and what it now does differently, including the part the diff does not spell out. Use `why` to pull the PR and commits when there is one.
2. Find the one fact it is safe because of. Most changes that look scary are safe because of a single fact, like "this call only drops already-dead cache entries and does nothing else". Find that fact. If it holds, most of the scary cases die at once. Spend your time here, not on a long list of maybes.
3. Look where grep stops. Read the source of the library you call, and check its pinned version and any local patch. Work out when things run: microtasks, unmount and teardown, one framework's lifecycle against another's. Follow what a symbol search misses: the JSON an API returns, a DB column, a wire format, another language reading the same bytes, a feature flag, code three hops downstream.
4. Be honest about each risk. Give it a real chance of happening and a real cost if it does. Keep the risks you confirmed. List the ones you checked and cleared separately. Cite a real `file:line`. A search that finds nothing is still an answer. Never make up a caller or an API.
5. Prove the one fact. Write a script or test that runs the real code, run it, and paste what happened. If you cannot prove it cheaply, mark it unproven. Do not round up.
6. For a big or wide change, ask two or three subagents the same question when the host has them, and merge the answers. Different reviewers catch different real bugs.

## What to hand back

- **What it does.** What changed, including the part that is not obvious.
- **The one fact it is safe because of.** State it, say which step you got it to, and show the proof. If you could not prove it, write unproven.
- **Risks.** Only the real ones. Each names how it breaks, the `file:line`, how likely and how bad, and how to check. Paste the proof for the ones that matter.
- **Cleared.** What you checked and why it is fine.
- **Before you merge.** The cheapest test or repro that catches the real bug, including the script you wrote. If the safety fact can regress, the script becomes a test. Otherwise it stays in scratch and its path goes here.

Write it through `unslop`. Cite real code.

**Reply:** the writeup above, with the one safety fact either proven or marked unproven.
