import 'package:ecommerce_admin/Domain/Repositories/categories_repositories.dart';
import 'package:ecommerce_admin/Model/CategoriesModel/categories_model.dart';

class AddCategoriesUsecase {
  final CategoryRepository repository;

  AddCategoriesUsecase(this.repository);

  Future<bool> execute(CategoriesModel category) async {
    if (category.categoryname.isEmpty) return false;

    await repository.addCategories(category);
    return true;
  }
}
