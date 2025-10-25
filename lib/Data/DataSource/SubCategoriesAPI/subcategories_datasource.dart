import 'dart:convert';
import 'package:ecommerce_admin/Data/Models/subcategory_model.dart';
import 'package:ecommerce_admin/Data/Models/subcategory_model_response.dart';
import 'package:http/http.dart' as http;

class SubcategoriesDatasource {
  final String baseurl = "http://localhost:5013/api/subcategory";

  Future<Map<String, dynamic>?> addSubCategories(
    SubcategoryModel subcategories,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("$baseurl/subcategories"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(subcategories.toJson()),
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

  Future<List<SubcategoryModelResponse>> getSubCategories() async {
    final uri = Uri.parse('$baseurl/GetSubCategories');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => SubcategoryModelResponse.fromJson(e)).toList();
    } else {
      throw Exception('Failed to Load Sub Categories');
    }
  }
}
