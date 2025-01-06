import 'product_color_model.dart';

class ProductDetailsForCartModel {
  final int? id;
  final String? name;
  final int? categoryId;
  final String? categoryName;
  final String? basePrice;
  final String? discountPrice;
  final String? discountEndDate;
  final String? description;
  final int? quantity;
  final String? currency;
  final int? sizeTypeId;
  final String? sizeTypeName;
  final List<SizeTypeDetailModel>? sizeTypeDetails;
  final List<ProductColorModel>? productColors;

  ProductDetailsForCartModel({
    this.id,
    this.name,
    this.categoryId,
    this.categoryName,
    this.basePrice,
    this.discountPrice,
    this.discountEndDate,
    this.description,
    this.quantity,
    this.currency,
    this.sizeTypeId,
    this.sizeTypeName,
    this.sizeTypeDetails,
    this.productColors,
  });

  factory ProductDetailsForCartModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsForCartModel(
      id: json['id'] as int?,
      name: json['name'] ?? "",
      categoryId: json['category_id'] as int?,
      categoryName: json['category_name'] ?? "",
      basePrice: json['base_price'] ?? "",
      discountPrice: json['discount_price'] ?? "",
      discountEndDate: json['discount_end_data'] ?? "",
      description: json['description'] ?? "",
      quantity: json['quantity'],
      currency: json['currency'] ?? "",
      sizeTypeId: json['size_type_id'] as int?,
      sizeTypeName: json['size_type_name'] ?? "",
      sizeTypeDetails:
          SizeTypeDetailModel.fromJsonList(json['size_type_details'] ?? []),
      productColors:
          ProductColorModel.fromJsonList(json['product_colors'] ?? []),
    );
  }

  factory ProductDetailsForCartModel.empty() => ProductDetailsForCartModel(
        id: 0,
        name: '',
        categoryId: 0,
        categoryName: '',
        basePrice: '',
        discountPrice: '',
        discountEndDate: '',
        description: '',
        quantity: 0,
        currency: '',
        sizeTypeId: 0,
        sizeTypeName: '',
        sizeTypeDetails: [],
        productColors: [],
      );
}

class SizeTypeDetailModel {
  final int? sizeTypeId;
  final String? sizeTypeName;

  SizeTypeDetailModel({
    this.sizeTypeId,
    this.sizeTypeName,
  });

  factory SizeTypeDetailModel.fromJson(Map<String, dynamic> json) {
    return SizeTypeDetailModel(
      sizeTypeId: json['size_type_id'] as int?,
      sizeTypeName: json['size_type_name'] ?? "",
    );
  }

  static List<SizeTypeDetailModel> fromJsonList(List json) {
    return json.map((e) => SizeTypeDetailModel.fromJson(e)).toList();
  }
}
