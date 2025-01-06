import 'package:jeeey/features/category/data/model/category_data.dart';

import '../../../productManagement/detailsProducts/data/model/paginated_products_list_data.dart';
import '../../../productManagement/detailsProducts/data/model/product_data.dart';

class CategoryAndProductData {

  final List<CategoryData>? category;
  final PaginatedProductsList? product;

  CategoryAndProductData({
    this.category,
    this.product
  });

  factory CategoryAndProductData.fromJson(Map<String, dynamic> json) {
    return CategoryAndProductData(
      category: CategoryData.fromJsonCategoryList(json['categories']??[] ),
      product: PaginatedProductsList.fromJson(json['products']??PaginatedProductsList.empty()),
      // product: (json['products'] as List)
      //     .map((product) => ProductData.fromJson(product))
      //     .toList(),
      // category: (json['categories'] as List )
      //     .map((category) => CategoryData.fromJson(category))
      //     .toList(),
      //product: ProductData.fromJson(json[products]);
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
  }) {
    return CategoryAndProductData(

      product: products ?? product,
      category: categories ?? category,
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
