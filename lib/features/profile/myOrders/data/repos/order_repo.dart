import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data_source/order_remote_data_source.dart';
import '../model/order_model.dart';

class OrderReposaitory {
  Future<Either<DioException, OrdersModel>> getAllOrders({
    required int page,
  }) async {
    try {
      final remote = await OrderRemoteDataSource().getAllOrders(page: page);
      return Right(remote);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
