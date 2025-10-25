
import 'package:ecommerce_admin/Data/Repositories/Abstract/categories_repositories.dart';
import 'package:ecommerce_admin/Domain/Entities/CategoriesEntities/categories_entities.dart';

class AddCategoriesUsecase {
  final CategoryRepository repository;

  AddCategoriesUsecase(this.repository);

  Future<bool> execute(CategoriesEntities category) async {
    if (category.categoryname.isEmpty) return false;

    await repository.addCategories(category);
    return true;
  }
}
