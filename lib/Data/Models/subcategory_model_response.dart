import 'package:ecommerce_admin/Domain/Entities/SubCategoriesEntities/subcategories_entities_response.dart';

class SubcategoryModelResponse extends SubcategoriesEntitiesResponse {
  SubcategoryModelResponse({
    required super.id,
    required super.category,
    required super.subcategoryName,
    required super.createdAt,
  });

  factory SubcategoryModelResponse.fromJson(Map<String, dynamic> json) {
    return SubcategoryModelResponse(
      id: json['id'] ?? '',
      subcategoryName: json['subcategoryName'] ?? '',
      category: json['category'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }
}
