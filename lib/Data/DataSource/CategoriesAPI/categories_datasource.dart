import 'dart:convert';
import 'package:ecommerce_admin/Data/Models/category_model.dart';
import 'package:ecommerce_admin/Data/Models/category_model_response.dart';
import 'package:http/http.dart' as http;

class CategoriesDatasource {
  final String baseurl = "http://localhost:5013/api/category";

  Future<bool> addCategories(CategoryModel categories) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseurl/Categories"),
      );

      final name = categories.toJson();
      request.fields['categoryName'] = name["category_name"];

      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          categories.imageFile.bytes!,
          filename: categories.imageFile.name,
        ),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<CategoryModelResponse>> getCategories() async {
    final uri = Uri.parse("$baseurl/GetCategories");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => CategoryModelResponse.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load categories");
    }
  }
  
}
