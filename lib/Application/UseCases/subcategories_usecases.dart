import 'package:ecommerce_admin/Data/Repositories/Abstract/subcategories_repositories.dart';
import 'package:ecommerce_admin/Domain/Entities/SubCategoriesEntities/subcategories_entities.dart';

class AddSubCategoriesUsecase {
  final SubcategoriesRepositories repository;

  AddSubCategoriesUsecase(this.repository);

  Future<Map<String, dynamic>?> execute(SubCategoriesEntities subcategory) async {
    if (subcategory.subcategoryName.isEmpty) return null;
    return await repository.addSubCategories(subcategory);
  }
}
