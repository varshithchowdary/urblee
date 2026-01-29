import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static const String baseUrl = "http://10.0.2.2:8080/api";
  // Android emulator uses 10.0.2.2 for localhost

  static Future<Map<String, String>> headers() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  static Future<http.Response> post(
      String endpoint,
      Map<String, dynamic> body,
      ) async {
    return http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: await headers(),
      body: jsonEncode(body),
    );
  }
}
