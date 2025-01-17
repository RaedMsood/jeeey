import 'package:hive/hive.dart';
part 'category_data.g.dart';

@HiveType(typeId: 3)
class CategoryData {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? nameEn;

  final int? categoryLevel;
  final bool? hasChildren;

  CategoryData({
    this.id,
    this.name,
    this.nameEn,
    this.categoryLevel,
    this.hasChildren
  });


  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id']??0,
      name: json['name']??"",
     // nameEn: json['name_en']??"",

      categoryLevel: json['category_level']??0,
      hasChildren: json['has_children']??"",


    );
  }

  Map<String, dynamic> toJson() {
    return {

    };
  }

  // static List<PaySellData> fromJsonPaySellList(List<dynamic> json) {
  //   return json.map((e) => PaySellData.fromJson(e)).toList();
  // }

  static List<CategoryData> fromJsonCategoryList(List<dynamic> json) {
    return json.map((e) => CategoryData.fromJson(e)).toList();
  }

  factory CategoryData.empty() => CategoryData(
      name: "",
      categoryLevel: 0,
      id: 0
  );
static final fakeCategoriesData = List.filled(
    10,
    CategoryData(

      name: "",
      id: 0,

    ));
}
