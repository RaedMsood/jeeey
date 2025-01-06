import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data_source/cart_remote_data_source.dart';
import '../model/cart_model.dart';
import '../model/cart_product_model.dart';
import '../model/product_details_for_cart_model.dart';

class CartReposaitory {
  CartReposaitory();

  Future<Either<DioException, ProductDetailsForCartModel>>
      getProductDetailsForCart(int prodectId) async {
    try {
      final remote =
          await CartRemoteDataSource().getProductDetailsForCart(prodectId);
      return Right(remote);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, List<CartModel>>> getAllCart() async {
    try {
      final remote = await CartRemoteDataSource().getAllCart();
      return Right(remote);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, Unit>> addToCart(
    int prodectId,
    int colorId,
    int sizeId,
    int quantity,
  ) async {
    try {
      final remote = await CartRemoteDataSource().addToCart(
        prodectId,
        colorId,
        sizeId,
        quantity,
      );
      return Right(remote);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, CartProductModel>> updateCart(
    int id,
    int prodectId,
    int colorId,
    int sizeId,
    int quantity,
  ) async {
    try {
      final remote = await CartRemoteDataSource().updateCart(
        id,
        prodectId,
        colorId,
        sizeId,
        quantity,
      );
      return Right(remote);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, Unit>> deleteAProductFromTheCart(
    int id,
  ) async {
    try {
      final remote = await CartRemoteDataSource().deleteAProductFromTheCart(id);
      return Right(remote);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
