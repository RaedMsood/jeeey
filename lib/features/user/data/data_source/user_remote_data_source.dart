// import 'package:dartz/dartz.dart';
// import 'package:jeeey/features/user/data/model/auth_model.dart';
//
// import '../../../../core/network/remote_request.dart';
// import '../../../../core/network/urls.dart';
// import '../model/check_user_model.dart';
//
// class UserRemoteDataSource {
//   UserRemoteDataSource();
//
//   /// Check user
//   Future<CheckUserModel> checkUser(String phoneNumberOrEmail) async {
//     final response = await RemoteRequest.postData(
//       path: AppURL.checkUser,
//       data: {
//         "login": phoneNumberOrEmail,
//       },
//     );
//     return CheckUserModel.fromJson(response.data);
//   }
//
//   Future<AuthModel> logInOrSignUp(
//     String phoneNumberOrEmail,
//     String password,
//     String name,
//   ) async {
//     final response = await RemoteRequest.postData(
//       path: AppURL.logInOrSignUp,
//       data: {
//         "login": phoneNumberOrEmail,
//         "name": name,
//         "password": password,
//       },
//     );
//     return AuthModel.fromJson(response.data);
//   }
//
//   Future<AuthModel> checkOTP(String phoneNumberOrEmail, String otp) async {
//     final response = await RemoteRequest.postData(
//       path: AppURL.checkOtp,
//       data: {
//         "login": phoneNumberOrEmail,
//         "otp": otp,
//       },
//     );
//     return AuthModel.fromJson(response.data);
//   }
//
//   Future<Unit> resendOTP(String phoneNumberOrEmail) async {
//     await RemoteRequest.postData(
//       path: AppURL.resendOtp,
//       data: {
//         "login": phoneNumberOrEmail,
//       },
//     );
//     return Future.value(unit);
//   }
//
//   Future<Unit> forgetPassword(String phoneNumberOrEmail) async {
//     await RemoteRequest.postData(
//       path: AppURL.forgetPassword,
//       data: {
//         "login": phoneNumberOrEmail,
//       },
//     );
//     return Future.value(unit);
//   }
//
//   Future<Unit> resetPassword(
//     String phoneNumberOrEmail,
//     String password,
//     String confirmPassword,
//   ) async {
//     await RemoteRequest.postData(
//       path: AppURL.resetPassword,
//       data: {
//         "login": phoneNumberOrEmail,
//         "password": password,
//         "password_confirmation": confirmPassword,
//       },
//     );
//     return Future.value(unit);
//   }
// }
import 'package:dartz/dartz.dart';
import 'package:jeeey/features/user/data/model/auth_model.dart';

import '../../../../core/network/remote_request.dart';
import '../../../../core/network/urls.dart';
import '../../../../services/firebase/firebase_listen_notification.dart';
import '../model/check_user_model.dart';

class UserRemoteDataSource {
  UserRemoteDataSource();
  Future<CheckUserModel> checkUser(String phoneNumberOrEmail) async {
    final response = await RemoteRequest.postData(
      path: AppURL.checkUser,
      data: {
        "login": phoneNumberOrEmail,
      },
    );
    return CheckUserModel.fromJson(response.data);
  }

  Future<AuthModel> logInOrSignUp(
      String phoneNumberOrEmail,
      String password,
      String name,
      ) async {
    String? fcmToken = await PushNotificationService().getToken();
    final response = await RemoteRequest.postData(
      path: AppURL.logInOrSignUp,
      fcmToken: fcmToken!,
      data: {
        "login": phoneNumberOrEmail,
        "name": name,
        "password": password,
      },
    );
    return AuthModel.fromJson(response.data);
  }

  Future<AuthModel> checkOTP(String phoneNumberOrEmail, String otp) async {
    String? fcmToken = await PushNotificationService().getToken();
    final response = await RemoteRequest.postData(
      path: AppURL.checkOtp,
      fcmToken: fcmToken!,
      data: {
        "login": phoneNumberOrEmail,
        "otp": otp,
      },
    );
    return AuthModel.fromJson(response.data);
  }

  Future<Unit> resendOTP(String phoneNumberOrEmail) async {
    await RemoteRequest.postData(
      path: AppURL.resendOtp,
      data: {
        "login": phoneNumberOrEmail,
      },
    );
    return Future.value(unit);
  }

  Future<Unit> forgetPassword(String phoneNumberOrEmail) async {
    await RemoteRequest.postData(
      path: AppURL.forgetPassword,
      data: {
        "login": phoneNumberOrEmail,
      },
    );
    return Future.value(unit);
  }

  Future<Unit> resetPassword(
      String phoneNumberOrEmail,
      String password,
      String confirmPassword,
      ) async {
    await RemoteRequest.postData(
      path: AppURL.resetPassword,
      data: {
        "login": phoneNumberOrEmail,
        "password": password,
        "password_confirmation": confirmPassword,
      },
    );
    return Future.value(unit);
  }
}
