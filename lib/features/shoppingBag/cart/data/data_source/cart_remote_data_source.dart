import 'package:dartz/dartz.dart';
import 'package:jeeey/features/shoppingBag/cart/data/model/cart_model.dart';

import '../../../../../core/network/remote_request.dart';
import '../../../../../core/network/urls.dart';
import '../model/cart_product_model.dart';
import '../model/product_details_for_cart_model.dart';

class CartRemoteDataSource {
  CartRemoteDataSource();

  Future<ProductDetailsForCartModel> getProductDetailsForCart(
    int prodectId,
  ) async {
    final response = await RemoteRequest.getData(
      url: "${AppURL.productDetailsForCart}/$prodectId",
    );
    return ProductDetailsForCartModel.fromJson(response.data['product']);
  }

  Future<List<CartModel>> getAllCart() async {
    final response = await RemoteRequest.getData(
      url: AppURL.getAllCart,
    );
    return CartModel.fromJsonList(response.data);
  }

  Future<Unit> addToCart(
    int productId,
    int colorId,
    int sizeId,
    int quantity,
  ) async {
    await RemoteRequest.postData(
      path: AppURL.addToCart,
      data: {
        'product_id': productId,
        'color_id': colorId,
        'size_id': sizeId,
        'quantity': quantity,
      },
    );
    return Future.value(unit);
  }

  Future<CartProductModel> updateCart(
    int id,
    int productId,
    int colorId,
    int sizeId,
    int quantity,
  ) async {
    final response = await RemoteRequest.postData(
      path: "${AppURL.updateCart}/$id",
      data: {
        'product_id': productId,
        'color_id': colorId,
        'size_id': sizeId,
        'quantity': quantity,
      },
    );
    return CartProductModel.fromJson(response.data);
  }

  Future<Unit> deleteAProductFromTheCart(
    int id,
  ) async {
    await RemoteRequest.postData(
      path: "${AppURL.deleteCart}/$id",
    );
    return Future.value(unit);
  }
}
