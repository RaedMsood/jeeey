class SizeData {
  final String? sizeTypeName;

  SizeData({this.sizeTypeName});

  factory SizeData.fromJson(Map<String, dynamic> json) {
    return SizeData(
      sizeTypeName: json['size_type_name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  static List<SizeData> fromJsonSizeList(List json) {
    return json.map((e) => SizeData.fromJson(e)).toList();
  }

  factory SizeData.empty() => SizeData(
        sizeTypeName: "",
      );
}
