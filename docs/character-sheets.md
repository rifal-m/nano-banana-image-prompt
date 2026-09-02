# Character Sheets

Sumber kebenaran tunggal untuk wajah setiap karakter berulang. Sheet di file ini
ditempel **verbatim** ke dalam prompt setiap kali karakter tersebut muncul.

## Aturan

1. **Jangan pernah menulis ulang.** Copy-paste apa adanya. Mengganti "almond eyes"
   menjadi "narrow eyes" menghasilkan orang yang berbeda.
2. **Satu sheet, satu commit.** Perubahan sheet berarti perubahan wajah — perlakukan
   seperti perubahan API. Tulis alasannya di commit message.
3. **Sebutkan nama karakter di prompt.** Dalam scene multi-karakter, atribut akan
   nyasar ke orang lain kalau namanya tidak diikat ke deskripsinya.
4. **Urutan tetap** dalam scene grup. Deskripsikan karakter dengan urutan yang sama
   setiap kali, jangan digabung dalam satu kalimat.
5. **Tanda khusus harus punya posisi pasti.** "A mole" akan berpindah-pindah.
   "A small mole above her left lip" tidak.

## Template

```
CHARACTER SHEET — [Nama]
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

Isi dalam bahasa Inggris — sheet ini masuk langsung ke prompt.

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
- Age and build: [isi]
- Face shape: [isi]
- Eyes: [isi]
- Nose: [isi]
- Lips: [isi]
- Skin: [isi]
- Hair: [isi]
- Distinguishing marks: [isi]
- Wardrobe default: [isi]
```

### Baskara

```
CHARACTER SHEET — Baskara
- Age and build: [isi]
- Face shape: [isi]
- Eyes: [isi]
- Nose: [isi]
- Lips: [isi]
- Skin: [isi]
- Hair: [isi]
- Distinguishing marks: [isi]
- Wardrobe default: [isi]
```

---

## Kalau ada gambar referensi

Sheet tetap dipakai, ditambah instruksi eksplisit:

```
Keep facial features exactly the same as the reference image.
The identity and attire of all characters must stay consistent.
```

Nano Banana 2 menangani sampai 5 karakter konsisten dan 14 objek konsisten.
Nano Banana Pro menerima sampai 14 gambar referensi, 6 di antaranya fidelitas tinggi.

## Kalau wajah tetap melenceng antar gambar

- Pastikan sheet ditempel utuh, bukan diringkas.
- Kurangi jumlah karakter dalam satu frame — makin banyak orang, makin besar drift.
- Pindah ke Nano Banana Pro untuk close-up yang identitasnya kritis.
- Kunci dulu satu gambar yang benar, lalu pakai gambar itu sebagai referensi untuk
  sisanya alih-alih generate paralel dari teks saja.
