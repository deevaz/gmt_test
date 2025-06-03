# 📱 Flutter Test Case Project - User List & Detail

## 📋 Deskripsi Proyek

Ini adalah proyek Flutter berskala kecil yang dirancang untuk menguji kemampuan teknikal pengembang dalam hal debugging, pengelolaan state, dan penambahan fitur menggunakan **Flutter** dan **GetX**.

---

## 🎯 Tujuan

- Memperbaiki **4 bug** yang telah tersebar di dalam project.
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

Terdapat **4 bug** yang tersebar di dalam aplikasi. Bug bisa berkaitan dengan:

- Kesalahan logika pada saat menampilkan state loading pada halaman home ketika menampilkan data list user
- Kesalahan ketika merefresh list, tetapi daftar pada list tidak ter-refresh
- Kesalahan logika pada penerapan pagination data list
- Error pada saat rendering data atau null value

> **Catatan:** Daftar bug sudah ditanamkan dalam kode dan perlu ditemukan serta diperbaiki.

---

## 📌 Kriteria Keberhasilan

| Kriteria           | Deskripsi                                                               |
| ------------------ | ----------------------------------------------------------------------- |
| ✅ Bugfix           | Semua 4 bug berhasil diidentifikasi dan diperbaiki                      |
| ✅ Fitur Baru       | Halaman detail user berhasil ditambahkan dan berjalan dengan semestinya |
| ✅ Navigasi         | Navigasi dari halaman Home ke Detail berjalan dengan lancar             |
| ✅ GetX             | GetX digunakan untuk state dan routing                                  |
| ✅ Struktur Kode    | Kode rapi dan mudah dibaca                                    |