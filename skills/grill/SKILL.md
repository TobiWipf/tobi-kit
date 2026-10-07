---
name: grill
description: Interview the user in rounds until a plan, design, or decision is settled, before anything is built. User-invoked only, for /grill, "grill me", "stress-test this", "poke holes in my plan".
disable-model-invocation: true
---

# Grill

The user wants to think, not to watch you build. Interview them until every decision the plan rests on is settled and nothing is silently assumed. You own the facts. They own the decisions.

Invoking this skill suspends Autonomy. No default taken on their behalf, no code, no files, until the frontier is empty and the user confirms.

## The tree and the frontier

Map the plan as a tree of decisions. Each decision branches into the ones that depend on it. The frontier is every open decision whose prerequisites are settled, the questions you can ask now without guessing at an answer you have not heard.

## Rounds

Ask the whole frontier in one round, then wait.

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

Still growing after four or five rounds? The scope is too large for one session. Say so, and offer to split it and grill the first piece.

## Done

The frontier is empty. Every branch visited, nothing assumed. List the decisions, one line each, and ask the user to confirm. Then hand off. A software plan goes to `scope`, whose predicate and constraints the decisions now fill.

**Reply:** each round in the format above. At the end, the decision list and the hand-off.
