import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/state/state.dart';
import '../../../../../core/state/state_data.dart';
import '../../data/model/product_data.dart';
import '../../data/reposaitory/reposaitories.dart';


final detailsProvider = StateNotifierProvider.family<DetailsProductNotifier,
    DataState<ProductData>,int>((ref,idProduct) => DetailsProductNotifier(idProduct));

class DetailsProductNotifier extends StateNotifier<DataState<ProductData>> {
  DetailsProductNotifier(this.idProduct)
      : super(DataState<ProductData>.initial(ProductData.empty())){
    getDetailsOfProduct();
  }
  final int idProduct;
  final _controller = DetailsProductReposaitories();

  Future<void> getDetailsOfProduct() async {
    state = state.copyWith(state: States.loading);
    final user = await _controller.getDetailsOfProduct(idProduct);
    user.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (userData) {
      state = state.copyWith(state: States.loaded, data: userData);
    });
  }
}

//////////////////////////////////////////////////////////////////////////////////////
class ChangeIndexOfColorImageNotifier extends StateNotifier<int?> {
  ChangeIndexOfColorImageNotifier() : super(0);

  void setIndexColorImage(int index) {
    state = index;
  }
}

final changeIndexOfColorImageProvider = StateNotifierProvider.autoDispose<ChangeIndexOfColorImageNotifier, int?>((ref) {
  return ChangeIndexOfColorImageNotifier();
});

//////////////////////////////////////////////////////////////////////////////////////////
class ShowNumberOfScrollImageNotifier extends StateNotifier<int?> {
  ShowNumberOfScrollImageNotifier() : super(null);

  void setIndexColorImage(int num) {
    state = num;
  }
}

final showNumberOfScrollImageProvider = StateNotifierProvider.autoDispose<ShowNumberOfScrollImageNotifier, int?>((ref) {
  return ShowNumberOfScrollImageNotifier();
});

