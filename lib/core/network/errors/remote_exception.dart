import 'package:dio/dio.dart';

import '../../../generated/l10n.dart';

class MessageOfErorrApi {
  static List<String> getExeptionMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionError:
        return [S.current.network, S.current.network2];
      case DioExceptionType.connectionTimeout:
        return [S.current.timeout, S.current.pleaseTryAgain];
      case DioExceptionType.badResponse:
        switch (exception.response!.statusCode) {
          case 440:
            return [
              S.current.incorrectVerificationCode,
              S.current.incorrectVerificationCode2
            ];
          case 441:
            return [S.current.pleaseCheckThePhoneNumberOrEmail, S.current.pleaseTryAgain];
          case 442:
            return [S.current.incorrectPassword, S.current.pleaseTryAgain];
          case 443:
            return [
              S.current.accountNotFound,
              S.current.pleaseVerifyTheAccount
            ];
          case 444:
            return [
              S.current.incorrectVerificationCode,
              S.current.incorrectVerificationCode2
            ];
          case 445:
            return [
              S.current.verificationCodeExpired,
              S.current.verificationCodeExpired2
            ];
          case 446:
            return [
              S.current.thePasswordDoesNotMeetTheConditions,
              S.current.pleaseTryAgain
            ];
          case 447:
            return [S.current.passwordIsSameUserPassword, S.current.pleaseTryAgain];
          default:
            return [S.current.somethingWentWrong, S.current.pleaseTryAgain];
        }

      default:
        return [S.current.network, S.current.network2];
    }
  }
}
