import 'package:ecommerce_admin/Domain/Entities/CategoriesEntities/categories_entities_response.dart';

class CategoryModelResponse extends CategoriesEntitiesResponse {
  CategoryModelResponse({
    required super.id,
    required super.categoryName,
    required super.imgUrl,
    required super.createdAt,
  });

  factory CategoryModelResponse.fromJson(Map<String, dynamic> json) {
    return CategoryModelResponse(
      id: json['id'] ?? '',
      categoryName: json['categoryName'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }
}
