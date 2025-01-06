import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeeey/features/profile/myOrders/data/model/order_model.dart';

import '../../../../../core/state/state.dart';
import '../../../../../core/state/state_data.dart';
import '../../data/repos/order_repo.dart';

final getAllOrdersProvider = StateNotifierProvider.autoDispose<
    GetAllOrdersController, DataState<OrdersModel>>(
  (ref) {
    return GetAllOrdersController();
  },
);

class GetAllOrdersController extends StateNotifier<DataState<OrdersModel>> {
  GetAllOrdersController()
      : super(DataState<OrdersModel>.initial(OrdersModel.empty())) {
    getData();
  }

  final _controller = OrderReposaitory();

  Future<void> getData({
    bool moreData = false,
  }) async {
    if (moreData) {
      state = state.copyWith(state: States.loadingMore);
    } else {
      state = state.copyWith(state: States.loading);
    }
    int page = state.data.currentPage + 1;

    final data = await _controller.getAllOrders(page: page);
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {
      state = state.copyWith(state: States.loaded, data: data);
    });
  }
}
