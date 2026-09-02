#!/usr/bin/env bash
# Installer untuk skill image-prompt (Nano Banana — Photoreal Character Edition)
# Pemakaian:
#   ./install.sh              pasang global (Claude Code dan/atau Gemini CLI)
#   ./install.sh --project    pasang ke ./.claude/skills di folder saat ini

set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/image-prompt/SKILL.md"
SKILL_NAME="image-prompt"

if [ ! -f "$SRC" ]; then
  echo "Error: SKILL.md tidak ditemukan di $SRC" >&2
  exit 1
fi

# Frontmatter harus jadi baris pertama, kalau tidak skill tidak terdeteksi.
if [ "$(head -1 "$SRC")" != "---" ]; then
  echo "Error: baris pertama SKILL.md harus '---'" >&2
  exit 1
fi

install_to() {
  local dest_dir="$1"
  mkdir -p "$dest_dir/$SKILL_NAME"
  cp "$SRC" "$dest_dir/$SKILL_NAME/SKILL.md"
  echo "  terpasang: $dest_dir/$SKILL_NAME/SKILL.md"
}

if [ "${1:-}" = "--project" ]; then
  echo "Memasang skill untuk proyek ini:"
  install_to "./.claude/skills"
  echo "Selesai. Mulai sesi baru, lalu panggil /image-prompt"
  exit 0
fi

echo "Memasang skill secara global:"
installed=0

# Claude Code
if [ -d "$HOME/.claude" ]; then
  install_to "$HOME/.claude/skills"
  installed=1
fi

# Gemini CLI dan tool lintas-platform lain
if [ -d "$HOME/.agents" ]; then
  install_to "$HOME/.agents/skills"
  installed=1
fi

if [ "$installed" -eq 0 ]; then
  echo "  tidak menemukan ~/.claude atau ~/.agents — memasang ke ~/.claude/skills"
  install_to "$HOME/.claude/skills"
fi

echo
echo "Selesai. Mulai sesi baru, lalu panggil /image-prompt"
