class ProductColorModel {
  final int? colorId;
  final String? colorHex;
  final String? colorName;
  final int isMain;
  final List<ImagesModel>? images;

  ProductColorModel({
    this.colorId,
    this.colorHex,
    this.colorName,
    required this.isMain,
    this.images,
  });

  factory ProductColorModel.fromJson(Map<String, dynamic> json) {
    return ProductColorModel(
      colorId: json['color_id'] as int?,
      colorHex: json['color_hex'] ?? '',
      colorName: json['color_name'] ?? '',
      isMain: json['is_main'],
      images: ImagesModel.fromJsonList(json['images'] ?? []),
    );
  }

  static List<ProductColorModel> fromJsonList(List json) {
    return json.map((e) => ProductColorModel.fromJson(e)).toList();
  }
}

class ImagesModel {
  final int id;
  final String image;

  ImagesModel({
    required this.id,
    required this.image,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(
      id: json['id'],
      image: json['image'] ?? '',
    );
  }

  static List<ImagesModel> fromJsonList(List json) {
    return json.map((e) => ImagesModel.fromJson(e)).toList();
  }
  factory ImagesModel.empty() => ImagesModel(
    id: 0,
    image: '',

  );
}
