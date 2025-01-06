import 'package:dartz/dartz.dart';
import 'package:jeeey/features/shoppingBag/confirmOrder/data/model/confirm_order_model.dart';

import '../../../../../core/network/remote_request.dart';
import '../../../../../core/network/urls.dart';
import '../model/confirm_order_data_model.dart';

class ConfirmOrderRemoteDataSource {
  Future<ConfirmOrderDataModel> getConfirmOrderData() async {
    final response = await RemoteRequest.getData(
      url: AppURL.getOrderDate,
    );
    return ConfirmOrderDataModel.fromJson(response.data);
  }

  Future<Unit> confirmOrder(ConfirmOrderModel confirmOrderModel) async {
    await RemoteRequest.postData(
      path: AppURL.confirmOrder,
      data: confirmOrderModel.toJson(),
    );
    return Future.value(unit);
  }
}
