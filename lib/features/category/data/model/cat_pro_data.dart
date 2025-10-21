import 'package:jeeey/features/category/data/model/category_data.dart';
import '../../../productManagement/detailsProducts/data/model/color_data.dart';
import '../../../productManagement/detailsProducts/data/model/paginated_products_list_data.dart';
import '../../../productManagement/detailsProducts/data/model/size_data.dart';

class CategoryAndProductData {

  final List<CategoryData>? category;
  final PaginatedProductsList? product;
  final List<ColorOfProductData>? colorFilter;
  final List<SizeData>? sizeFilter;
  final List<SizeData>? unitFilter;

  CategoryAndProductData({
    this.category,
    this.product,this.colorFilter,this.sizeFilter,this.unitFilter
  });

  factory CategoryAndProductData.fromJson(Map<String, dynamic> json) {
    return CategoryAndProductData(
      category: CategoryData.fromJsonCategoryList(json['categories']??[] ),
      product: PaginatedProductsList.fromJson(json['products']??PaginatedProductsList.empty()),
        colorFilter: ColorOfProductData.fromJsonColorList(json['colors']??[]),
        sizeFilter: SizeData.fromJsonSizeList(json['sizes']??[]),
      unitFilter: SizeData.fromJsonSizeList(json['units']??[]),

    );
  }

  Map<String, dynamic> toJson() {
    return {

    };
  }

  static List<CategoryAndProductData> fromJsonCategoryList(List json) {
    return json.map((e) => CategoryAndProductData.fromJson(e)).toList();
  }

  factory CategoryAndProductData.empty() => CategoryAndProductData(
      category: [],
    product: PaginatedProductsList.empty(),

  );
  CategoryAndProductData copyWith({
    List<CategoryData>? categories,
    PaginatedProductsList? products,
    List<ColorOfProductData>? colorsFilter,
     List<SizeData>? sizesFilter,
    List<SizeData>? unitsFilter,



  }) {
    return CategoryAndProductData(

      product: products ?? product,
      category: categories ?? category,
      colorFilter: colorsFilter??colorFilter,
      sizeFilter: sizesFilter??sizeFilter,
      unitFilter: unitsFilter??unitFilter,
    );
  }
// static final fakeSharesData = List.filled(
//     3,
//     ProductData(
//       walletId: 0,
//       name: "hh",
//       avgSellAmountShares:0.0,
//       avgPayAmountShares: 0.0,
//       companyId: 0,
//       id: 0,
//       numPayShares: "0",
//       numSellShares: "0",
//       userId: 0,
//       totalSaleProcess: 10,
//       totalBuyProcess: 10
//
//     ));
}
