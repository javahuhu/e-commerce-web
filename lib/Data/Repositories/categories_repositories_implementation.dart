import 'package:ecommerce_admin/Data/DataSource/categories_datasource.dart';
import 'package:ecommerce_admin/Domain/Repositories/categories_repositories.dart';
import 'package:ecommerce_admin/Model/CategoriesModel/categories_model.dart';

class CategoriesRepositoryImplementation implements CategoryRepository {
  final CategoriesDatasource categoriesData;

  CategoriesRepositoryImplementation(this.categoriesData);

  @override
  Future<bool> addCategories(CategoriesModel category) async {
    if (category.categoryname.isEmpty) return false;
    return await categoriesData.addCategories(category);
  }
}
