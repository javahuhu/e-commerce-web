import 'package:ecommerce_admin/Model/CategoriesModel/categories_model.dart';

abstract class CategoryRepository {
  Future<bool> addCategories(CategoriesModel category);
}

