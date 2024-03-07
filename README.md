# TP1PROVIS2024C2
# Penjelasan Program
Program ini menggunakan konsep Object-Oriented Programming (OOP) dan Asynchronous untuk mensimulasikan game bertipe turn based. Berikut penjelasannya:

1. Object-Oriented Programming (OOP):

Program menggunakan konsep OOP dengan mendefinisikan sebuah kelas Character. Kelas ini berfungsi sebagai sebuah cetakan untuk membuat objek-objek yang memiliki sifat dan perilaku yang sama.
Kelas Character memiliki beberapa metode, seperti name, health, damage, dan bolean tipe menentukan hidup atau mati. Metode-metode ini menggambarkan perilaku yang terkait dengan objek charcter, lalu ada kelas hero yang bernama asep dan kelas monster dengan jumlah 2 monster, asep memiliki hit point 175 mana 30 serangan biasa dengan damage 10
dan serengahn sihir dengan damage 30, lalu tiap monster memiliki damage serangan 15 dan healtpoint 70 dan 80
2. Asynchronous Programming:

Menggunakan Future dan async-await untuk mengimplementasikan asynchronous programming.
Fungsi async dan await digunakan untuk memberi jeda (delay) dalam permainan agar tidak berjalan terlalu cepat. Ini memungkinkan pesan-pesan dan aksi dalam permainan untuk ditampilkan dengan jelas dan memberi waktu kepada pengguna untuk membaca pesan dan membuat pilihan. Jadi, ketika ada perintah await Future.delayed(Duration(seconds: 1));, program akan menunggu selama 1 detik sebelum melanjutkan eksekusi. Hal ini membuat alur permainan menjadi lebih mudah dipahami dan dinikmati oleh pengguna.

#Dokumentasi Program
1. Pilih opsi 2 atau 3 untuk memilih monster mana yang akan diserang lalu pilih 1 untuk menyerang menggunakan serangan biasa
   <img width="464" alt="Tampilan awal asep milih" src="https://github.com/NaufalNabil617/TP1PROVIS2024C2/assets/147363037/82ba8839-2fb8-4a05-8c70-b782950460d6">
2. Pilih opsi 2 untuk serangan sihir
   <img width="468" alt="asep menggunaikan sihir" src="https://github.com/NaufalNabil617/TP1PROVIS2024C2/assets/147363037/c073fa85-1073-4dd7-bd6e-2f4c8c192111">
3. Jika salah satu monster mati
   <img width="475" alt="Kondisi monster mati" src="https://github.com/NaufalNabil617/TP1PROVIS2024C2/assets/147363037/75497377-d8cb-441f-8a06-1405233cad67">
4. Jika asep kehabisan mana
   <img width="466" alt="asep kehabisan mana" src="https://github.com/NaufalNabil617/TP1PROVIS2024C2/assets/147363037/791a7295-7433-42ef-8f65-9088150a42f4">
5. Jika asep kalah
   <img width="512" alt="asep kalah" src="https://github.com/NaufalNabil617/TP1PROVIS2024C2/assets/147363037/e31050b4-9fde-447e-a758-4ec41dee5d42">
6. Jika asep menang
   <img width="484" alt="Kondisi asep menang" src="https://github.com/NaufalNabil617/TP1PROVIS2024C2/assets/147363037/65cfacd7-04bd-4861-a7c4-a784b586d2ab">





