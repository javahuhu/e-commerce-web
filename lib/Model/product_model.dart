class ProductModel {
  final List<String> img;
  final String productname;
  final String productdetails;
  final String brand;
  final String category;
  final int size;
  final double price;
  final double offeredprice;
  final int quantity;

  ProductModel({
    required this.img,
    required this.productname,
    required this.productdetails,
    required this.brand,
    required this.category,
    required this.size,
    required this.price,
    required this.offeredprice,
    required this.quantity,
  });

  ProductModel copyWith({
    final List<String>? img,
    final String? productname,
    final String? productdetails,
    final String? brand,
    final String? category,
    final int? size,
    final double? price,
    final double? offeredprice,
    final int? quantity,
  }) {
    return ProductModel(
      img: img ?? this.img,
      productname: productname ?? this.productname,
      productdetails: productdetails ?? this.productdetails,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      size: size ?? this.size,
      price: price ?? this.price,
      offeredprice: offeredprice ?? this.offeredprice,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() => {
    "img": img,
    "Product Name": productname.trim(),
    "Product Details": productdetails.trim(),
    "Brand": brand.trim(),
    "Category": category.trim(),
    "Size": size,
    "price": price,
    "Offered Price": offeredprice,
    "Quantity": quantity,
  };
}
