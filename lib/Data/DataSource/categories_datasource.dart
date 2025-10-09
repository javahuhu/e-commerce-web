
import 'package:http/http.dart' as http;
import 'package:ecommerce_admin/Model/categories_model.dart';

class CategoriesDatasource {
  final String baseurl = "http://localhost:5268/api/category";

  Future<bool> addCategories(CategoriesModel categories) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseurl/Categories"),
      );

      request.fields['categoryName'] = categories.categoryname;

      request.files.add(
        await http.MultipartFile.fromPath('image', categories.imageFile.path),
      );

      var response = await request.send();

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
