import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://dummyjson.com/auth"; // URL dasar API

  // Fungsi untuk login
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'}, // Header untuk JSON
      body: json.encode(
          {'username': username, 'password': password}), // Body permintaan
    );

    if (response.statusCode == 200) {
      // Login berhasil
      return {'success': true, 'data': json.decode(response.body)};
    } else {
      // Login gagal
      return {
        'success': false,
        'message': json.decode(response.body)['message']
      };
    }
  }
}
