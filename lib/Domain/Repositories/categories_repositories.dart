import 'package:ecommerce_admin/Model/categories_model.dart';

abstract class CategoryRepository {
  Future<bool> addCategories(CategoriesModel category);
}

