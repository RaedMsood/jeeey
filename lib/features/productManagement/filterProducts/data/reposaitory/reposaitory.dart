import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../category/data/model/cat_pro_data.dart';
import '../../../detailsProducts/data/model/paginated_products_list_data.dart';
import '../data_source/remote_data_source.dart';

class FilterReposaitory {
  Future<Either<DioException, PaginatedProductsList>> getProductOfFilter(
      { List<int>? idSize,
        String? nameSearch,
      required int page,
      required int idCategory,
        String? price,
        List<int>? idUnit,
      int? idSubCategory,
       var idColor}) async {
    try {
      final data = await RemoteFilterDataSource().getProductOfFilter(idUnit: idUnit,nameSearch: nameSearch,
          page: page, idSize: idSize, idCategory: idCategory, idColor: idColor,idSubCategory: idSubCategory,price: price);
      return Right(data);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }
}
