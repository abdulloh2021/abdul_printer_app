Latar Belakang dan Tujuan :

Di kantor, sering terjadi masalah ketidaksesuaian data printer dengan kondisi di lapangan, terutama saat printer sedang diservis atau saat pengguna perlu menghubungkannya kembali ke PC. Aplikasi ini bertujuan untuk mempermudah pengelolaan data printer dan memastikan data selalu akurat, sehingga pekerjaan menjadi lebih efisien.

Masalah dan Solusi
-	Masalah:
o	Data printer sering tidak sesuai dengan kondisi nyata.
o	Sulitnya melacak status printer (aktif, servis, atau tidak aktif).
o	Pengguna kesulitan menghubungkan ulang printer ke PC.

-	Solusi:
o	Membuat aplikasi dengan fitur pemindai QR untuk memeriksa dan memperbarui status printer secara langsung.
o	Menyediakan daftar printer yang dapat dicari dan difilter.
o	Mengintegrasikan data printer dengan status real-time menggunakan teknologi modern.


Gambar Pendukung
(Tambahkan gambar atau ilustrasi sistem di sini)

Teknologi dan Arsitektur SistemTeknologi yang Digunakan:
-	HTTP Library: Untuk menghubungkan aplikasi dengan API backend.
-	Shared Preferences: Menyimpan data pengguna secara lokal untuk pengalaman yang lebih personal.
-	QR Code Scanner: Memindai QR printer untuk mempercepat proses pencarian data.

Arsitektur Sistem:
-	Database: Menyimpan data printer seperti ID, nama, status, dan detail lainnya.
-	API: Menghubungkan aplikasi dengan database untuk pembaruan dan pengambilan data.
-	Framework: Flutter digunakan untuk pengembangan aplikasi lintas platform.

Tantangan Dalam Pengembangan Sistem
-	Integrasi QR Code Scanner: Memastikan semua QR code dapat dibaca dengan baik di berbagai kondisi pencahayaan.
-	Pengelolaan Data Offline: Menyimpan data sementara saat tidak ada koneksi internet.
-	Desain Antarmuka: Membuat UI yang intuitif agar mudah digunakan oleh semua pengguna.

Kesimpulan
Aplikasi ini membantu mengatasi masalah ketidaksesuaian data printer di lapangan dengan fitur-fitur modern seperti pemindai QR, pencarian printer, dan pengelolaan data secara efisien. Dengan teknologi seperti HTTP library, shared preferences, dan QR code scanner, aplikasi ini memberikan solusi praktis yang dapat meningkatkan produktivitas di tempat kerja.
![image](https://github.com/user-attachments/assets/5531a8aa-7756-4ae7-8755-27dff569c470)
