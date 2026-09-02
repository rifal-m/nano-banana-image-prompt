# Troubleshooting

Diagnosis berdasarkan gejala. Urutan perbaikan penting — mulai dari yang paling
berpengaruh, dan **realism rider selalu yang terakhir disentuh**.

---

## "Masih kelihatan AI" — urutan perbaikan

1. **Tambah atau pertajam imperfeksi bernama.** Ini yang paling berpengaruh.
   Kulit terlalu bersih, gigi terlalu rata, dan lingkungan terlalu rapi adalah
   penyebab utama, bukan setting teknis.
2. **Ganti pencahayaan jadi satu sumber natural berarah**, dan sebutkan bentuk
   catchlight di mata. Cahaya merata dari segala arah adalah tanda render.
3. **Persempit lensa dan bukaan** supaya bidang fokus jelas. Kalau semua tajam,
   otak pembaca langsung curiga.
4. **Pecah simetri pose.** Putar kepala sedikit dari garis bahu, beri kata kerja
   pada subjek.
5. **Baru periksa rider.** Pastikan tidak ada klausa yang terhapus saat mengedit.

---

## Gejala spesifik

### Kulit seperti lilin atau plastik
- Cek rider masih utuh, khususnya `skin micro-texture` dan `subsurface scattering`.
- Tambahkan bagian tubuh yang tembus cahaya ke deskripsi: tepi telinga, cuping hidung,
  ujung jari yang kena backlight.
- Hindari kata yang memicu retouching: "flawless", "smooth", "perfect skin", "glowing".

### Wajah cantik generik, bukan orang spesifik
- Anda kemungkinan menulis "a beautiful woman". Ganti dengan character sheet.
- Tambah tanda khusus berikut posisinya.
- Sebutkan usia dan struktur wajah secara eksplisit.

### Mata mati atau seperti kaca
- Pastikan `sharp focus on the eyes` masih ada di rider.
- Sebutkan catchlight-nya: "a rectangular window catchlight in her eyes".
- Beri arah pandang yang punya alasan: melihat seseorang di luar frame, membaca layar.

### Identitas berubah antar gambar
- Sheet diringkas atau ditulis ulang. Tempel verbatim.
- Terlalu banyak karakter dalam satu frame.
- Gunakan gambar yang sudah benar sebagai referensi untuk gambar berikutnya.

### Cahaya terlihat seperti studio padahal tidak diminta
- Hapus semua kata yang bisa dibaca sebagai lighting gear.
- Sebutkan sumbernya secara harfiah: jendela, lampu meja, langit mendung, dan arahnya.
- Tambahkan perilaku cahaya nyata: falloff ke arah bahu, bayangan yang tidak diisi.

### Tangan atau jari kacau
- Sembunyikan atau beri pekerjaan: memegang cangkir, di dalam saku, menopang dagu.
- Kurangi jumlah tangan yang terlihat dalam frame.
- Nano Banana Pro lebih baik untuk tangan yang harus terlihat jelas.

### Teks di gambar salah eja
- Teks harus dalam tanda kutip persis seperti yang diinginkan.
- Sebutkan gaya hurufnya: "bold sans-serif", "handwritten script".
- Perbaiki lewat editing konversasional, jangan generate ulang.

### Hasil jadi kacau setelah prompt diperpanjang
- Over-prompting. Kalau dua klausa saling bertentangan, hapus salah satu.
- Optik yang mustahil: satu lensa, satu bukaan, satu bidang fokus.
- Prompt panjang tidak selalu lebih baik — koherensi lebih penting dari kelengkapan.

---

## Skill tidak terdeteksi

- Frontmatter `---` harus jadi baris paling pertama. Tidak boleh ada komentar,
  spasi, atau baris kosong sebelumnya.
- Path harus `<folder>/image-prompt/SKILL.md`, nama file huruf besar semua.
- Mulai sesi baru setelah menyalin file.
- Cek: `head -5 ~/.claude/skills/image-prompt/SKILL.md`
