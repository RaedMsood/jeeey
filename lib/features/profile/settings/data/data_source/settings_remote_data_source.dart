import 'package:dartz/dartz.dart';

import '../../../../../core/network/remote_request.dart';
import '../../../../../core/network/urls.dart';

class SettingsRemoteDataSource {
  Future<Unit> logout() async {
    await RemoteRequest.postData(
      path: AppURL.logout,
    );
    return Future.value(unit);
  }
}
