import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/state/state.dart';
import '../../../../../core/state/state_data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/cart_product_model.dart';

final shareMyCartProvider = StateNotifierProvider.autoDispose<
    ShareMyCartController, DataState<CartProductModel>>(
  (ref) {
    return ShareMyCartController();
  },
);

class ShareMyCartController extends StateNotifier<DataState<CartProductModel>> {
  ShareMyCartController()
      : super(DataState<CartProductModel>.initial(CartProductModel.empty()));

  // final _controller = CartReposaitory();

  final List<CartModel> _selectedProducts = [];

  List<CartModel> get selectedProducts => _selectedProducts;

  double calculateSelectedTotalPrice() {
    return _selectedProducts.fold(0, (sum, product) {
      return sum + (double.parse(product.price.toString()) * product.quantity!);
    });
  }

  void toggleAllProductsSelection(bool isChecked, List<CartModel> allProducts) {
    if (isChecked) {
      selectedProducts.clear();
      selectedProducts.addAll(allProducts.map((product) => product));
    } else {
      selectedProducts.clear();
    }
    state = state.copyWith(state: States.initial);
  }

  bool isAllProductsSelected(List<CartModel> allProducts) {
    return selectedProducts.length == allProducts.length &&
        allProducts.every(
            (product) => selectedProducts.any((p) => p.id == product.id));
  }

  void toggleProductSelection(bool isChecked, CartModel product) {
    if (isChecked) {
      _selectedProducts.add(product);
    } else {
      _selectedProducts.removeWhere((p) => p.id == product.id);
    }
    state = state.copyWith(state: States.initial);
  }
}
