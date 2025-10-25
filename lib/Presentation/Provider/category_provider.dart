import 'package:ecommerce_admin/Data/DataSource/CategoriesAPI/categories_datasource.dart';
import 'package:ecommerce_admin/Data/Models/category_model_response.dart';
import 'package:ecommerce_admin/Data/Repositories/Implementation/categories_repositories_implementation.dart';
import 'package:ecommerce_admin/Data/Repositories/Abstract/categories_repositories.dart';
import 'package:ecommerce_admin/Application/UseCases/categories_usecases.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryProvider = Provider<CategoriesDatasource>((ref) {
  return CategoriesDatasource();
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final datasource = ref.read(categoryProvider);
  return CategoriesRepositoryImplementation(datasource);
});

final categoryUsecasesProvider = Provider<AddCategoriesUsecase>((ref) {
  final categoryrepository = ref.read(categoryRepositoryProvider);
  return AddCategoriesUsecase(categoryrepository);
});

final categoryResponseProvider = FutureProvider<List<CategoryModelResponse>>((
  ref
) async {
  final datasource = CategoriesDatasource();
  return await datasource.getCategories();
});
