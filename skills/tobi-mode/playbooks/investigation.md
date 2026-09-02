### Investigation

**You own the answer. Read, route, write.**

Read-only requests. "How does X work?", "why was Y built this way?", "are we sure about Z?", "should we do X or Y?". They produce a cited explanation or a recommendation, not a code change.

1. Route through `how` (Explain mode for a narrow question, Critique mode for "are we sure?"). For a motivation question, also `why`.
2. Produce the `how`-shaped output (Overview, Key concepts, How it works, Where things live, Gotchas), or a recommendation with a tradeoffs table when the request is a choice between alternatives.
3. Apply `unslop` to the reply.

No commit, no PR, no `architect`, unless the investigation precedes a code change. If it does, say so and re-route to Bug fix or Feature.

**Reply:** the investigation output. For "are we sure?", include your real judgment with reasons. Push back if the premise is wrong.
