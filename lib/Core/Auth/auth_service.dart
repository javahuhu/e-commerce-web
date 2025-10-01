import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce_admin/Model/user_model.dart';

class AuthService {
     final String baseurl = "http://localhost:5268/api/auth";

  Future<http.Response> login(LoginModel login) async {
    final response = await http.post(
      Uri.parse('$baseurl/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(login.toJson()),
    );

    return response;
  }

  Future<http.Response> register(SignUpModel signup) async {
    final response = await http.post(
      Uri.parse('$baseurl/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(signup.toJson()),
    );

    return response;
  }


}
