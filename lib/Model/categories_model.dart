import 'dart:io';

class CategoriesModel {
  final dynamic imageFile;
  final String categoryname;

  CategoriesModel({required this.imageFile, required this.categoryname});

  CategoriesModel copyWith({final File? img, final String? categoryname}) {
    return CategoriesModel(
      imageFile: img ?? imageFile,
      categoryname: categoryname ?? this.categoryname,
    );
  }

  Map<String, dynamic> toJson() => {"img": imageFile, "category_name": categoryname};
}
