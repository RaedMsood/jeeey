import 'product_color_model.dart';

class CartProductModel {
  final int id;
  final int productId;
  final int quantity;
  final int colorId;
  final int sizeId;
  final String colorHex;
  final String colorName;
  final String sizeName;
  final ImagesModel images;
  // final double? totalPrice;

  CartProductModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.colorId,
    required this.sizeId,
    required this.colorHex,
    required this.colorName,
    required this.sizeName,
    required this.images,
    // this.totalPrice,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      colorId: json['color_id'],
      sizeId: json['size_id'],
      sizeName: json['size_name'] ?? "",
      colorHex: json['color_hex'] ?? '',
      colorName: json['color_name'] ?? '',
      images: ImagesModel.fromJson(json['image'] ??json),
    );
  }

  factory CartProductModel.empty() => CartProductModel(
        id: 0,
        productId: 0,
        quantity: 0,
        colorId: 0,
        sizeId: 0,
        colorHex: '',
        colorName: '',
        sizeName: '',
        images: ImagesModel.empty(),

      );
}
