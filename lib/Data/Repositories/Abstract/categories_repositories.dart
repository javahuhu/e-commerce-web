import 'package:ecommerce_admin/Domain/Entities/CategoriesEntities/categories_entities.dart';

abstract class CategoryRepository {
  Future<bool> addCategories(CategoriesEntities category);
}

