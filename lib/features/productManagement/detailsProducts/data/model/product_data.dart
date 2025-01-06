import 'package:hive/hive.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/color_data.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/size_data.dart';

import 'details_product_data.dart';

part 'product_data.g.dart';

@HiveType(typeId: 5)
class ProductData {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? price;
  @HiveField(3)
  final int? categoryId;
  @HiveField(4)
  final String? discount;
  @HiveField(5)
  final String? description;
  @HiveField(6)
  final String? currency;

  final int? sizeType;
  final List<DetailsProductData>? detailsProduct;

  final List<ColorOfProductData>? colorsProduct;

  @HiveField(9)
  final List<String>? mainImage;
  final List<SizeData>? sizeProduct;

  ProductData(
      {this.id,
      this.name,
      this.price,
      this.categoryId,
      this.discount,
      this.description,
      this.currency,
      this.sizeType,
      this.detailsProduct,
      this.colorsProduct,
      this.sizeProduct,
      this.mainImage});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      price: json['base_price'] ?? "0",
      categoryId: json['category_id'] ?? 0,
      discount: json['discount_price'] ?? "0",
      description: json['description'] ?? "",
      currency: json['currency'] ?? "",
      sizeType: json['size_type_id'] ?? 0,
      detailsProduct: DetailsProductData.fromJsonDetailsProductList(
          json['product_details'] ?? []),
      colorsProduct:
          ColorOfProductData.fromJsonColorList(json['product_colors'] ?? []),
      sizeProduct: SizeData.fromJsonSizeList(json['size_type_details'] ?? []),
      mainImage: List<String>.from(json['main_imags']?.map((item) => item['image']) ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  static List<ProductData> fromJsonProductList(List<dynamic> json) {
    return json.map((e) => ProductData.fromJson(e)).toList();
  }

  factory ProductData.empty() =>
      ProductData(name: "", price: "0", id: 0, categoryId: 0);

  static final fakeProductData = List.filled(
      2,
      ProductData(
        name: "",
        id: 0,
        price: "0",
      ));
}
