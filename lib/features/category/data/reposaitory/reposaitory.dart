import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data_source/remote_data_source.dart';
import '../model/cat_pro_data.dart';





class CategoryReposaitories {


  CategoryReposaitories();


  Future<Either<DioException, CategoryAndProductData>> getMainCategoryAndAllProductData(int idCategory,int page) async {
    try {
      final data = await CategoryRemoteDataSource().getMainCategoryAndAllProductData(idCategory,page);
      return Right(data);
    } on DioException catch (erorr) {
      print(erorr.type.toString());
      return Left(erorr);
    }
  }

}
