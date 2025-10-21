import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../generated/l10n.dart';

class CopyAndViewTheOrderNumberWidget extends StatelessWidget {
  final String orderNumber;

  const CopyAndViewTheOrderNumberWidget({super.key, required this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeTextWidget(
                text: S.of(context).request,
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w600,
              ),
              12.w.horizontalSpace,
              AutoSizeTextWidget(
                text: orderNumber,
                colorText: AppColors.fontColor,
                fontSize: 9.6.sp,
              ),
            ],
          ),
          DefaultButtonWidget(
            text: S.of(context).copy,
            width: 60.w,
            height: 24.h,
            borderRadius: 4.r,
            textSize: 8.w,
            minFontSize: 6,
            background: Colors.white,
            textColor: Colors.black,
            border: Border.all(
              color: AppColors.fontColor,
              width: 0.3.r,
            ),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: orderNumber));
            },
          ),
        ],
      ),
    );
  }
}
