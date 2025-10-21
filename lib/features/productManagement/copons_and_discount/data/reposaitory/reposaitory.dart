import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../detailsProducts/data/model/paginated_products_list_data.dart';
import '../data_source/remote_data_source.dart';
import '../model/paginatied_copon_data.dart';

class CoponReposaitory {
  Future<Either<DioException, PaginatedCoponList>> getCoponsData(
      page, filterType) async {
    try {
      final data =
          await RemoteCoponDataSource().getCoponsData(page, filterType);
      return Right(data);
    } on DioException catch (error) {
      print(error.type.toString());
      return Left(error);
    }
  }

  Future<Either<DioException, PaginatedProductsList>> productsOfCopon(
      {required int idCopon, required int page}) async {
    try {
      final data = await RemoteCoponDataSource().getProductOfCopon(page: page,coponId: idCopon);
      return Right(data);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }
}
