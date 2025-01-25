Personal Printer App Project

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
Contoh QR Code
![DET001401](https://github.com/user-attachments/assets/379c7486-b644-4da2-81b1-ead69110d303)
DET001401
![DET001402](https://github.com/user-attachments/assets/cedb8b6b-d937-4236-83a5-b41ab0646d21)
DET001402
![DET001403](https://github.com/user-attachments/assets/0bc6551e-01a7-44da-9c06-5c1450c95a0f)
DET001403

Login Page dan example untuk login 
![WhatsApp Image 2025-01-25 at 19 45 29](https://github.com/user-attachments/assets/24b4fade-dd7b-4c34-b597-6a559644e455)
![WhatsApp Image 2025-01-25 at 19 45 28 (2)](https://github.com/user-attachments/assets/7310e979-0e72-4105-a375-4027f5a75ea7)

Dashboard dan ScanPage
![WhatsApp Image 2025-01-25 at 19 45 28 (1)](https://github.com/user-attachments/assets/21a000c3-0be2-4689-b943-5490a6068269)
![WhatsApp Image 2025-01-25 at 19 45 27 (1)](https://github.com/user-attachments/assets/f078d742-e913-4bfb-b0be-e18dc47cf118)

Profile dan Detail page
![WhatsApp Image 2025-01-25 at 19 45 28](https://github.com/user-attachments/assets/462a9adb-33b8-4da6-9962-47a3c791e0eb)
![WhatsApp Image 2025-01-25 at 19 45 27 (2)](https://github.com/user-attachments/assets/04bb9118-4da6-49ae-81ea-8beb5c6eb4d6)
![WhatsApp Image 2025-01-25 at 19 45 27](https://github.com/user-attachments/assets/a493dbd5-4d80-4bca-9338-48dd7777c7f9)


Teknologi dan Arsitektur SistemTeknologi yang Digunakan:
-	HTTP Library: Untuk menghubungkan aplikasi dengan API backend.
-	Shared Preferences: Menyimpan data pengguna secara lokal untuk pengalaman yang lebih personal.
-	QR Code Scanner: Memindai QR printer untuk mempercepat proses pencarian data.

Arsitektur Sistem:
-	Database: Menyimpan data printer seperti ID, nama, status, dan detail lainnya.
-	API: Menghubungkan aplikasi dengan database untuk pembaruan dan pengambilan data.
-	Framework: Flutter digunakan untuk pengembangan aplikasi lintas platform.

Tantangan Dalam Pengembangan Sistem
- Kurangnya pengetahuan dari segi backend sehingga aplikasi ini menggunakan API online dan data static sehingga belum bias digunakan 100%.
-	Integrasi QR Code Scanner: Memastikan semua QR code dapat dibaca dengan baik di berbagai kondisi pencahayaan.
-	Pengelolaan Data Offline: Menyimpan data sementara saat tidak ada koneksi internet.
-	Desain Antarmuka: Membuat UI yang intuitif agar mudah digunakan oleh semua pengguna.

Kesimpulan
Aplikasi ini membantu mengatasi masalah ketidaksesuaian data printer di lapangan dengan fitur-fitur modern seperti pemindai QR, pencarian printer, dan pengelolaan data secara efisien. Dengan teknologi seperti HTTP library, shared preferences, dan QR code scanner, aplikasi ini memberikan solusi praktis yang dapat meningkatkan produktivitas di tempat kerja.
![image](https://github.com/user-attachments/assets/5531a8aa-7756-4ae7-8755-27dff569c470)
