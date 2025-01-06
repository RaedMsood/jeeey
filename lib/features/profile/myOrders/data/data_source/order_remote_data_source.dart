import 'package:jeeey/features/profile/myOrders/data/model/order_model.dart';

import '../../../../../core/network/remote_request.dart';
import '../../../../../core/network/urls.dart';

class OrderRemoteDataSource {
  Future<OrdersModel> getAllOrders({
    required int page,
    int limit = 80,
  }) async {
    final response = await RemoteRequest.getData(
      url: AppURL.orders,
      query: {
        'page': page,
        'perPage': limit,
      },
    );
    return OrdersModel.fromJson(response.data);
  }
}
