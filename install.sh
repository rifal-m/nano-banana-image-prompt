#!/usr/bin/env bash
# Installer for the image-prompt skill (Nano Banana — Photoreal Character Edition)
# Usage:
#   ./install.sh              install globally (Claude Code and/or Gemini CLI)
#   ./install.sh --project    install into ./.claude/skills in the current directory

set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/image-prompt/SKILL.md"
SKILL_NAME="image-prompt"

if [ ! -f "$SRC" ]; then
  echo "Error: SKILL.md not found at $SRC" >&2
  exit 1
fi

# The frontmatter must be the first line, or the skill is never detected.
if [ "$(head -1 "$SRC")" != "---" ]; then
  echo "Error: the first line of SKILL.md must be '---'" >&2
  exit 1
fi

install_to() {
  local dest_dir="$1"
  mkdir -p "$dest_dir/$SKILL_NAME"
  cp "$SRC" "$dest_dir/$SKILL_NAME/SKILL.md"
  echo "  installed: $dest_dir/$SKILL_NAME/SKILL.md"
}

if [ "${1:-}" = "--project" ]; then
  echo "Installing the skill for this project:"
  install_to "./.claude/skills"
  echo "Done. Start a new session, then call /image-prompt"
  exit 0
fi

echo "Installing the skill globally:"
installed=0

# Claude Code
if [ -d "$HOME/.claude" ]; then
  install_to "$HOME/.claude/skills"
  installed=1
fi

# Gemini CLI and other cross-platform tools
if [ -d "$HOME/.agents" ]; then
  install_to "$HOME/.agents/skills"
  installed=1
fi

if [ "$installed" -eq 0 ]; then
  echo "  no ~/.claude or ~/.agents found — installing to ~/.claude/skills"
  install_to "$HOME/.claude/skills"
fi

echo
echo "Done. Start a new session, then call /image-prompt"
