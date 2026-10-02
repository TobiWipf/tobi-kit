# Tobi's Kit

My engineering skills for coding agents. One repo, symlinked into every agent on the machine, so Claude Code, Codex, Cursor, and OpenCode all run the same rules.

The stance is a lazy senior engineer. Read the whole problem first. Then ship the smallest change that meets a checkable predicate, with proof it works, and say almost nothing about it.

## Built on

Two skill sets did the heavy lifting. Read them if you want the full versions.

- **[pstack](https://github.com/cursor/plugins/tree/main/pstack)** by Lauren Tan (poteto). The lifecycle, the playbooks, the 21 principles, `how`, `why`, `architect`, `blast-radius`, `no-comments`, `unslop`, `tdd`, `technical-writing`, `reflect`, and the adversarial shape of `review`. Its fleet machinery (swarm, autopilot, orchestrate, babysit, forensics, per-role model routing) is left out.
- **[ponytail](https://github.com/DietrichGebert/ponytail)** by Dietrich Gebert. The lazy-senior-dev stance, the seven-rung ladder, "read fully, then be lazy", one runnable check per non-trivial change, the corner-cut marker, and the delete, stdlib, native, yagni, and shrink tags in `review`. Its ten host adapter files are replaced by `install.sh`.

Plus Ousterhout's A Philosophy of Software Design for the `deep-modules` principle and the design red flags in `architect`.

Both sources are MIT. See LICENSE.

## Install

```sh
git clone <this repo> ~/Developer/tobi-kit
~/Developer/tobi-kit/install.sh
```

What it does.

- Symlinks each `skills/<name>/` into `~/.claude/skills`, `~/.codex/skills`, `~/.cursor/skills`, and `~/.config/opencode/skills`.
- Symlinks `AGENTS.md` to `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md`, so the compact rules are always on. Existing non-empty files are backed up first.
- Generates `~/.cursor/rules/tobi-mode.mdc` from `AGENTS.md` (Cursor needs frontmatter). Re-run after editing `AGENTS.md`.

`install.sh --uninstall` removes only what it created. If the ponytail plugin is still enabled in Claude Code, disable it. Its ladder now lives here and two copies means a doubled system prompt.

Edits to any skill are live in every agent on the next session. No sync step.

## The lifecycle

`tobi-mode` is the entry point. It reads the ask, matches a playbook, and calls the other skills as the steps need them. Each skill also works alone.

| Phase | Skill | Use it when |
|---|---|---|
| Scope | `scope` | A vague ask. Produces the done-predicate, the constraints the code imposes, what is out, and which questions to settle by running versus asking. |
| Scope | `how` | You need to know how something works before you change it. Critique mode reviews the architecture. |
| Scope | `why` | You need to know why it is the way it is. Git, PRs, issues, then chat and incidents. |
| Design | `architect` | The change crosses a function boundary. Caller's usage first, two structurally distinct sketches, screened for shallow modules and leakage, then implement against the pick. |
| Build | `tdd` | The bug has a cheap local test path. Failing test, then fix. |
| Build | `typescript` | Any `.ts` or `.tsx` file. |
| Review | `review` | A diff you do not fully trust. Independent reviewers, a lead verdict, and a net-lines-deletable score. |
| Review | `no-comments` | Before review. Deletes narrating comments and flags the code they were covering for. |
| Review | `blast-radius` | A small-looking change with a wide reach. Proves the one fact it is safe because of by running code. |
| Verify | `verify` | Before "done". The real artifact, not a proxy. Evidence, not outcome. |
| Ship | `ship` | Commits that tell a story, Conventional Commits, a PR body with Why, Scope, Tradeoffs, Blast radius, Verification. |
| Prose | `unslop` | Everything you write. Cuts AI tells. |
| Prose | `technical-writing` | Docs, READMEs, RFCs, PR bodies, commit messages. |
| Meta | `reflect` | After a long or corrected task. Routes what generalizes into a skill edit, lint, or script. |

## Playbooks and principles

`skills/tobi-mode/playbooks/` holds five: investigation, bug fix, feature, refactor, prototype. The mode copies the matched one's steps into the todo list verbatim.

`skills/tobi-mode/principles/` holds 21 one-page rules. The mode indexes them inline and reads a leaf when it applies one. Use their names to steer mid-task. "Use subtract before you add" or "apply prove it works" redirects the agent more precisely than a paragraph.

## Conventions the skills assume

- A deliberate corner-cut is marked `tobi: <ceiling>, <upgrade path>` in a comment. `grep -rn 'tobi:'` is the debt ledger.
- No em dashes anywhere, including here. `scripts/check.sh` enforces it.
- Skills are the open `SKILL.md` format (frontmatter `name` and `description`, then markdown). Nothing host-specific inside a skill. Host adapters live in `install.sh` only.

## Editing

```sh
scripts/check.sh
```

Checks frontmatter, that every referenced file exists, that every principle and playbook is indexed in the mode, that `AGENTS.md` still carries the load-bearing phrases the mode carries, and that no em dash slipped in.

`AGENTS.md` is the compact always-on copy of `skills/tobi-mode/SKILL.md`. Change a rule in both or the check fails.
