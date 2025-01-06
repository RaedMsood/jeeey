import 'dart:convert';
import 'dart:developer';

import '../../core/local/secure_storage.dart';
import '../../features/user/data/model/auth_model.dart';
import '../../injection.dart';

class Auth {
  factory Auth() {
    _instance ??= Auth._();

    return _instance!;
  }

  final String _key = 'user';
  final WingsSecureStorage secureStorage = sl<WingsSecureStorage>();

  Auth._() {
    onInit();
  }

  void onInit() async {
    try {
      var read = await secureStorage.read(
        key: _key,
      );

      if (read != null) {
        Map<String, dynamic> map = jsonDecode(read);
        AuthModel authModel = AuthModel.fromJson(map);
        user = authModel;
      }
      print(user.token);
      print(user.user.id);
      print(user.user.email);
      print(user.user.phoneNumber);
    } catch (ex) {
      throw '$ex';
    }
  }

  static Auth? _instance;

  AuthModel user = AuthModel.empty();

  bool get loggedIn => user.token.isNotEmpty;

  String get token => user.token;

  String get name => user.user.name;

  String get email => user.user.email;

  String tempEmail = '';

  void setEmail(String email) {
    tempEmail = email;
  }

  Future<void> login(AuthModel data) async {
    user = data;
    _writeToCache();
  }

  _writeToCache() {
    log(jsonEncode(user), name: 'user');
    secureStorage.write(key: _key, value: jsonEncode(user));
  }

  Future logout() async {
    await secureStorage.delete(key: 'fcmToken');
    user = AuthModel.empty();
    await secureStorage.delete(key: _key);
  }

// void updateFcmToken(String fcmToken) async {
//   log(fcmToken, name: 'token');
//   //save fcmtoken
//
//   secureStorage.write(key: 'fcmToken', value: fcmToken);
//   if (loggedIn && user.user.fcmToken != fcmToken) {
//     user = user.copyWith(
//       user: user.user.copyWith(
//         fcmToken: fcmToken,
//       ),
//     );
//     await WingsRemoteService().send(
//       request: WingsRequest(
//         url: AppURL.addFcmToken,
//         body: {'fcmToken': fcmToken},
//       ),
//       method: WingsRemoteMethod.post,
//       onSuccess: (response, code) {},
//       onError: (RemoteResponse, int) {},
//     );
//   }
// }
}
