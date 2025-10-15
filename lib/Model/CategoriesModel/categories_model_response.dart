class CategoriesModelResponse {
  final String id;
  final String categoryName;
  final String imgUrl;
  final DateTime createdAt;

  CategoriesModelResponse({
    required this.id,
    required this.categoryName,
    required this.imgUrl,
    required this.createdAt,
  });

  factory CategoriesModelResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesModelResponse(
      id: json['id'] ?? '',
      categoryName: json['categoryName'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }
}
