import 'package:ecommerce_admin/Domain/Entities/SubCategoriesEntities/subcategories_entities.dart';

abstract class SubcategoriesRepositories {
  Future<Map<String, dynamic>?> addSubCategories(SubCategoriesEntities subcategory);
}
