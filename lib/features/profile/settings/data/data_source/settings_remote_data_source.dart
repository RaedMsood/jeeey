import 'package:dartz/dartz.dart';

import '../../../../../core/network/remote_request.dart';
import '../../../../../core/network/urls.dart';
import '../model/currency_model.dart';

class SettingsRemoteDataSource {
  Future<Unit> logout() async {
    await RemoteRequest.postData(
      path: AppURL.logout,
    );
    return Future.value(unit);
  }

  Future<Unit> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    await RemoteRequest.postData(
      path: AppURL.updatePassword,
      data: {
        "old_password": oldPassword,
        "password": newPassword,
        "password_confirmation": confirmPassword,
      },
    );
    return Future.value(unit);
  }

  Future<List<CurrencyModel>> getAllCurrencies() async {
    final response = await RemoteRequest.getData(
      url: AppURL.getAllCurrencies,
    );
    return CurrencyModel.fromJsonList(response.data);
  }
}
