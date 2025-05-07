# 📱 Flutter Test Case Project - User List & Detail

## 📋 Deskripsi Proyek

Ini adalah proyek Flutter berskala kecil yang dirancang untuk menguji kemampuan teknikal pengembang dalam hal debugging, pengelolaan state, dan penambahan fitur menggunakan **Flutter** dan **GetX**.

---

## 🎯 Tujuan

- Memperbaiki **8 bug** yang telah tersebar di dalam project.
- Menambahkan satu fitur baru berupa **halaman detail user**.
- Menggunakan **GetX** sebagai state management dan routing.

---

## 📦 Fitur Aplikasi

### ✅ Fitur Existing

- Halaman **Home** menampilkan daftar user dalam bentuk list.
- Data ditampilkan secara dinamis.
- UI sederhana.

### 🆕 Fitur Baru yang Harus Ditambahkan

- **Halaman Detail User**  
  - Menampilkan detail lengkap user: nama, email, alamat, dsb.
  - Dapat diakses dari halaman Home dengan klik salah satu user.
  - Dikelola menggunakan **GetX Controller**.
  - Data bersifat reaktif menggunakan `Rx`.

---

## 🐞 Bug yang Harus Diperbaiki

Terdapat **8 bug** yang tersebar di dalam aplikasi. Bug bisa berkaitan dengan:

- Dependency yang tidak disematkan untuk class yang membutuhkan
- Kesalahan logika pada penerapan pagination data list
- Kesalahan pada penggunaan state ketika menampilkan data list
- Error pada saat rendering data atau null value
- Unit dan widget testing yang tidak berjalan dengan semestinya dan memiliki hasil yang tidak sesuai ekspektasi (Optional)

> **Catatan:** Daftar bug sudah ditanamkan dalam kode dan perlu ditemukan serta diperbaiki.

---

## 📌 Kriteria Keberhasilan

| Kriteria           | Deskripsi                                                               |
| ------------------ | ----------------------------------------------------------------------- |
| ✅ Bugfix           | Semua 8 bug berhasil diidentifikasi dan diperbaiki                      |
| ✅ Fitur Baru       | Halaman detail user berhasil ditambahkan dan berjalan dengan semestinya |
| ✅ Navigasi         | Navigasi dari halaman Home ke Detail berjalan dengan lancar             |
| ✅ GetX             | GetX digunakan untuk state dan routing                                  |
| ✅ Struktur Kode    | Kode rapi dan mudah dibaca                                    |