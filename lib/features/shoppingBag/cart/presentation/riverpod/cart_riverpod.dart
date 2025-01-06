import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/state/state_data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/cart_product_model.dart';
import '../../data/model/product_details_for_cart_model.dart';
import '../../data/repos/cart_repo.dart';

final getProductDetailsForCartProvider = StateNotifierProvider.autoDispose
    .family<GetProductDetailsForCartController,
    DataState<ProductDetailsForCartModel>,
    int>(
      (ref, int prodectId) {
    return GetProductDetailsForCartController(prodectId);
  },
);

class GetProductDetailsForCartController
    extends StateNotifier<DataState<ProductDetailsForCartModel>> {
  GetProductDetailsForCartController(this.prodectId)
      : super(DataState<ProductDetailsForCartModel>.initial(
    ProductDetailsForCartModel.empty(),
  )) {
    getData();
  }

  final int prodectId;
  final _controller = CartReposaitory();

  Future<void> getData() async {
    state = state.copyWith(state: States.loading);
    final data = await _controller.getProductDetailsForCart(prodectId);
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {
      state = state.copyWith(state: States.loaded, data: data);
    });
  }
}

final getAllCartProvider = StateNotifierProvider.autoDispose<
    GetAllCartController,
    DataState<List<CartModel>>>(
      (ref) {
    return GetAllCartController();
  },
);

class GetAllCartController extends StateNotifier<DataState<List<CartModel>>> {
  GetAllCartController() : super(DataState<List<CartModel>>.initial([])) {
    getData();
  }

  final _controller = CartReposaitory();

  Future<void> getData() async {
    state = state.copyWith(state: States.loading);
    final data = await _controller.getAllCart();
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {
      state = state.copyWith(state: States.loaded, data: data);
    });
  }
}

final cartProvider = StateNotifierProvider.autoDispose<CartController,
    DataState<CartProductModel>>(
      (ref) {
    return CartController();
  },
);

class CartController extends StateNotifier<DataState<CartProductModel>> {
  CartController()
      : super(DataState<CartProductModel>.initial(CartProductModel.empty()));

  final _controller = CartReposaitory();

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

  void updateSelectedProduct(CartModel updatedProduct) {
    int index = selectedProducts.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      selectedProducts[index] = updatedProduct;
    }
  }

  void updateSelectedProductQuantity(int id, int quantity) {
    int index = selectedProducts.indexWhere((p) => p.id == id);
    if (index != -1) {
      selectedProducts[index] =
          selectedProducts[index].copyWith(quantity: quantity);
    }
  }

  Future<void> addToCart({
    required int prodectId,
    required int colorId,
    required int sizeId,
    required int quantity,
  }) async {
    state = state.copyWith(state: States.loading);
    final data =
    await _controller.addToCart(prodectId, colorId, sizeId, quantity);
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {
      state = state.copyWith(state: States.loaded);
    });
  }

  Future<void> updateCart({
    required int id,
    required int prodectId,
    required int colorId,
    required int sizeId,
    required int quantity,
  }) async {
    state = state.copyWith(state: States.loading);
    final data =
    await _controller.updateCart(id, prodectId, colorId, sizeId, quantity);
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {
      state = state.copyWith(state: States.loaded, data: data);
      updateSelectedProductQuantity(id, quantity);
    });
  }

  Future<void> deleteAProductFromTheCart({
    required int id,
  }) async {
    state = state.copyWith(state: States.loading);
    final data = await _controller.deleteAProductFromTheCart(id);
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {
      selectedProducts.removeWhere((product) => product.id == id);
      state = state.copyWith(state: States.loaded);
    });
  }
}
