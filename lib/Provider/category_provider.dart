import 'package:ecommerce_admin/Data/DataSource/categories_datasource.dart';
import 'package:ecommerce_admin/Data/Repositories/categories_repositories_implementation.dart';
import 'package:ecommerce_admin/Domain/Repositories/categories_repositories.dart';
import 'package:ecommerce_admin/Domain/UseCases/categories_usecases.dart';
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
