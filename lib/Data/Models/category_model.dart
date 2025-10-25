import 'package:ecommerce_admin/Domain/Entities/CategoriesEntities/categories_entities.dart';

class CategoryModel extends CategoriesEntities {
  CategoryModel({required super.categoryname, required super.imageFile});

  Map<String, dynamic> toJson() => {"category_name": categoryname};
}
