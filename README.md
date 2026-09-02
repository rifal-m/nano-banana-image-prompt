# Nano Banana Image Prompt — Photoreal Character Edition

Agent skill untuk menyusun prompt Google Nano Banana (Nano Banana 2 & Nano Banana Pro)
dengan modul khusus **karakter manusia fotorealistis yang tidak terlihat seperti AI**.

Skill ini menggabungkan panduan prompting resmi Google dengan tiga modul tambahan:

| Modul | Fungsi |
|---|---|
| **Realism Core** | Blok kualitas teknis wajib (pori-pori, subsurface scattering, 8K HDR, editorial quality) yang ditempel di akhir setiap prompt berisi manusia |
| **Anti-AI-Look Checklist** | Aturan imperfeksi, pencahayaan natural, dan bahasa kamera yang membuat gambar lolos dari kesan "hasil AI" |
| **Identity Lock** | Template *character sheet* agar wajah karakter berulang tidak berubah antar gambar |

---

## Struktur Repository

```
nano-banana-image-prompt/
├── README.md                       ← file ini
├── LICENSE
├── .gitignore
├── .claude-plugin/
│   ├── plugin.json                 ← manifest plugin Claude Code
│   └── marketplace.json            ← agar repo bisa dipasang dari URL-nya
├── install.sh                      ← installer manual (copy file)
├── skills/
│   └── image-prompt/
│       └── SKILL.md                ← skill utama
├── docs/
│   ├── character-sheets.md         ← cara membuat & merawat character sheet
│   └── troubleshooting.md          ← diagnosis kalau hasil masih terlihat AI
└── examples/
    └── prompt-library.md           ← prompt siap pakai per kategori
```

Yang benar-benar dibaca oleh agent hanyalah `skills/image-prompt/SKILL.md`.
Sisanya dokumentasi untuk manusia.

---

## Instalasi

### Cara yang disarankan — sebagai plugin Claude Code

Cukup dari URL repo, tanpa clone manual. Di dalam sesi Claude Code:

```
/plugin marketplace add rifal-m/nano-banana-image-prompt
/plugin install nano-banana-image-prompt@nano-banana-image-prompt
```

Skill-nya ikut ter-update saat repo berubah, dan bisa dilepas lewat `/plugin`.

> Jangan mengunduh `SKILL.md` dari root repo — file itu tidak ada di root.
> Lokasi sebenarnya `skills/image-prompt/SKILL.md`, dan Claude Code menemukannya
> lewat field `skills` di `.claude-plugin/plugin.json`.

### Cara alternatif — clone lalu copy

```bash
git clone https://github.com/rifal-m/nano-banana-image-prompt.git
cd nano-banana-image-prompt
./install.sh
```

Installer menyalin skill ke Claude Code dan/atau Gemini CLI, tergantung folder mana
yang ada di mesin Anda. Pakai cara ini kalau tidak memakai sistem plugin, atau untuk
Gemini CLI.

### Satu file, tanpa clone

```bash
mkdir -p ~/.claude/skills/image-prompt
curl -fsSL https://raw.githubusercontent.com/rifal-m/nano-banana-image-prompt/main/skills/image-prompt/SKILL.md \
  -o ~/.claude/skills/image-prompt/SKILL.md
```

Restart sesi, lalu panggil dengan `/image-prompt`.

### Gemini CLI / tool lintas-platform (manual)

```bash
mkdir -p ~/.agents/skills/image-prompt
cp skills/image-prompt/SKILL.md ~/.agents/skills/image-prompt/SKILL.md
```

### Skill per-project (bukan global)

Kalau skill ini hanya untuk satu proyek — misalnya satu brand atau satu seri karakter —
simpan di dalam repo proyek tersebut:

```bash
mkdir -p .claude/skills/image-prompt
cp skills/image-prompt/SKILL.md .claude/skills/image-prompt/SKILL.md
```

Skill per-project menang atas skill global dengan nama sama, jadi Anda bisa punya versi
berbeda per klien.

### Claude.ai / Claude Desktop

Unggah `SKILL.md` sebagai skill di pengaturan, atau lampirkan filenya ke percakapan lalu
minta: *"pakai skill ini untuk bikin prompt"*.

### Verifikasi

```bash
ls ~/.claude/skills/image-prompt/SKILL.md
head -5 ~/.claude/skills/image-prompt/SKILL.md
```

Baris pertama harus tepat `---`. Kalau ada spasi, komentar, atau baris kosong sebelum
frontmatter, skill tidak akan terdeteksi.

---

## Cara Penggunaan

### 1. Pemakaian dasar

```
/image-prompt
```

Agent akan menanyakan 2–3 pertanyaan untuk mengisi celah, lalu mengeluarkan prompt
berbahasa Inggris beserta alasan tiap pilihan.

Atau langsung sebutkan kebutuhannya:

```
/image-prompt potret editorial perempuan 28 tahun di co-working space Bali,
cahaya sore dari jendela, untuk halaman profil perusahaan
```

### 2. Alur untuk karakter berulang

Ini alur utama repo ini. Sekali setup, dipakai terus.

**Langkah 1 — Buat character sheet.**

```
/image-prompt buatkan character sheet untuk karakter baru bernama Aleira,
perempuan 28 tahun, Indonesia, wajah oval, rambut hitam sebahu
```

Simpan hasilnya ke `docs/character-sheets.md` dan **commit**. Sheet ini jadi sumber
kebenaran tunggal untuk wajah Aleira.

**Langkah 2 — Panggil sheet-nya di setiap prompt.**

```
/image-prompt Aleira (pakai character sheet yang tersimpan) sedang berdiri
di lobi kantor saat pagi, candid, half-body
```

**Langkah 3 — Jangan pernah menulis ulang sheet-nya.** Tempel apa adanya, kata per kata.
Mengubah satu kata deskripsi wajah berarti mengubah wajahnya di hasil render.

### 3. Anatomi prompt yang dihasilkan

Setiap prompt berisi manusia punya dua bagian:

```
[BADAN PROMPT — kalimat naratif]
Deskripsi scene, karakter, aksi, cahaya, kamera, dan imperfeksi.
Ditulis seperti brief ke fotografer, bukan daftar keyword.

[REALISM RIDER — daftar teknis, selalu di akhir]
Maintain perfect identity. Show realistic pores, skin micro-texture, authentic skin
translucency, realistic subsurface scattering, professional full-frame camera quality,
sharp focus on the eyes, cinematic realism, detailed facial features, realistic skin
rendering, 8K HDR, editorial photography quality.
```

Pemisahan ini disengaja. Badan prompt harus naratif karena model merespons arahan
kreatif lebih baik daripada tag. Rider boleh berbentuk daftar karena fungsinya
spesifikasi kualitas, bukan deskripsi scene.

### 4. Iterasi

Setelah gambar jadi, jangan generate ulang dari nol. Gunakan editing konversasional:

```
ubah cahaya sore jadi mendung, sisanya pertahankan
hapus orang di background, ganti dengan tanaman
```

Model akan menyesuaikan cahaya, pantulan, dan fisika secara otomatis.

### 5. Kalau hasil masih terlihat AI

Jangan langsung mengutak-atik realism rider. Urutan perbaikannya ada di
[`docs/troubleshooting.md`](docs/troubleshooting.md) — ringkasnya: imperfeksi dulu,
lalu cahaya, lalu lensa, lalu pose, baru rider.

---

## Prompt Selalu Bahasa Inggris

Percakapan boleh bahasa Indonesia, tapi prompt yang keluar selalu bahasa Inggris.
Model Nano Banana secara konsisten memberi hasil lebih akurat pada prompt Inggris,
terutama untuk istilah kamera dan material. Skill ini sudah mengatur itu otomatis.

---

## Konvensi Wajib di Repo Ini

Ini standar yang berlaku untuk semua pekerjaan image generation di sini:

1. **Cahaya natural saja** — tidak ada studio, softbox, ring light, atau flash.
   Sebutkan sumber nyata dan arahnya, plus bentuk catchlight di mata.
2. **Realism rider wajib** untuk setiap prompt yang mengandung manusia.
3. **Identity preservation per karakter** — sheet ditempel verbatim.
4. **Minimal dua imperfeksi bernama** di setiap potret.
5. **Kualitas 8K HDR editorial** sebagai baseline.

---

## Kontribusi

Perubahan pada `SKILL.md` sebaiknya lewat pull request dengan contoh gambar sebelum
dan sesudah, supaya efek perubahan bisa dinilai, bukan diperdebatkan.

Character sheet baru masuk ke `docs/character-sheets.md`. Prompt yang terbukti bagus
masuk ke `examples/prompt-library.md` — repo ini akan makin berguna seiring
perpustakaan promptnya tumbuh.

---

## Sumber

- [7 tips to get the most out of Nano Banana Pro](https://blog.google/products/gemini/prompting-tips-nano-banana-pro/) — Google Blog
- [Nano Banana 2](https://blog.google/innovation-and-ai/technology/ai/nano-banana-2/) — Google Blog
- [Nano Banana image generation](https://ai.google.dev/gemini-api/docs/image-generation) — Google AI for Developers

Skill dasar oleh Kenneth Kousen. Modul Photoreal Human Realism ditambahkan untuk
kebutuhan kerja karakter konsisten bergaya editorial.
