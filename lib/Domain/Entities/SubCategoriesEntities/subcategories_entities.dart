class SubCategoriesEntities {
  final String category;
  final String subcategoryName;

  SubCategoriesEntities({
    required this.category,
    required this.subcategoryName,
  });

  SubCategoriesEntities copyWith({
    final String? category,
    final String? subcategoryName,
  }) {
    return SubCategoriesEntities(
      category: category ?? this.category,
      subcategoryName: subcategoryName ?? this.subcategoryName,
    );
  }

  
}
