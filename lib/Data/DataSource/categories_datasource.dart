import 'package:ecommerce_admin/Model/categories_model.dart';
import 'package:http/http.dart' as http;

class CategoriesDatasource {
  final String baseurl = "http://localhost:5268/api/category";

  Future<bool> addCategories(CategoriesModel categories) async {
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
}
