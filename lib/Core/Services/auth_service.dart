import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce_admin/Domain/Entities/UserEntities/user_entities.dart';

class AuthService {
  final String baseurl = "http://localhost:5013/api/auth";

  Future<Map<String, dynamic>?> login(LoginModel login) async {
    try {
      final response = await http.post(
        Uri.parse('$baseurl/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(login.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data;
      } else {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
    } catch (e) {
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

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
    } catch (e) {
      return null;
    }
  }
}
