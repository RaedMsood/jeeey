import 'package:jeeey/features/profile/myOrders/data/model/order_data_model.dart';

class OrdersModel {
  final int currentPage;
  final List<OrderDataModel> orders;
  // final int? lastPage;
  // final String? lastPageUrl;

  // final List<LinkModel>? links;
  // final String? nextPageUrl;
  // final String? path;
  // final int? perPage;
  // final String? prevPageUrl;
  // final int? to;
  // final int? total;

  OrdersModel({
    required this.currentPage,
    this.orders = const [],
    // this.firstPageUrl,
    // this.from,
    // this.lastPage,
    // this.lastPageUrl,
    // this.links,
    // this.nextPageUrl,
    // this.path,
    // this.perPage,
    // this.prevPageUrl,
    // this.to,
    // this.total,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      currentPage: json['current_page'] ?? 0,
      orders: OrderDataModel.fromJsonList(json['data'] ?? []),
      // from: json['from'] ?? '',
      // lastPage: json['last_page'] ?? '',
      // lastPageUrl: json['last_page_url'],
      // links: (json['links'] as List?)
      //     ?.map((link) => LinkModel.fromJson(link))
      //     .toList() ??
      //     [],
      // nextPageUrl: json['next_page_url'],
      // path: json['path'],
      // perPage: json['per_page'],
      // prevPageUrl: json['prev_page_url'] ?? '',
      // to: json['to'] as int?,
      // total: json['total'],
    );
  }

  factory OrdersModel.empty() => OrdersModel(
        currentPage: 0,
        orders: [],
        // categoryId: 0,
        // categoryName: '',
        // basePrice: '',
        // discountPrice: '',
        // discountEndDate: '',
        // description: '',
        // quantity: 0,
        // currency: '',
        // sizeTypeId: 0,
        // sizeTypeName: '',
        // sizeTypeDetails: [],
        // productColors: [],
      );
}

class StatusModel {
  final int? id;
  final String? name;
  final String? color;

  StatusModel({
    this.id,
    this.name,
    this.color,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      id: json['id'] as int?,
      name: json['name'] ?? '',
      color: json['color'] ?? '',
    );
  }

  factory StatusModel.empty() => StatusModel(
        id: 0,
        name: '',
        color: '',
      );
}

// class LinkModel {
//   final String? url;
//   final String? label;
//   final bool? active;
//
//   LinkModel({
//     this.url,
//     this.label,
//     this.active,
//   });
//
//   factory LinkModel.fromJson(Map<String, dynamic> json) {
//     return LinkModel(
//       url: json['url'],
//       label: json['label'],
//       active: json['active'] ?? false,
//     );
//   }
// }
