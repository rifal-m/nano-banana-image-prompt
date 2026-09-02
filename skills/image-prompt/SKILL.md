---
name: image-prompt
description: >
  Generate optimized prompts for Google's Nano Banana image generators (Nano Banana 2
  and Nano Banana Pro), with a dedicated module for photorealistic human characters
  that do not look AI-generated. Use when the user invokes /image-prompt or asks to
  create, write, craft, or generate a prompt for Nano Banana, Gemini image generation,
  or AI image creation. Also triggers on "image prompt", "nano banana prompt",
  "nano banana 2", "prompt karakter realistis", "biar tidak seperti AI", "photoreal
  character", "skin texture prompt", or "help me describe an image".
---

# Nano Banana Prompt Generator — Photoreal Character Edition

Generates high-quality prompts for Google's Nano Banana image models, based on Google's
official prompting guidance, extended with a **Photoreal Human Realism** module for
character work that must not read as AI-generated.

Prompts are always written in **English**, even when the conversation is in another
language — the models perform better on English prompt bodies.

---

## Choosing a Model

Both models use the same prompting approach. Help the user pick if they're unsure:

| | **Nano Banana 2** | **Nano Banana Pro** |
|---|---|---|
| **Speed** | Fast (Flash-based) | Slower, highest fidelity |
| **Best for** | Rapid iteration, everyday use | Maximum detail and factual accuracy |
| **Default in** | Gemini app, Google Search | Premium plans (AI Pro/Ultra) |
| **Resolution** | 512px to 4K (specify explicitly) | Up to high-res |
| **Characters** | Up to 5 consistent characters | Via reference images |
| **Objects** | Up to 14 consistent objects | Up to 14 reference images |
| **Instruction following** | Enhanced — handles complex prompts well | Strong |

For close-up portraits where skin must survive inspection at 100% zoom, recommend **Pro**.
For multi-character scenes and fast iteration, **Nano Banana 2** is the default.

> Model availability and plan details change. Check Google's current docs if this looks stale.

---

## Core Principles

Both models understand intent, physics, and composition. They reward **clear creative
direction** over keyword lists.

1. **Natural language over tag soup** — Brief it like a human photographer, not a tag list.
   - BAD: "woman, office, window light, 8k, realistic, cinematic"
   - GOOD: "A woman in her late twenties leaning against a glass partition in a Jakarta co-working space, late afternoon light raking across her cheekbone"
2. **Specificity matters** — Materiality, texture, wear, age, fabric, finish.
3. **Give the purpose** — "editorial portrait for a company profile page" tells the model
   more about framing and grade than three adjectives would.
4. **Edit, don't re-roll** — When an image is 80% right, request a conversational edit.
5. **The realism rider goes last** — See below. The natural-language scene comes first;
   the technical realism block is appended as a trailing rider. This is the one place
   where a comma-separated list is correct, because it functions as a quality
   specification, not as scene description.

---

## The Realism Core (mandatory for any human character)

Append this block **verbatim at the end** of every prompt that contains a person,
after the scene description:

```
Maintain perfect identity. Show realistic pores, skin micro-texture, authentic skin
translucency, realistic subsurface scattering, professional full-frame camera quality,
sharp focus on the eyes, cinematic realism, detailed facial features, realistic skin
rendering, 8K HDR, editorial photography quality.
```

Indonesian source of this block, for reference:
*Pertahankan identitas sempurna. Tampilkan pori-pori realistis, tekstur mikro kulit,
transparansi kulit yang autentik, hamburan bawah permukaan yang realistis, kualitas
kamera full-frame profesional, fokus tajam pada mata, realisme sinematik, fitur wajah
yang detail, rendering kulit yang realistis, 8K HDR, kualitas fotografi editorial.*

**What each clause is doing — do not drop any of them:**

| Clause | Function |
|---|---|
| Maintain perfect identity | Locks facial structure across a series; prevents drift between shots |
| Realistic pores / skin micro-texture | Kills the airbrushed plastic surface that reads as AI instantly |
| Authentic skin translucency + subsurface scattering | Light passing through ears, nostrils, fingertips — the single strongest cue of real flesh |
| Professional full-frame camera quality | Sets sensor-scale depth of field and falloff instead of phone-flat rendering |
| Sharp focus on the eyes | Enforces a real focal plane; AI images often focus everywhere or nowhere |
| Cinematic realism | Grade and contrast behaviour, not fantasy illustration |
| Detailed facial features | Prevents the smoothed generic-attractive default face |
| Realistic skin rendering | Reinforces surface shading over the waxy look |
| 8K HDR | Micro-detail retention in highlights and shadows |
| Editorial photography quality | Anchors the whole image to magazine photography as the reference class |

---

## Anti-AI-Look Checklist

The realism rider handles rendering. These handle *believability* — apply them inside
the scene description itself.

**1. Imperfection is the tell.** Real faces are asymmetric. Add at least two of:
- slightly uneven skin tone, faint redness around the nostrils, cheeks, or ear rims
- a few flyaway hairs, a strand out of place, hair that isn't uniformly styled
- vellus (fine) hair on the jaw and upper cheek catching the light
- natural lip texture with fine vertical lines, not glossy uniform color
- a small mole, freckle, faint scar, or laugh line — named and placed
- teeth with natural shade variation, never uniform white
- clothing with real behaviour: a wrinkle at the elbow, a collar sitting slightly off

**2. Natural light only.** No studio strobe, softbox, ring light, or flash — these are
a standing requirement for this workflow. Specify a real source and direction:
- "late afternoon window light from camera left, falling off toward the shoulder"
- "overcast daylight, soft and directionless, no visible catchlight ring"
- "warm practical lamp light from a desk lamp just out of frame"
- Always describe the **catchlight** shape when the eyes are visible — a window-shaped
  catchlight is one of the fastest ways to defeat the AI look.

**3. Camera language, stated like a photographer.**
- Body and lens: "full-frame camera, 85mm lens at f/1.8" or "35mm at f/2.8, half-body"
- Distance and angle: "eye level, one step back from conversational distance"
- Avoid impossible combinations: no 85mm f/1.4 wide establishing shot with everything sharp.
- Allow a hint of real-lens behaviour: slight vignetting, subtle chromatic fringing on
  high-contrast edges, natural grain — not filter-grain.

**4. Anchor the pose in an action.** AI-looking portraits are people posing at nothing.
Give a verb: mid-sentence, reaching for a cup, adjusting a sleeve, listening while
someone off-frame talks, checking a phone screen that lights the underside of the chin.

**5. Let the environment be untidy.** A real desk has cable slack, a used mug, papers
that aren't square to the edge. Perfect environments read as rendered.

---

## Identity Lock (for recurring characters)

For a character who must stay the same across many images, build a **character sheet**
once and reuse the exact same wording every time. Changing the description changes the face.

```
CHARACTER SHEET — [Name]
- Age and build: [e.g. 28, slim, 165cm, narrow shoulders]
- Face shape: [oval / heart / square jaw, chin shape]
- Eyes: [shape, color, lid type, brow shape and thickness]
- Nose: [bridge, width, tip]
- Lips: [fullness, cupid's bow, resting expression]
- Skin: [undertone, tone, texture notes, named marks and their exact placement]
- Hair: [length, texture, part, color including roots, how it behaves]
- Distinguishing marks: [mole above left lip, small scar on right brow, etc.]
- Wardrobe default: [if the character has a consistent look]
```

Rules:
- Paste the sheet into every prompt for that character, word for word.
- Name the character in the prompt ("Aleira, [sheet]") so multi-character scenes bind
  attributes to the right person.
- When reference images are available, add: *"Keep facial features exactly the same as
  the reference. Identity and attire of all characters must stay consistent."*
- In a scene with several characters, describe them in a fixed order and never merge
  their descriptions into one sentence.

---

## Workflow

### Step 1: Gather the vision

Ask targeted questions for the gaps only. **Maximum 2–3 questions per round** — never
dump the whole table on the user.

| Dimension | What to ask | Examples |
|---|---|---|
| **Subject** | Who is the main focus? New or recurring character? | Named character, stranger, group |
| **Identity source** | Existing character sheet, reference image, or new? | Reuse / upload / invent |
| **Setting** | Where, and what time of day? | Office, street, home interior |
| **Mood** | What should it feel like? | Candid, tense, warm, contemplative |
| **Style** | Editorial, documentary, cinematic still, fashion? | |
| **Composition** | Framing and crop | Close-up, half-body, wide with context |
| **Lighting** | Natural source and direction | Window left, overcast, golden hour |
| **Purpose** | Where does it get used? | Website hero, profile, social, storyboard |
| **Text** | Any rendered text? | Exact wording in quotation marks |
| **Format** | Resolution and aspect ratio | 4K; 16:9, 9:16, 4:5, 1:1 |

If the user is working on a recurring character, check whether a character sheet already
exists before asking identity questions again.

### Step 2: Build the prompt

```
[Style/medium] of [named character + identity sheet] in [setting],
[action — a verb, not a pose], [natural light source, direction, and catchlight],
[mood], [camera body, lens, aperture, angle, distance],
[texture, wardrobe, color palette, environmental detail],
[two or more specific imperfections].
[Purpose context.]

Maintain perfect identity. Show realistic pores, skin micro-texture, authentic skin
translucency, realistic subsurface scattering, professional full-frame camera quality,
sharp focus on the eyes, cinematic realism, detailed facial features, realistic skin
rendering, 8K HDR, editorial photography quality.
```

### Step 3: Present with rationale

```
PROMPT:
─────────────────────────────────────────────
[The generated prompt text — English]
─────────────────────────────────────────────

WHY THESE CHOICES:
- [Element]: [what it fixes or produces]
- [Element]: [what it fixes or produces]

REALISM NOTES:
- [Which imperfections were added and why]
- [What to change first if the skin still looks plastic]
```

### Step 4: Offer refinement

Ask what to adjust, and offer a variant with a different lighting or framing approach.
If the user says the result "still looks AI", go in this order:
1. Add or sharpen the named imperfections (most effective)
2. Change the light to a single directional natural source with a described catchlight
3. Tighten the lens and aperture, and reduce depth of field so the focal plane is obvious
4. Break the symmetry of the pose — turn the head slightly off the shoulder line
5. Only then touch the realism rider

---

## Special Capabilities

**Reference images and consistency.** Nano Banana 2 handles up to 5 consistent characters
and 14 consistent objects; Pro takes up to 14 reference images (6 at high fidelity).
Useful instructions: *"Use the uploaded images as a strict style reference"*,
*"Keep the character from Image 1 but place them in the setting from Image 2"*.

**Conversational editing.** After generating, edit in natural language — "change the
afternoon light to overcast", "remove the person in the background". The model adjusts
lighting, reflections, and physics automatically. Prefer this over regenerating.

**Text in images.** State-of-the-art legibility. Put exact text in quotation marks and
specify the type style: "bold sans-serif", "handwritten script", "retro neon sign".
Localization works: "Translate the text in this image to Japanese."

**Dimensional translation.** Sketch → photoreal render, floor plan → 3D room,
wireframe → high-fidelity UI mockup.

**Structural control.** Upload a layout sketch or grid to lock composition.

---

## Anti-Patterns

| Anti-pattern | Fix |
|---|---|
| Tag soup in the scene body | Rewrite as sentences; keep lists only in the trailing rider |
| "A beautiful woman" | Model defaults to a symmetric generic face — describe a specific person |
| Studio / softbox / ring light | Replace with a named natural source and direction |
| Flawless skin, flawless teeth, flawless environment | Add named imperfections |
| Posing at nothing | Give the subject an action and something to look at |
| Contradictory optics | One lens, one aperture, one focal plane |
| Over-prompting | If two clauses fight, delete one — confusion shows up as mush |
| Rewriting the character sheet each time | Identity drifts; paste it verbatim |

---

## Example Prompts

**Editorial portrait, natural light:**
> An editorial half-body portrait of Aleira — 28, oval face, warm olive undertone, dark
> almond eyes, a small mole above her left lip — standing beside a tall window in a Bali
> co-working space, mid-sentence and half-turned toward someone off frame. Late afternoon
> light rakes in from camera left, leaving a rectangular window catchlight in her eyes and
> a soft falloff across her right cheek. Shot on a full-frame camera, 85mm at f/1.8, eye
> level. Fine flyaway hairs catch the light along her part, faint redness across the bridge
> of her nose, a linen shirt creased at the elbow. For a company profile page.
> Maintain perfect identity. Show realistic pores, skin micro-texture, authentic skin
> translucency, realistic subsurface scattering, professional full-frame camera quality,
> sharp focus on the eyes, cinematic realism, detailed facial features, realistic skin
> rendering, 8K HDR, editorial photography quality.

**Candid multi-character scene:**
> A documentary-style wide shot of three colleagues around a cluttered desk in a Jakarta
> startup office at dusk — Gita seated and laughing with her head tipped back, Baskara
> leaning over the monitor pointing at something, Aleira standing behind them with a mug,
> listening. Warm practical light from a desk lamp just out of frame, mixed with cool blue
> ambient from the window behind. Full-frame camera, 35mm at f/2.8, from across the room.
> Cable slack under the desk, a mug ring on a printout, chairs at uneven angles.
> Maintain perfect identity. Show realistic pores, skin micro-texture, authentic skin
> translucency, realistic subsurface scattering, professional full-frame camera quality,
> sharp focus on the eyes, cinematic realism, detailed facial features, realistic skin
> rendering, 8K HDR, editorial photography quality.

**Product photography (no character — rider not required):**
> A flat lay of artisanal coffee beans spilling from a matte black ceramic cup onto a
> weathered oak table, soft directional window light from the upper left, warm earth tones
> with deep shadows, shot from directly above, styled for a premium coffee brand's
> Instagram feed.

**Text-heavy design:**
> A vintage-style concert poster with the text "MIDNIGHT REVERIE" in bold art deco
> typography at the top, a silhouette of a saxophone player against a deep indigo night
> sky with a full moon, "Live at The Blue Note — March 15, 2026" in smaller elegant serif
> type at the bottom, gold and navy color palette.

---

## Sources

- [7 tips to get the most out of Nano Banana Pro](https://blog.google/products/gemini/prompting-tips-nano-banana-pro/) — Google Blog
- [Nano Banana 2: Combining Pro capabilities with lightning-fast speed](https://blog.google/innovation-and-ai/technology/ai/nano-banana-2/) — Google Blog
- [Nano Banana image generation](https://ai.google.dev/gemini-api/docs/image-generation) — Google AI for Developers

Base skill by Kenneth Kousen. Photoreal Human Realism module added for character-consistent
editorial work.
