---
name: grill
description: Take the user's approach apart and find out whether it is the right one, before anything is built. Stress-tests a plan, design, or decision the user already has, against its assumptions and against real alternatives, and ends in a verdict. User-invoked only, for /grill, "grill me", "stress-test this", "poke holes in my plan", "is this the right approach". For a goal with no approach yet, use `wayfinder`.
disable-model-invocation: true
---

# Grill

The user has an approach and wants to know if it holds. Your job is to take it apart, not to agree with it. The outcome is one of three: keep it, adjust it, or go a different way. You own the facts. They own the decisions.

Invoking this skill suspends Autonomy. No default taken on their behalf, no code, no files, until the verdict is given and the user confirms.

No approach yet, only a goal and no idea how to get there? That is `wayfinder`, not this. Say so and stop.

## Open

Restate in two lines what the approach is and what it is for. The goal matters more than the approach. An approach is only right relative to the need it serves.

Then find what it rests on. The load-bearing assumptions, the ones that would sink the approach if wrong. And sketch one or two structurally different ways to meet the same goal. Not flavors of the user's approach. A real alternative is what makes "is this right?" answerable.

## The tree and the frontier

Map the open questions as a tree. Each question branches into the ones that depend on its answer. The frontier is every open question whose prerequisites are settled, the questions you can ask now without guessing at an answer you have not heard.

## Rounds

Ask the whole frontier in one round, then wait. The first round tests the restatement and the riskiest assumptions.

```
**Q1. <title>.** <the question, with options when there are real ones>
→ <your recommended answer>. <the one reason that decides it>.
```

- One to three sentences per question. Long questions tire the user and hide why you are asking.
- Open each round with one line naming the answer that unlocked it, so the chain from decision to decision stays visible.
- A question that depends on another question in the same round waits for the next round.
- A round answered "agreed" throughout is a warning, not progress. Name the recommendation you are least sure of and ask again.

After the answers, recompute the frontier and ask the next round.

## Facts are yours

Never ask the user for something you can look up. Code questions go to `how`, history to `why`, outside docs to a subagent. Do not hold the round for a lookup. Only the questions that depend on it wait. Ask the rest now.

Some questions talk cannot settle: how it should look, how it feels, whether it is fast enough. Stop grilling that branch. Run the Prototype playbook, show the result, and ask the question again in one line.

## Too big

Still growing after four or five rounds? There is no single approach to judge yet, only a goal with an unclear route. Say so, and offer to hand it to `wayfinder` with what is settled so far.

## Verdict

The frontier is empty. Every assumption tested, every alternative weighed. Give the verdict.

- **Keep.** The approach holds. Name the assumption that came closest to sinking it.
- **Adjust.** The approach holds with changes. List them.
- **Change course.** An alternative wins. Name it and the one reason it beats the original.

List the decisions, one line each, and ask the user to confirm. Then hand off. A software plan goes to `scope`, whose predicate and constraints the decisions now fill.

**Reply:** each round in the format above. At the end, the verdict, the decision list, and the hand-off.
