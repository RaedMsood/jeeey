import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import '../widgets/auto_size_text_widget.dart';

/// Success ///
void showFlashBarSuccess({
  required BuildContext context,
  required String message,
}) {
  Flushbar(
    duration: const Duration(seconds:3),
    backgroundColor: const Color(0xff2f9276),
    message: message,
    messageSize: 15.sp,
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
  ).show(context);
}

/// Error ///
void showFlashBarError({
  required BuildContext context,
  required String title,
  required String text,
}) {
  Flushbar(
    duration: const Duration(milliseconds: 1500),
    backgroundColor: AppColors.secondarySwatch.shade500,
    message: text,
    title: title,
    titleSize: 13.sp,
    messageSize: 13.5.sp,
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
  ).show(context);
}

/// Exit ///
void pressAgainToExit({
  required BuildContext context,
  String?text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 150.w,
      duration: const Duration(seconds: 2),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.sp)),
        alignment: Alignment.center,
        child: AutoSizeTextWidget(
          text: text??'Click again to exit',
          colorText: Colors.white,
          fontSize: 15.sp,
          minFontSize: 3,
          maxFontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black54.withOpacity(.8),
    ),
  );
}
