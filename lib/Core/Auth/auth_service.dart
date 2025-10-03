import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce_admin/Model/user_model.dart';

class AuthService {
  final String baseurl = "http://localhost:5268/api/auth";

  Future<Map<String, dynamic>?> login(LoginModel login) async {
    try {
      final response = await http.post(
        Uri.parse('$baseurl/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(login.toJson()),
      );

      print("Login Response Code: ${response.statusCode}");
      print("Login Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> register(SignUpModel signup) async {
    try {
      final response = await http.post(
        Uri.parse('$baseurl/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(signup.toJson()),
      );

      print("Register Response Code: ${response.statusCode}");
      print("Register Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
    } catch (e) {
      print("Register Error: $e");
      return null;
    }
  }
}
