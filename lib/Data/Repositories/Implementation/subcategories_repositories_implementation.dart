import 'package:ecommerce_admin/Data/DataSource/SubCategoriesAPI/subcategories_datasource.dart';
import 'package:ecommerce_admin/Data/Models/subcategory_model.dart';
import 'package:ecommerce_admin/Data/Repositories/Abstract/subcategories_repositories.dart';
import 'package:ecommerce_admin/Domain/Entities/SubCategoriesEntities/subcategories_entities.dart';

class SubcategoriesRepositoriesImplementation
    implements SubcategoriesRepositories {
  final SubcategoriesDatasource subcategoriesData;

  SubcategoriesRepositoriesImplementation(this.subcategoriesData);

  @override
  Future<Map<String, dynamic>?> addSubCategories(
    SubCategoriesEntities subcategory,
  ) async {
    final model = SubcategoryModel(
      category: subcategory.category,
      subcategoryName: subcategory.subcategoryName,
    );
    
    return await subcategoriesData.addSubCategories(model);
  }
}
