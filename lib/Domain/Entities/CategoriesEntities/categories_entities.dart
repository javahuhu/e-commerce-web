import 'package:file_picker/file_picker.dart';

class CategoriesEntities {
  final PlatformFile imageFile;
  final String categoryname;

  CategoriesEntities({required this.imageFile, required this.categoryname});

  CategoriesEntities copyWith({
    final PlatformFile? img,
    final String? categoryname,
  }) {
    return CategoriesEntities(
      imageFile: img ?? imageFile,
      categoryname: categoryname ?? this.categoryname,
    );
  }

 
}
