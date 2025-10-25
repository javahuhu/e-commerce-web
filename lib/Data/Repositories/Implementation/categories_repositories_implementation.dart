import 'package:ecommerce_admin/Data/DataSource/CategoriesAPI/categories_datasource.dart';
import 'package:ecommerce_admin/Data/Models/category_model.dart';
import 'package:ecommerce_admin/Data/Repositories/Abstract/categories_repositories.dart';
import 'package:ecommerce_admin/Domain/Entities/CategoriesEntities/categories_entities.dart';

class CategoriesRepositoryImplementation implements CategoryRepository {
  final CategoriesDatasource categoriesData;

  CategoriesRepositoryImplementation(this.categoriesData);

  @override
  Future<bool> addCategories(CategoriesEntities category) async {
    final model = CategoryModel(
      categoryname: category.categoryname,
      imageFile: category.imageFile,
    );
    return await categoriesData.addCategories(model);
  }
}
