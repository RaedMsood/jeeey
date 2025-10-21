import 'package:jeeey/features/profile/myOrders/data/model/order_details_model.dart';
import 'package:jeeey/features/profile/myOrders/data/model/order_model.dart';
import '../../../../../core/network/remote_request.dart';
import '../../../../../core/network/urls.dart';

class OrderRemoteDataSource {
  Future<OrdersModel> getAllOrders({
    required int page,
    int limit = 5,
  }) async {
    final response = await RemoteRequest.getData(
      url: AppURL.orders,
      query: {
        'page': page,
        'perPage': limit,
      },
    );
    print(response.data);
    return OrdersModel.fromJson(response.data);
  }

  Future<OrderDetailsModel> orderDetails({
    required int id,
  }) async {
    final response = await RemoteRequest.getData(
      url: "${AppURL.orderDetails}/$id",
    );
    print(response.data);
    return OrderDetailsModel.fromJson(response.data);
  }
}
