# Troubleshooting

Diagnosis by symptom. The repair order matters — start with what has the most effect,
and **the realism rider is always the last thing you touch**.

---

## "It still looks AI" — repair order

1. **Add or sharpen the named imperfections.** This has the most effect. Skin that is
   too clean, teeth that are too even, and an environment that is too tidy are the main
   causes — not the technical settings.
2. **Switch the lighting to a single directional natural source**, and name the shape of
   the catchlight in the eyes. Light arriving evenly from every direction is a render
   tell.
3. **Tighten the lens and aperture** so the focal plane is obvious. When everything is
   sharp, the viewer's brain gets suspicious immediately.
4. **Break the symmetry of the pose.** Turn the head slightly off the shoulder line, and
   give the subject a verb.
5. **Only then check the rider.** Make sure no clause was dropped during editing.

---

## Specific symptoms

### Waxy or plastic skin
- Check that the rider is intact, particularly `skin micro-texture` and
  `subsurface scattering`.
- Add a body part that light passes through: the rim of an ear, a nostril, fingertips
  catching backlight.
- Avoid words that trigger retouching: "flawless", "smooth", "perfect skin", "glowing".

### A generically pretty face instead of a specific person
- You probably wrote "a beautiful woman". Replace it with a character sheet.
- Add distinguishing marks together with their positions.
- State the age and facial structure explicitly.

### Dead or glassy eyes
- Make sure `sharp focus on the eyes` is still in the rider.
- Name the catchlight: "a rectangular window catchlight in her eyes".
- Give the gaze a reason: looking at someone off frame, reading a screen.

### Identity changes between images
- The sheet was summarised or rewritten. Paste it verbatim.
- Too many characters in one frame.
- Use an image that already came out right as the reference for the next one.

### The light looks like a studio even though you never asked for one
- Remove every word that can be read as lighting gear.
- Name the source literally: a window, a desk lamp, an overcast sky — and its direction.
- Add real light behaviour: falloff toward the shoulder, shadows that are not filled.

### Hands or fingers are a mess
- Hide them or give them a job: holding a cup, in a pocket, propping up a chin.
- Reduce how many hands are visible in the frame.
- Nano Banana Pro is better when hands have to be clearly visible.

### Text in the image is misspelled
- The text must be in quotation marks, exactly as you want it.
- Name the type style: "bold sans-serif", "handwritten script".
- Fix it through conversational editing rather than regenerating.

### The result fell apart after the prompt got longer
- Over-prompting. When two clauses contradict each other, delete one.
- Impossible optics: one lens, one aperture, one focal plane.
- A longer prompt is not automatically better — coherence beats completeness.

---

## The skill is not detected

- The `---` frontmatter must be the very first line. No comment, space, or blank line
  before it.
- The path must be `<folder>/image-prompt/SKILL.md`, with the filename in all caps.
- Start a new session after copying the file.
- Check with: `head -5 ~/.claude/skills/image-prompt/SKILL.md`
