import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilepageView extends StatefulWidget {
  @override
  _ProfilepageViewState createState() => _ProfilepageViewState();
}

class _ProfilepageViewState extends State<ProfilepageView> {
  String? _username; // Menyimpan username pengguna
  String? _email; // Menyimpan email pengguna
  String? _image; // Menyimpan URL gambar profil pengguna

  // Fungsi untuk memuat data dari SharedPreferences
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Ambil data dari SharedPreferences atau gunakan nilai default jika null
      _username = prefs.getString('username') ?? 'Guest';
      _email = prefs.getString('email') ?? 'No email provided';
      _image = prefs.getString('image') ??
          'https://via.placeholder.com/150'; // URL default jika gambar tidak ditemukan
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Memuat data pengguna saat halaman pertama kali dibuka
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"), // Judul halaman
      ),
      body: Center(
        // Tampilkan indikator loading jika data belum tersedia
        child: _username == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tampilkan foto profil
                  CircleAvatar(
                    backgroundImage: NetworkImage(_image!), // Gambar dari URL
                    radius: 50, // Ukuran radius gambar
                  ),
                  SizedBox(height: 20),
                  // Menampilkan username
                  Text(
                    "Username: $_username",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Menampilkan email
                  Text(
                    "Email: $_email",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
      ),
    );
  }
}
