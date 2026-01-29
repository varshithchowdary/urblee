import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/api/api_client.dart';

class AuthService {
  static Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(
      "/auth/register",
      {
        "name": name,
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode != 200) {
      throw Exception("Registration failed");
    }
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(
      "/auth/login",
      {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    } else {
      throw Exception("Invalid login");
    }
  }
}
