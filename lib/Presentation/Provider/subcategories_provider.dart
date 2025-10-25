import 'package:ecommerce_admin/Data/DataSource/SubCategoriesAPI/subcategories_datasource.dart';
import 'package:ecommerce_admin/Data/Models/subcategory_model_response.dart';
import 'package:ecommerce_admin/Data/Repositories/Implementation/subcategories_repositories_implementation.dart';
import 'package:ecommerce_admin/Data/Repositories/Abstract/subcategories_repositories.dart';
import 'package:ecommerce_admin/Application/UseCases/subcategories_usecases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subcategoryProvider = Provider<SubcategoriesDatasource>((ref) {
  return SubcategoriesDatasource();
});

final subcategoryRepositoryProvider = Provider<SubcategoriesRepositories>((
  ref,
) {
  final datasource = ref.read(subcategoryProvider);
  return SubcategoriesRepositoriesImplementation(datasource);
});

final subcategoryUsecasesProvider = Provider<AddSubCategoriesUsecase>((ref) {
  final datasource = ref.read(subcategoryRepositoryProvider);
  return AddSubCategoriesUsecase(datasource);
});

final subcategoryResponseProvider =
    FutureProvider<List<SubcategoryModelResponse>>((ref) async {
      final datasource = SubcategoriesDatasource();
      return await datasource.getSubCategories();
    });
