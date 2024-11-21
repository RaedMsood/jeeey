import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'buttons/default_button.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  final Function()? onPressed;

  const NoInternetConnectionWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 500.h,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_wifi_connected_no_internet_4_rounded,
            color: Colors.black,
            size: 50.sp,
          ),
          SizedBox(
            height: 12.h,
          ),
          AutoSizeText(
            "يوجد مشكلة في الإتصال",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            minFontSize: 10,
            maxFontSize: 20,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 6.h,
          ),
          AutoSizeText(
            "الرجاء التحقق من الإتصال بالإنترنت",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
            minFontSize: 10,
            maxFontSize: 20,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 12.h,
          ),
          DefaultButtonWidget(
            width: 120.w,
            textSize: 15.sp,
            text: "تحديث",
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
