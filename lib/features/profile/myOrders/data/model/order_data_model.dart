import 'package:jeeey/features/profile/myOrders/data/model/order_product_model.dart';

import 'order_model.dart';

class OrderDataModel {
  final int id;
  final int? userId;
  final String? trxId;
  final String? date;
  final int? totalProducts;
  final int? total;
  final StatusModel? status;
  final List<OrderProductModel>? orderProducts;

  OrderDataModel({
    required this.id,
    this.userId,
    this.trxId,
    this.date,
    this.totalProducts,
    this.total,
    this.status,
    this.orderProducts,
  });

  factory OrderDataModel.fromJson(Map<String, dynamic> json) {
    return OrderDataModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] as int?,
      trxId: json['trx_id'] ?? '',
      date: json['date'] ?? '',
      totalProducts: json['total_products'] as int?,
      total: json['total'] as int?,
      status:
      json['status'] != null ? StatusModel.fromJson(json['status']) : null,
      orderProducts: (json['order_products'] as List?)
          ?.map((product) => OrderProductModel.fromJson(product))
          .toList() ??
          [],
    );
  }

  static List<OrderDataModel> fromJsonList(List json) {
    return json.map((e) => OrderDataModel.fromJson(e)).toList();
  }

  factory OrderDataModel.empty() =>
      OrderDataModel(
        id: 0,
        userId: 0,
        trxId: '',
        date: '',
        total: 0,
        totalProducts: 0,
        status: StatusModel.empty(),
        orderProducts: [],
      );
}
