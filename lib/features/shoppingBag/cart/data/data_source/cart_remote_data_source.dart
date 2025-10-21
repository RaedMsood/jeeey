import 'package:dartz/dartz.dart';
import 'package:jeeey/features/shoppingBag/cart/data/model/cart_model.dart';
import '../../../../../core/network/remote_request.dart';
import '../../../../../core/network/urls.dart';
import '../../../../../services/firebase/firebase_listen_notification.dart';
import '../model/cart_product_model.dart';

class CartRemoteDataSource {
  CartRemoteDataSource();

  Future<List<CartModel>> getAllCart() async {
    String? fcmToken = await PushNotificationService().getToken();

    final response = await RemoteRequest.getData(
      url: AppURL.getAllCart,
      fcmToken: fcmToken!,
    );
    return CartModel.fromJsonList(response.data);
  }

  Future<Unit> addToCart(
    int productId,
    dynamic colorId,
    int sizeId,
    dynamic price,
    int quantity,
  ) async {
    String? fcmToken = await PushNotificationService().getToken();

    await RemoteRequest.postData(
      path: AppURL.addToCart,
      fcmToken: fcmToken!,
      data: {
        'product_id': productId,
        'color_id': colorId,
        'parent_measuring_id': sizeId,
        'price': price,
        'quantity': quantity,
      },
    );
    return Future.value(unit);
  }

  Future<CartProductModel> updateCart(
    int id,
    int productId,
    dynamic colorId,
    int sizeId,
    dynamic price,
    int quantity,
  ) async {
    String? fcmToken = await PushNotificationService().getToken();

    final response = await RemoteRequest.postData(
      path: "${AppURL.updateCart}/$id",
      fcmToken: fcmToken!,
      data: {
        'product_id': productId,
        'color_id': colorId,
        'parent_measuring_id': sizeId,
        'price': price,
        'quantity': quantity,
      },
    );
    return CartProductModel.fromJson(response.data);
  }

  Future<Unit> deleteAProductFromTheCart(
    int id,
  ) async {
    String? fcmToken = await PushNotificationService().getToken();

    await RemoteRequest.postData(
        path: "${AppURL.deleteCart}/$id", fcmToken: fcmToken!);
    return Future.value(unit);
  }
}
