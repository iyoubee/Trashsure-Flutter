# TrashSure

[![Develop][actions2-badge]][commits-gh]
[![Pre-Release][actions-badge]][commits-gh]
[![Release][actions1-badge]][commits-gh]
[![Build status](https://build.appcenter.ms/v0.1/apps/aaeb99d2-a401-41f3-b38b-4602ec50334b/branches/main/badge)](https://appcenter.ms)

TrashSure hadir sebagai solusi digital untuk mengorganisir sampah secara efektif dengan imbalan yang menarik!

> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS)
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2022/2023.

### 👋🏽 Kelompok F08 - PBP F 👋🏽

- Aghniya Zhafira Urfa - 2106654164
- Andresha Pradana - 2106651591
- Dhina Rotua Mutiara - 2106702182
- Muhammad Hilman Al Ayubi - 2106706653
- Trisno Bayu Pamungkas - 2106702200

### ✨ Trash-sure ✨

- [Tautan Website](http://trashsure.iyoubee.xyz/)
- [Unduh APK](https://install.appcenter.ms/users/al-ayubi2020/apps/trashsure/distribution_groups/public)

### 📝 Cerita Aplikasi dan Manfaat 📝

&emsp;&emsp;&emsp;Penumpukan limbah plastik dan elektronik kini sudah menjadi suatu fenomena yang cukup memprihatinkan. Data menyebutkan bahwa penggunaan sampah plastik di Indonesia mencapai 100 milyar kantong setiap tahunnya. Pengelolaan yang belum ditangani dengan baik serta minimnya aktivitas daur ulang berdampak pada penumpukan sampah yang tidak terkontrol. Padahal, optimalisasi daur ulang sampah elektronik di Indonesia dapat membantu perekonomian dengan perkiraan mencapai 1,8 miliar dollar AS.
<br>&emsp;&emsp;&emsp;Aplikasi yang ingin kami ajukan adalah aplikasi Trash-sure. Trash-sure merupakan aplikasi yang berfungsi sebagai solusi dari isu Sustainable Energy Transition dan juga Digital Transformation. Aplikasi ini akan membantu membentuk lingkungan yang lebih bersih, mengurangi perubahan iklim, restorasi ekonomi pasca pandemi, dan mengubah solusi yang sebelumnya tradisional menjadi digital.
<br>&emsp;&emsp;&emsp;Dengan adanya aplikasi Trash-sure, pengelolaan sampah akan lebih terorganisir dan efektif. Aplikasi Trash-sure juga dapat membantu perekonomian masyarakat karena Trash-sure memberikan imbalan untuk tiap sampah yang disetor. Dengan adanya imbalan, masyarakat tentunya akan lebih semangat untuk mengumpulkan sampah sehingga dalam jangka panjang, lingkungan akan menjadi lebih bersih.

### 📒 Daftar Modul yang Akan Diimplementasikan 📒

Aplikasi Trash-Sure memiliki beberapa fitur, antara lain:

1. **Landing Page**
   Fitur ini merupakan laman awal dari aplikasi yang memuat _background story_ dari aplikasi Trash-sure, poin-poin keunggulan dari Trash-sure, serta fitur ulasan aplikasi.

- Dikerjakan oleh Andresha Pradana

2. **Authentification Page**
   Fitur ini merupakan metode keamanan yang diterapkan ketika seorang _user_ akan mengakses aplikasi Trash-sure dengan memasukan _username_ dan _password_ terlebih dahulu. Hal ini bertujuan untuk memastikan bahwa _user_ yang akan mengakses memang benar-benar adalah pengguna yang berhak.

- Dikerjakan oleh Muhammad Hilman Al Ayubi

3. **Admin Dashboard dan Seluruh Fungsi Admin**
   Admin dashboard merupakan pusat control panel ber-platform yang berfungsi untuk mengatur semua kegiatan di sebuah aplikasi. Pada laman ini, admin dapat melihat jumlah pengguna aplikasi Trash-sure dan total deposit, serta menambahkan transaksi setoran bank sampah milik user.

- Dikerjakan oleh Muhammad Hilman Al Ayubi

4. **Add and History Deposit on User Dashboard**
   Fitur ini dapat digunakan _user_ ketika ingin melakukan penyetoran sampah jenis plastik atau elektronik dalam skala kilogram. Setiap kali _user_ menyetorkan sampah, akan tercatat untuk setiap jenis sampah yang disetorkan, jumlah poin yang didapat, sesuai dengan tanggal yang berlaku.

- Dikerjakan oleh Aghniya Zhafira Urfa

5. **Point Reedemption on User Dashboard**
   Fitur ini merupakan laman untuk menukarkan poin yang telah dikumpulkan oleh _user_ dengan berbagai pilihan hadiah yang tersedia.

- Dikerjakan oleh Trisno Bayu Pamungkas

6. **Add and History Withdraw on User Dashboard**
   Fitur ini merupakan laman _user_ untuk menarik hadiah berupa uang tunai yang didapatkan dari pengumpulan poin setelah melakukan penyetoran sampah. Setiap kali _user_ melakukan penarikan, akan tercatat jumlah penarikan serta tanggal saat penarikan.

- Dikerjakan oleh Dhina Rotua Mutiara

### Role Pengguna dan Deskripsinya

**Admin:**

- Menambahkan transaksi setoran bank sampah milik User
- Menyetujui setoran sampah yang dilakukan oleh User
- Membuat Hadiah yang dapat ditukarkan oleh User berdasarkan poinnya
- Melihat statistik banyak pengguna total dan banyak setoran total <br>

**User:**

- Melihat poin dan saldo yang dimiliki
- Membuat permintaan setor sampah
- Melihat riwayat setoran beserta statusnya
- Menarik saldo yang dia miliki
- Melihat riwayat penarikan saldo
- Menukarkan poin dengan hadiah-hadiah menarik
- Melihat hadiah yang telah ditukar
- Menggunakan hadiah yang sudah ditukar
- Memberikan testimoni kepada aplikasi

### 🧑‍💻 Persona 🧑‍💻

1. User yang **tidak** melakukan **login** aplikasi

- Dapat melihat informasi pada _landing page_
- Dapat melihat testimoni dari aplikasi Trash-sure

2. User yang melakukan **login** aplikasi

- Dapat merasakan seluruh fitur yang disediakan berdasarkan role yang sudah ditentukan.

### 🔗 Integrasi dengan Situs Web 🔗

Berikut adalah langkah-langkah yang akan dilakukan untuk mengintegrasikan aplikasi dengan server web.

1. Mengimplementasikan sebuah _wrapper class_ dengan menggunakan library _http_ serta pbp_django_auth yang dibentuk oleh tim asdos untuk mendukung cookie, session, dan authentification pada app Trashsure
2. Mengimplementasikan Django REST dengan menggunakan JsonResponse atau Django JSON Serializer untuk di request GET dalam apk.
3. Mengimplementasikan desain _front-end_ untuk aplikasi berdasarkan desain website yang sudah ada sebelumnya.
4. Melakukan integrasi antara _front-end_ dengan _back-end_ dengan menggunakan konsep _asynchronous_ HTTP.

### 💡 Referensi 💡

- [Rancang Bangun _Dashboard Admin_ Pemantauan Berbasis Web di PT. Astra Graphia Information Technology](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiN7Oryxo_7AhVoD7cAHY9NDKYQFnoECAYQAw&url=https%3A%2F%2Fzenodo.org%2Frecord%2F1218677%2Ffiles%2FJurnal%2520Ferliesha%2520Yuni%2520Hartanti-4314111018.pdf&usg=AOvVaw2FXNuZbcQ-7JUM7Xm0UzAz)

[actions-badge]: https://github.com/al-ayubi2020/Trashsure-Flutter/actions/workflows/pre-release.yml/badge.svg
[actions1-badge]: https://github.com/al-ayubi2020/Trashsure-Flutter/actions/workflows/release.yml/badge.svg
[actions2-badge]: https://github.com/al-ayubi2020/Trashsure-Flutter/actions/workflows/staging.yml/badge.svg
[commits-gh]: https://github.com/al-ayubi2020/Trashsure-Flutter/commits/main
