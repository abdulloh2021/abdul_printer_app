import 'package:abdul_printer_app/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
// username dan password login
// https://dummyjson.com/users

class AuthController {
  // Fungsi untuk login
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await ApiService.login(username, password);

    if (response['success']) {
      // Simpan data user ke SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true); // Tandai pengguna sudah login

      prefs.setString(
          'username', response['data']['username']); // Simpan username
      prefs.setString('email', response['data']['email']); // Simpan email
      prefs.setString(
          'image', response['data']['image']); // Simpan gambar profil

      return {'success': true}; // Kembalikan status berhasil
    } else {
      return {
        'success': false,
        'message': response['message']
      }; // Kembalikan pesan error
    }
  }

  // Fungsi untuk logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Hapus semua data yang tersimpan di SharedPreferences
  }
}
