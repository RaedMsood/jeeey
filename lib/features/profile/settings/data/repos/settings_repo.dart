import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data_source/settings_remote_data_source.dart';

class SettingsReposaitory {
  Future<Either<DioException, Unit>> logout() async {
    try {
      final remote = await SettingsRemoteDataSource().logout();
      return Right(remote);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
