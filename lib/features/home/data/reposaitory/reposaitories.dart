
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../model/section_with_category_of_all_data.dart';
import '../model/section_with_product_data.dart';


class SectionReposaitory {
  SectionReposaitory();

  Future<Either<DioException, SectionWithCategoryOfAllData>> getAllSectionAndAllProductData() async {
     try {
    //   var cachedSections = await CashAllSections().getAllSectionsData();
    //   if (cachedSections != null && cachedSections.isValid()) {
    //     return Right(cachedSections);  // إعادة البيانات من الكاش إذا كانت صالحة
    //   } else {
        final data = await SectionsRemoteDataSource().getAllSectionAndAllProductData();
       // await CashAllSections().saveSectionData(data);  // حفظ البيانات الجديدة في الكاش
        return Right(data);
     //}
    } on DioException catch (error) {
      print(error.type.toString());
      return Left(error);
    }
  }

  Future<Either<DioException, SectionAndProductData>> getSectionData(int idSection, int page, bool isRefresh) async {
    try {
      if (isRefresh) {
        var data = await SectionsRemoteDataSource().getSectionData(idSection, page);
        await SectionLocalDataSource().updateCacheWithPagination(data.sections!, data.product!, idSection, page);
        return Right(data);
      } else {
        var cachedCategories = await SectionLocalDataSource().getSectionFromCache(idSection, page);
        if (cachedCategories != null && cachedCategories.isValid()) {
          return Right(cachedCategories);
        } else {
          final data = await SectionsRemoteDataSource().getSectionData(idSection, page);
          await SectionLocalDataSource().updateCacheWithPagination(data.sections!, data.product!, idSection, page);
          return Right(data);
        }
      }
    } on DioException catch (error) {
      print(error.type.toString());
      return Left(error);
    }
  }
}
