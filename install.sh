#!/usr/bin/env sh
# Symlink every skill into each agent's skills directory and install the
# always-on rules. Re-runnable. Pass --uninstall to remove what this created.
set -eu

ROOT=$(cd "$(dirname "$0")" && pwd)
SKILL_DIRS="$HOME/.claude/skills $HOME/.codex/skills $HOME/.cursor/skills $HOME/.config/opencode/skills"
RULE_TARGETS="$HOME/.claude/CLAUDE.md $HOME/.codex/AGENTS.md"
CURSOR_RULE="$HOME/.cursor/rules/tobi-mode.mdc"

link() { # link <src> <dst>: symlink, backing up a non-empty regular file first
  src=$1; dst=$2
  if [ -L "$dst" ]; then rm "$dst"
  elif [ -e "$dst" ]; then
    if [ -s "$dst" ] || [ -d "$dst" ]; then mv "$dst" "$dst.bak.$(date +%s)"; echo "backed up $dst"; else rm "$dst"; fi
  fi
  ln -s "$src" "$dst"; echo "linked $dst"
}

unlink_ours() { # unlink_ours <dst>: remove only if it points into this repo
  [ -L "$1" ] && case "$(readlink "$1")" in "$ROOT"/*) rm "$1"; echo "removed $1";; esac || true
}

if [ "${1:-}" = "--uninstall" ]; then
  for d in $SKILL_DIRS; do for s in "$ROOT"/skills/*/; do unlink_ours "$d/$(basename "$s")"; done; done
  for t in $RULE_TARGETS; do unlink_ours "$t"; done
  [ -f "$CURSOR_RULE" ] && grep -q "Tobi's Kit" "$CURSOR_RULE" && rm "$CURSOR_RULE" && echo "removed $CURSOR_RULE"
  exit 0
fi

for d in $SKILL_DIRS; do
  mkdir -p "$d"
  for s in "$ROOT"/skills/*/; do link "$s" "$d/$(basename "$s")"; done
done

for t in $RULE_TARGETS; do mkdir -p "$(dirname "$t")"; link "$ROOT/AGENTS.md" "$t"; done

# Cursor wants frontmatter on rule files, so this one is generated, not linked. Re-run after editing AGENTS.md.
mkdir -p "$(dirname "$CURSOR_RULE")"
{ printf -- '---\ndescription: tobi-mode, generated from Tobi's Kit (AGENTS.md). Edit the source, then re-run install.sh.\nalwaysApply: true\n---\n'; cat "$ROOT/AGENTS.md"; } > "$CURSOR_RULE"
echo "wrote $CURSOR_RULE"
