### Prototype

**You own the decision, not the code. The prototype is a throwaway instrument. The real build follows Feature.** For "prototype", "mock it up", "sketch this", "try this layout", or settling an empirical fork (which behavior, which timing, which approach) by observing it run instead of asking the human.

The one playbook where "smallest change" and the verification bar invert. Speed over polish. Code quality does not matter. The rigor is in picking the right design cheaply. Be bold. Propose variations the user did not ask for, throw one away and try another.

1. Scope the decision the prototype exists to make. No decision means no prototype. Route to Feature.
2. Gather references when the design space is open. Prior art, a few directions to choose between. Skip when the direction is set.
3. Build throwaway in a scratch directory outside production source. For a visual decision, the lightest stack that renders the idea. For a behavioral or timing decision, the smallest script that exercises the question. No production framework, no tests, no abstractions.
4. When comparing alternatives, build them behind one switcher, each variant labeled so the user can name it (`exhaust-the-design-space`, made cheap).
5. Observe the thing you are deciding. Screenshot each variant, log the timing, print the output. The observation is the test.
6. Present alternatives, tradeoffs, and a recommendation. Hand the chosen direction to Feature, or to `architect` for the shape.

**Reply:** the variants, the evidence, the tradeoffs, your recommendation, the scratch path. Say plainly that the prototype is throwaway.
