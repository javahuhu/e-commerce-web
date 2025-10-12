import 'package:file_picker/file_picker.dart';

class CategoriesModel {
  final PlatformFile imageFile;
  final String categoryname;

  CategoriesModel({required this.imageFile, required this.categoryname});

  CategoriesModel copyWith({
    final PlatformFile? img,
    final String? categoryname,
  }) {
    return CategoriesModel(
      imageFile: img ?? imageFile,
      categoryname: categoryname ?? this.categoryname,
    );
  }

  Map<String, dynamic> toJson() => {
    "category_name": categoryname,
  };
}
