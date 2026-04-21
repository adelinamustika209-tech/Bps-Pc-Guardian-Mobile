import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Ganti baseUrl ini sesuai dengan lokasi tempat Anda menaruh folder backend di htdocs
  // Jika folder backend langsung di dalam htdocs, maka alamatnya:
  // "http://localhost/backend"
  // (Pastikan menggunakan IP Address seperti http://192.168.1.xxx/backend jika diakses dari Emulator Android/HP fisik)
  static const String baseUrl = "http://localhost/backend";

  static Future<dynamic> verifyLogin(
    String email,
    String password,
    String role,
  ) async {
    try {
      final url = Uri.parse('$baseUrl/login.php');
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "role": role,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return true; // Login success
        } else {
          return data['message']; // Pesan error dari backend (contoh: "Password salah")
        }
      } else {
        return "Gagal terhubung ke server HTTP (Error ${response.statusCode}).";
      }
    } catch (e) {
      return "Gagal terhubung ke backend API. Pastikan XAMPP (Apache) berjalan. Detail: $e";
    }
  }

  static Future<dynamic> resetPassword(String email, String newPassword) async {
    try {
      final url = Uri.parse('$baseUrl/reset_password.php');
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "newPassword": newPassword,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return true;
        } else {
          return data['message']; // Pesan error dari backend
        }
      } else {
        return "Gagal terhubung ke server HTTP (Error ${response.statusCode}).";
      }
    } catch (e) {
      return "Gagal terhubung ke backend API. Detail: $e";
    }
  }
}
