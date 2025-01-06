import 'cart_product_model.dart';

class CartModel {
  final int id;
  final int? productId;
  final String? productName;
  final String? price;
  final String? currency;
  final int? quantity;
  final int? colorId;
  final String? colorName;
  final String? colorHex;
  final int? sizeId;
  final String? sizeName;
  final String? images;

  CartModel({
    required this.id,
    this.productId,
    this.productName,
    this.price,
    this.currency,
    this.quantity,
    this.colorId,
    this.colorName,
    this.colorHex,
    this.sizeId,
    this.sizeName,
    required this.images,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      productId: json['product_id'] as int?,
      productName: json['product_name'] ?? '',
      price: json['product_price'] ?? '',
      currency: json['product_currency'] ?? '',
      quantity: json['quantity'] as int?,
      colorId: json['color_id'] as int?,
      colorName: json['color_name'] ?? '',
      colorHex: json['color_hex'] ?? '',
      sizeId: json['size_id'] as int?,
      sizeName: json['size_value'] ?? '',
      images: json['image'] ?? "",
    );
  }

  static List<CartModel> fromJsonList(List json) {
    return json.map((e) => CartModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'size_type_id': sizeId,
      'color_id': colorId,
      'quantity': quantity,
    };
  }

  CartModel copyWith({
    int? id,
    int? productId,
    String? productName,
    String? price,
    String? currency,
    int? quantity,
    String? images,
    String? colorName,
    String? colorHex,
    int? colorId,
    int? sizeId,
    String? sizeName,
  }) {
    return CartModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      colorName: colorName ?? this.colorName,
      colorHex: colorHex ?? this.colorHex,
      colorId: colorId ?? this.colorId,
      sizeId: sizeId ?? this.sizeId,
      sizeName: sizeName ?? this.sizeName,
    );
  }

  CartModel updateCartProduct(CartProductModel updatedProduct) {
    if (id == updatedProduct.id) {
      return CartModel(
        id: id,
        productId: productId,
        productName: productName,
        price: price,
        currency: currency,
        quantity: updatedProduct.quantity,
        colorId: updatedProduct.colorId,
        colorName: updatedProduct.colorName,
        colorHex: updatedProduct.colorHex,
        sizeId: updatedProduct.sizeId,
        sizeName: updatedProduct.sizeName,
        images: images,
      );
    }
    return this;
  }
}
