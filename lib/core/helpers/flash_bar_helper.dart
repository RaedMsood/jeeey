import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import '../../generated/l10n.dart';
import '../widgets/auto_size_text_widget.dart';

// /// Success ///
// void showFlashBarSuccess({
//   required BuildContext context,
//   required String message,
// }) {
//   Flushbar(
//     duration: const Duration(seconds: 3),
//     backgroundColor: const Color(0xff2f9276),
//     message: message,
//     messageSize: 13.sp,
//     flushbarPosition: FlushbarPosition.TOP,
//     flushbarStyle: FlushbarStyle.GROUNDED,
//   ).show(context);
// }
//
// /// Error ///
// void showFlashBarError({
//   required BuildContext context,
//   required String title,
//   required String text,
// }) {
//   Flushbar(
//     duration: const Duration(milliseconds: 1500),
//     backgroundColor: AppColors.secondarySwatch.shade500,
//     message: text,
//     title: title,
//     titleSize: 12.5.sp,
//     messageSize: 12.sp,
//     flushbarPosition: FlushbarPosition.TOP,
//     flushbarStyle: FlushbarStyle.GROUNDED,
//   ).show(context);
// }

void showFlashBarSuccess({
  required BuildContext context,
  required String message,
}) {
  Flushbar(
    duration: const Duration(seconds: 3),
    message: message,
    messageText: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12.5.sp,
        fontFamily: 'NotoKufi',
      ),
    ),
    margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 18.h),
    padding: EdgeInsets.all(12.sp),
    backgroundColor: AppColors.successSwatch.shade800.withOpacity(.9),
    borderRadius: BorderRadius.circular(8.r),
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
  ).show(context);
}

/// Error ///
void showFlashBarError({
  required BuildContext context,
  required String title,
  required String text,
}) {
  Flushbar(
    duration: const Duration(seconds: 3),
    title: title,
    message: text,
    titleText: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12.4.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'NotoKufi',
      ),
    ),
    messageText: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12.2.sp,
        fontFamily: 'NotoKufi',
      ),
    ),
    backgroundColor: AppColors.secondarySwatch.shade500,
    margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 18.h),
    padding: EdgeInsets.all(12.sp),
    borderRadius: BorderRadius.circular(8.r),
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
  ).show(context);
}

/// Exit ///
void pressAgainToExit({
  required BuildContext context,
  String? text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 160.w,
      duration: const Duration(seconds: 2),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.sp)),
        alignment: Alignment.center,
        child: AutoSizeTextWidget(
          text: text ?? S.of(context).clickAgainToExit,
          colorText: Colors.white,
          fontSize: 14.sp,
          minFontSize: 4,
          maxFontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black54.withOpacity(.8),
    ),
  );
}
