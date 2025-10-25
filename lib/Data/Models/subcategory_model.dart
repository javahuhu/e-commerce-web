import 'package:ecommerce_admin/Domain/Entities/SubCategoriesEntities/subcategories_entities.dart';

class SubcategoryModel extends SubCategoriesEntities {
  SubcategoryModel({required super.category, required super.subcategoryName});

  Map<String, dynamic> toJson() => {
    "subcategoryName": subcategoryName,
    "Category": category,
  };
}
