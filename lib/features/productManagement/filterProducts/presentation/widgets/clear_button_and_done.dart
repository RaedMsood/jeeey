import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../generated/l10n.dart';

class ClearButtonAndDone extends StatelessWidget {
  final VoidCallback doneOnTap;
  final VoidCallback clearOnTap;
  final double? height;

  const ClearButtonAndDone({
    super.key,
    required this.doneOnTap,
    required this.clearOnTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Row(
        children: [
          DefaultButtonWidget(
            text: S.of(context).done,
            width: 54.w,
            height:height?? 24.h,
            textSize: 11.sp,
            borderRadius: 0,
            onPressed: doneOnTap,
          ),
          8.w.horizontalSpace,
          DefaultButtonWidget(
            text: S.of(context).clear,
            width: 54.w,
            height:height?? 24.h,
            borderRadius: 0,
            textSize: 11.sp,
            background: Colors.white,
            textColor: Colors.black,
            border: Border.all(color: AppColors.fontColor, width: 0.14.r),
            onPressed: clearOnTap,
          ),
        ],
      ),
    );
  }
}
