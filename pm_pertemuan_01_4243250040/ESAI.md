# Perbandingan Native, Hybrid, dan Cross-platform
Pengembangan aplikasi mobile dapat dilakukan dengan tiga pendekatan: native, hybrid, dan cross-platform. Pada tugas ini saya menggunakan Flutter, sehingga saya mengalami langsung karakteristik pendekatan cross-platform.

Native berarti aplikasi dibuat khusus untuk satu platform, yaitu Kotlin atau Java untuk Android dan Swift untuk iOS. Kelebihannya adalah performa terbaik dan akses penuh ke fitur perangkat, sehingga cocok untuk game 3D atau aplikasi kamera. Kekurangannya, pengembang harus membuat dua basis kode terpisah sehingga biaya dan waktunya lebih besar.

Hybrid memakai teknologi web seperti HTML, CSS, dan JavaScript yang dibungkus dalam WebView, misalnya dengan Ionic atau Cordova. Pendekatan ini cepat dibuat dan cocok untuk aplikasi sederhana seperti katalog atau informasi kampus, tetapi performanya terbatas karena bergantung pada WebView.

Cross-platform, seperti Flutter, memakai satu basis kode untuk banyak platform dengan performa mendekati native. Pengalaman saya membuktikannya: satu proyek yang sama dapat dijalankan di emulator Android dan, secara teknis, juga di Chrome dan Windows tanpa mengubah kode. Fitur hot reload membuat perubahan nama atau widget langsung terlihat. Namun, persiapannya tidak selalu mudah. Saya sempat menghadapi masalah PATH dan NDK saat build Android gagal, sehingga harus memasang ulang komponen lewat Android Studio.

Kesimpulannya, pilihan bergantung pada kebutuhan, anggaran, dan waktu. Untuk aplikasi seperti e-commerce atau layanan startup, cross-platform adalah pilihan yang efisien.