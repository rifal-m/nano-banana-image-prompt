# Character Sheets

The single source of truth for every recurring character's face. Sheets in this file
are pasted **verbatim** into the prompt each time that character appears.

## Rules

1. **Never rewrite one.** Copy and paste it as-is. Changing "almond eyes" to "narrow
   eyes" produces a different person.
2. **One sheet, one commit.** A change to a sheet is a change to a face — treat it like
   an API change. Put the reason in the commit message.
3. **Name the character in the prompt.** In a multi-character scene, attributes land on
   the wrong person if the name is not bound to the description.
4. **Fixed order** in group scenes. Describe the characters in the same order every
   time, and never merge them into one sentence.
5. **Distinguishing marks need an exact position.** "A mole" will wander. "A small mole
   above her left lip" will not.

## Template

```
CHARACTER SHEET — [Name]
- Age and build: 
- Face shape: 
- Eyes: 
- Nose: 
- Lips: 
- Skin: 
- Hair: 
- Distinguishing marks: 
- Wardrobe default: 
```

Fill it in English — this sheet goes straight into the prompt.

---

## Roster

### Aleira

```
CHARACTER SHEET — Aleira
- Age and build: 28, slim, around 165cm, narrow shoulders
- Face shape: oval, softly tapered chin
- Eyes: dark brown almond eyes, single-crease lids, straight medium-thick brows
- Nose: straight narrow bridge, softly rounded tip
- Lips: medium fullness, defined cupid's bow, neutral resting expression
- Skin: warm olive undertone, visible pores across the nose and cheeks, faint
  redness at the nostril creases
- Hair: shoulder-length black hair, slight natural wave, centre part, a few
  strands that never sit flat
- Distinguishing marks: a small mole above the left lip
- Wardrobe default: unstructured linen shirt, minimal jewellery
```

### Gita

```
CHARACTER SHEET — Gita
- Age and build: [fill in]
- Face shape: [fill in]
- Eyes: [fill in]
- Nose: [fill in]
- Lips: [fill in]
- Skin: [fill in]
- Hair: [fill in]
- Distinguishing marks: [fill in]
- Wardrobe default: [fill in]
```

### Baskara

```
CHARACTER SHEET — Baskara
- Age and build: [fill in]
- Face shape: [fill in]
- Eyes: [fill in]
- Nose: [fill in]
- Lips: [fill in]
- Skin: [fill in]
- Hair: [fill in]
- Distinguishing marks: [fill in]
- Wardrobe default: [fill in]
```

---

## When reference images are available

Keep using the sheet, and add the explicit instruction:

```
Keep facial features exactly the same as the reference image.
The identity and attire of all characters must stay consistent.
```

Nano Banana 2 handles up to 5 consistent characters and 14 consistent objects. Nano
Banana Pro accepts up to 14 reference images, 6 of them at high fidelity.

## When the face still drifts between images

- Make sure the sheet is pasted whole, not summarised.
- Reduce the number of characters in a single frame — more people, more drift.
- Move to Nano Banana Pro for close-ups where identity is critical.
- Lock down one correct image first, then use that image as the reference for the rest
  instead of generating them in parallel from text alone.
