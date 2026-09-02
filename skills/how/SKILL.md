---
name: how
description: Explain how a subsystem, feature flow, or function works by reading the code, at the level a senior engineer needs to start changing it. Use for "how does X work", a walkthrough before changing something, and placement questions ("where should this live", "which module owns this", "is this the right layer"). Critique mode adds an architectural review. Use `why` for motivation and history.
---

# How

Explore the codebase and answer "how does X work?" with a working mental model. Enough to change the code safely, not annotated source.

Two modes. **Explain** (default) explores and explains. **Critique** explains first, then looks for architectural problems.

## Explain

### 1. Parse the question and size it

"How does the rate limiter work?" is a subsystem. "How do we bill on-demand usage?" is a feature flow. "Walk me through a form submit" is a runtime trace. "Where should this live?" is a placement question.

State your best-guess interpretation and go. Do not ask. The user redirects if you are off.

Size it. **Simple** (one module, one utility, one function): explore and explain in one pass. **Complex** (several files or services, a cross-cutting feature, a full overview): split into two to four exploration angles and fan them out to subagents when the host has them, then synthesize. When in doubt, lean simple.

### 2. Explore

For each angle: glob the relevant directories, grep for the key types and entry points, then follow the thread. Callers, callees, data flow, type definitions. Read the code. Do not guess from file names. Stop when you can describe the full path from input to output without hand-waving a step. Note what is surprising or what a newcomer would get wrong.

Explorers return structured findings: components found, flow traced, files read, anything non-obvious. Overlap is fine. The synthesis reconciles it.

### 3. Write the explanation

Use this shape, adapted to the question. Drop a section that does not apply.

**Overview.** One or two paragraphs. What it is, what it does, why it exists. Enough to decide whether to keep reading.

**Key concepts.** The types, services, or abstractions needed to follow the rest. Brief. Not exhaustive.

**How it works.** The core. What triggers it, what happens step by step, where data goes, the decision points. Prose, not pseudocode. Cite `file:line` so the reader can look. No code dumps unless a snippet is the fastest way to show it.

**Where things live.** The files a person needs to start working here. Not every file.

**Gotchas.** Non-obvious things that would trip someone. History that explains why something looks odd. Known sharp edges.

Write it through `unslop`. Cite real paths. Never invent a symbol or a caller.

## Critique

For "are we sure?", "what is wrong with this design", "should this be restructured".

1. Run Explain in full. You must understand the architecture before you judge it.
2. Screen it against `architect/references/design-red-flags.md` and the `deep-modules`, `minimize-reader-load`, `model-the-domain`, and `boundary-discipline` principles. When the host has subagents, spawn two or three independent critics with the explanation and the file paths, on different models when you can, and merge their findings. Agreement across critics is high-signal.
3. Judge as a pragmatic lead, not an aggregator. Sort findings into **Act on** (worth fixing now), **Consider** (real, cost unclear), **Noted** (valid, low priority), **Dismissed** (wrong, missing context, or taste). One line of rationale each.

Present the explanation first, the verdict below it. Someone who only wants to understand the system should not wade through critique.

**Reply:** the explanation, then the critique verdict when asked for one.
