# Nano Banana Image Prompt — Photoreal Character Edition

An agent skill for composing Google Nano Banana prompts (Nano Banana 2 and Nano Banana
Pro), with a dedicated module for **photorealistic human characters that do not look
AI-generated**.

The skill combines Google's official prompting guidance with three added modules:

| Module | What it does |
|---|---|
| **Realism Core** | The mandatory technical quality block (pores, subsurface scattering, 8K HDR, editorial quality) appended to the end of every prompt containing a person |
| **Anti-AI-Look Checklist** | Rules for imperfection, natural light, and camera language that keep an image from reading as "AI output" |
| **Identity Lock** | A *character sheet* template that keeps a recurring character's face from drifting between images |

---

## Repository structure

```
nano-banana-image-prompt/
├── README.md                       ← this file
├── LICENSE
├── .gitignore
├── .claude-plugin/
│   ├── plugin.json                 ← Claude Code plugin manifest
│   └── marketplace.json            ← lets the repo be installed from its URL
├── install.sh                      ← manual installer (file copy)
├── skills/
│   └── image-prompt/
│       └── SKILL.md                ← the skill itself
├── docs/
│   ├── character-sheets.md         ← how to build and maintain a character sheet
│   └── troubleshooting.md          ← diagnosis when results still look AI
└── examples/
    └── prompt-library.md           ← ready-to-use prompts by category
```

The only file the agent actually reads is `skills/image-prompt/SKILL.md`. Everything
else is documentation for humans.

---

## Installation

### Recommended — as a Claude Code plugin

Straight from the repo URL, no manual clone. Inside a Claude Code session:

```
/plugin marketplace add rifal-m/nano-banana-image-prompt
/plugin install nano-banana-image-prompt@rifal-m-skills
```

The first line adds this repo as a marketplace; the second installs the plugin inside
it. The format is `plugin@marketplace` — the marketplace is named `rifal-m-skills`
rather than after the repo, because the same marketplace will host later skills.

The skill updates as the repo changes, and can be removed through `/plugin`.

> Do not download `SKILL.md` from the repo root — it is not there. The real path is
> `skills/image-prompt/SKILL.md`, and Claude Code finds it through the `skills` field
> in `.claude-plugin/plugin.json`.

### Alternative — clone and copy

```bash
git clone https://github.com/rifal-m/nano-banana-image-prompt.git
cd nano-banana-image-prompt
./install.sh
```

The installer copies the skill into Claude Code and/or Gemini CLI, depending on which
directories exist on your machine. Use this if you are not on the plugin system, or for
Gemini CLI.

### Single file, no clone

```bash
mkdir -p ~/.claude/skills/image-prompt
curl -fsSL https://raw.githubusercontent.com/rifal-m/nano-banana-image-prompt/main/skills/image-prompt/SKILL.md \
  -o ~/.claude/skills/image-prompt/SKILL.md
```

Start a new session, then call it with `/image-prompt`.

### Gemini CLI / cross-platform tools (manual)

```bash
mkdir -p ~/.agents/skills/image-prompt
cp skills/image-prompt/SKILL.md ~/.agents/skills/image-prompt/SKILL.md
```

### Per-project skill (instead of global)

When the skill belongs to one project only — a single brand, or one character series —
keep it inside that project's repo.

From inside a clone of this repo, the installer already handles it:

```bash
./install.sh --project
```

Or manually, run from the root of the target project:

```bash
mkdir -p .claude/skills/image-prompt
curl -fsSL https://raw.githubusercontent.com/rifal-m/nano-banana-image-prompt/main/skills/image-prompt/SKILL.md \
  -o .claude/skills/image-prompt/SKILL.md
```

A per-project skill wins over a global skill of the same name, so you can keep a
different version per client.

### Claude.ai / Claude Desktop

Upload `SKILL.md` as a skill in settings, or attach the file to a conversation and ask:
*"use this skill to write the prompt"*.

### Verify

```bash
ls ~/.claude/skills/image-prompt/SKILL.md
head -5 ~/.claude/skills/image-prompt/SKILL.md
```

The first line must be exactly `---`. A space, a comment, or a blank line before the
frontmatter and the skill will not be detected.

---

## Usage

### 1. Basic use

```
/image-prompt
```

The agent asks 2–3 questions to fill the gaps, then returns an English prompt along
with the reasoning behind each choice.

Or state the need directly:

```
/image-prompt editorial portrait of a woman in her late twenties in a Bali
co-working space, late afternoon window light, for a company profile page
```

### 2. The recurring-character workflow

This is the main flow of this repo. Set up once, reuse indefinitely.

**Step 1 — Build the character sheet.**

```
/image-prompt build a character sheet for a new character named Aleira,
woman, 28, Indonesian, oval face, shoulder-length black hair
```

Save the result into `docs/character-sheets.md` and **commit it**. That sheet becomes
the single source of truth for Aleira's face.

**Step 2 — Call the sheet in every prompt.**

```
/image-prompt Aleira (use the saved character sheet) standing in the office
lobby in the morning, candid, half-body
```

**Step 3 — Never rewrite the sheet.** Paste it as-is, word for word. Changing one word
of the facial description changes the face in the render.

### 3. Anatomy of the generated prompt

Every prompt containing a person has two parts:

```
[PROMPT BODY — narrative sentences]
The scene, character, action, light, camera, and imperfections.
Written like a brief to a photographer, not a keyword list.

[REALISM RIDER — technical list, always last]
Maintain perfect identity. Show realistic pores, skin micro-texture, authentic skin
translucency, realistic subsurface scattering, professional full-frame camera quality,
sharp focus on the eyes, cinematic realism, detailed facial features, realistic skin
rendering, 8K HDR, editorial photography quality.
```

The split is deliberate. The body must be narrative because the model responds to
creative direction better than to tags. The rider is allowed to be a list because it
functions as a quality specification, not as scene description.

### 4. Iterate

Once an image exists, do not regenerate from scratch. Use conversational editing:

```
change the afternoon light to overcast, keep everything else
remove the person in the background, put a plant there instead
```

The model adjusts light, reflections, and physics on its own.

### 5. When the result still looks AI

Do not start by tampering with the realism rider. The repair order lives in
[`docs/troubleshooting.md`](docs/troubleshooting.md) — in short: imperfections first,
then light, then lens, then pose, and only then the rider.

---

## Prompts are always English

The conversation can be in any language, but the prompt that comes out is always
English. Nano Banana models consistently return more accurate results on English
prompt bodies, especially for camera and material terminology. The skill handles this
automatically.

---

## Standing conventions in this repo

These apply to all image-generation work here:

1. **Natural light only** — no studio, softbox, ring light, or flash. Name a real
   source and its direction, plus the shape of the catchlight in the eyes.
2. **The realism rider is mandatory** for every prompt containing a person.
3. **Identity preservation per character** — the sheet is pasted verbatim.
4. **At least two named imperfections** in every portrait.
5. **8K HDR editorial quality** as the baseline.

---

## Contributing

Changes to `SKILL.md` are best sent as a pull request with before-and-after example
images, so the effect can be judged rather than argued.

New character sheets go into `docs/character-sheets.md`. Prompts that proved themselves
go into `examples/prompt-library.md` — this repo gets more useful as that library grows.

---

## Sources

- [7 tips to get the most out of Nano Banana Pro](https://blog.google/products/gemini/prompting-tips-nano-banana-pro/) — Google Blog
- [Nano Banana 2](https://blog.google/innovation-and-ai/technology/ai/nano-banana-2/) — Google Blog
- [Nano Banana image generation](https://ai.google.dev/gemini-api/docs/image-generation) — Google AI for Developers

Base skill by Kenneth Kousen. The Photoreal Human Realism modules were added for
consistent, editorial-style character work.
