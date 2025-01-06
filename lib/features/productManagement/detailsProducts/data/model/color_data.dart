import 'package:hive/hive.dart';
part 'color_data.g.dart';

@HiveType(typeId: 8)
class ColorOfProductData {
  @HiveField(0)
  final String? colorName;
  @HiveField(1)
  final String? colorHex;
  @HiveField(2)
  final List<String>? image;
  @HiveField(3)
final String? isMain;

  ColorOfProductData({this.colorHex, this.colorName,this.image,this.isMain});

  factory ColorOfProductData.fromJson(Map<String, dynamic> json) {
    return ColorOfProductData(
      colorName: json['color_name'] ?? "",
      colorHex: json['color_hex'] ?? "",
     image: List<String>.from(json['images']?.map((item) => item['image']) ?? []),
      isMain: json['color_hex'] ?? "0",
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  static List<ColorOfProductData> fromJsonColorList(List json) {
    return json.map((e) => ColorOfProductData.fromJson(e)).toList();
  }

  factory ColorOfProductData.empty() => ColorOfProductData(
    colorHex: "",
    colorName: "",
  );
}
