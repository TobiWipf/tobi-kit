#!/usr/bin/env sh
# Structural checks for the skills repo. Fails on the drift that has bitten before.
set -u
ROOT=$(cd "$(dirname "$0")/.." && pwd)
fail=0
err() { echo "FAIL $1"; fail=1; }

for skill in "$ROOT"/skills/*/; do
  f="$skill/SKILL.md"
  [ -f "$f" ] || { err "$skill has no SKILL.md"; continue; }
  head -1 "$f" | grep -q '^---$' || err "$f missing frontmatter"
  grep -q '^name: ' "$f" || err "$f missing name"
  grep -q '^description: ' "$f" || err "$f missing description"
  n=$(sed -n 's/^name: //p' "$f" | head -1)
  [ "$n" = "$(basename "$skill")" ] || err "$f name '$n' does not match directory"
  # every backticked path with a slash that looks like a local reference must exist
  grep -o '`[a-z-]*/[a-zA-Z0-9_./-]*\.md`' "$f" | tr -d '`' | while read -r ref; do
    [ -e "$skill/$ref" ] || [ -e "$ROOT/skills/$ref" ] || echo "FAIL $f references missing $ref"
  done | grep . && fail=1
done

# every principle named in the mode index exists, and every principle file is indexed
MODE="$ROOT/skills/tobi-mode/SKILL.md"
for p in $(grep -o '(`[a-z-]*\.md`)' "$MODE" | tr -d '(`)'); do
  [ -f "$ROOT/skills/tobi-mode/principles/$p" ] || err "mode indexes missing principle $p"
done
for f in "$ROOT"/skills/tobi-mode/principles/*.md; do
  grep -q "$(basename "$f")" "$MODE" || err "principle $(basename "$f") is not indexed in tobi-mode"
done
for f in "$ROOT"/skills/tobi-mode/playbooks/*.md; do
  grep -q "playbooks/$(basename "$f")" "$MODE" || err "playbook $(basename "$f") is not listed in tobi-mode"
done

# the prose rules apply to the repo itself
grep -rln -- '—' "$ROOT/AGENTS.md" "$ROOT/skills" "$ROOT/README.md" 2>/dev/null | while read -r f; do echo "FAIL em dash in $f"; done | grep . && fail=1

# the six lifecycle phases must appear, in bold, in both AGENTS.md and the mode
for phase in Scope Design Build Review Verify Ship; do
  for f in "$ROOT/AGENTS.md" "$MODE"; do grep -q "\*\*$phase\.\*\*" "$f" || err "$f lost lifecycle phase $phase"; done
done

# AGENTS.md is the compact copy of the mode; pin the load-bearing phrases so a reword in one place cannot silently drop them from the other
for phrase in 'Does this need to exist at all' 'already exist in this codebase' 'trace the real flow end to end' 'Input validation at trust boundaries' 'Code first' 'No em dash'; do
  grep -qi "$phrase" "$ROOT/AGENTS.md" || err "AGENTS.md lost invariant: $phrase"
done
for phrase in 'Does this need to exist at all' 'already exist in this codebase' 'trace the real flow end to end' 'Input validation at trust boundaries'; do
  grep -qi "$phrase" "$ROOT/skills/tobi-mode/principles/laziness-protocol.md" || err "laziness-protocol lost invariant: $phrase"
done

[ $fail -eq 0 ] && echo "ok: $(ls -d "$ROOT"/skills/*/ | wc -l | tr -d ' ') skills, $(ls "$ROOT"/skills/tobi-mode/principles | wc -l | tr -d ' ') principles, $(ls "$ROOT"/skills/tobi-mode/playbooks | wc -l | tr -d ' ') playbooks"
exit $fail
