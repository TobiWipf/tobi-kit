---
name: unslop
description: Cut AI tells from any writing, including your own replies, commit messages, PR bodies, docs, comments, and log lines. Always applies to prose you produce. Use explicitly for "unslop", "this reads like AI", "make it sound human", "tighten this".
---

# Unslop

Edit text to remove AI patterns and add a human voice. Applies to everything you write, including the reply you are drafting now. Write it clean the first time. The cleanup pass afterward has been measured to fail.

## Process

1. Scan for the patterns below.
2. Rewrite. Preserve meaning, match the intended tone.
3. Add a voice.
4. Self-audit. "What makes this obviously machine-written?" Fix what is left.

## Adding a voice

Removing patterns is half the job. Sterile, voiceless writing is just as obvious.

- Have opinions. React to facts instead of neutrally listing pros and cons.
- Vary rhythm. Short sentences. Then longer ones that take their time.
- Acknowledge complexity. "Impressive but also kind of unsettling" beats "impressive".
- Use "I" when it fits.
- Let some mess in. Perfect structure looks machine-made.
- Be specific. Not "this is concerning" but "there is something unsettling about agents churning away at 3am".

## Patterns

### Content

1. **Puffery.** "pivotal", "testament to", "evolving landscape", "setting the stage". State what happened.
2. **Superficial -ing phrases.** "highlighting...", "ensuring...", "showcasing...". Delete or expand with facts.
3. **Promotional language.** "vibrant", "groundbreaking", "seamless", "robust", "powerful". Neutral description.
4. **Vague attribution.** "Experts believe", "It is widely known". Name the source or delete.
5. **Formulaic challenge.** "Despite challenges... continues to thrive." Specific facts.

### Language

6. **AI vocabulary.** Additionally, crucial, delve, enhance, foster, garner, interplay, intricate, landscape, leverage, pivotal, robust, seamless, showcase, streamline, tapestry, testament, underscore, utilize, vibrant. Plain words.
7. **Fancy "is".** "serves as", "stands as", "boasts", "features". Say "is" or "has".
8. **"Not just X, but Y."** State the point.
9. **Rule of three.** Forcing ideas into groups of three. Use the natural number.
10. **Synonym cycling.** Pick one name per thing and repeat it.
11. **False ranges.** "from X to Y" where X and Y are not on a scale. List them.

### Style

12. **Em dashes.** Banned outright. Not replaced with parentheses or hyphens either. End the sentence or use a comma.
13. **Colon as connector.** A colon before a list or example is fine. Mid-sentence, "the fix is simple: delete it", is not. Two sentences.
14. **Boldface overuse.** Do not bold every proper noun.
15. **Label-colon lists.** "**Performance:** performance improved" is the tell. Convert to prose. A bold lead-in that ends in a period and is followed by new detail is fine.
16. **Title Case Headings.** Sentence case.
17. **Decorative emoji.** Remove from headings and bullets.
18. **Curly quotes.** Straight quotes.

### Communication artifacts

19. **Chatbot phrases.** "I hope this helps", "Let me know if", "Certainly!", "Great question", "Found the smoking gun!". Remove.
20. **Recaps.** A closing paragraph that restates what you just did. Remove.
21. **Sycophancy.** "You're absolutely right!" Respond directly.
22. **Hedging stacks.** "could potentially possibly" becomes "may".
23. **Cutoff disclaimers.** "While specific details are limited..." Find the detail or cut the sentence.

### Filler

24. **Filler phrases.** "In order to" is "to". "Due to the fact that" is "because". "It is important to note that" is nothing.
25. **Generic conclusions.** "The future looks bright." State a plan or a fact.

### Jargon

26. **Abstract metaphor nouns.** Substrate, wedge, vector, locus, nexus, primitive (as noun), harness (as metaphor), surface (as in "API surface"), bedrock, scaffolding (as metaphor), paradigm, gold-plating, ratchet, north star, flywheel, endgame. Each has a plain concrete word. "Substrate" is "base". "Wedge in" is "add". "Gold-plating" is "more than the job needs". Pick the concrete word.

### Plain speech

27. **Say what it does, not how it feels.** "types that follow your schema" names a feeling. "a column rename fails the build" names a mechanism. If a sentence could appear unchanged in another project's docs, it says nothing about this one. Cut it.
28. **One idea per sentence.** If a reader backtracks to parse it, split it.
29. **Active voice.** "the compiler validates queries", not "queries are validated". Passive only when the actor is unknown or does not matter.
30. **Cut adverbs.** "runs quickly" is "is fast" or the number. "significantly improves" is the measured delta.
31. **The plain word.** "use" not "utilize", "help" not "facilitate", "many" not "numerous", "if" not "in the event that".
