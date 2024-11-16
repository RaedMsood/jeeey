import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class AMenuToDisplayTheSubFilterContentWidget extends StatelessWidget {
  const AMenuToDisplayTheSubFilterContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 8.h,
      children: name.map((item) {
        return InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.fontColor, width: 0.1.r)),
            child: AutoSizeTextWidget(
              text: item,
              colorText: AppColors.fontColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }
}

List<String> name = [
  "Come",
  "Letter",
  "Plain",
  "Wrist-Length Sleeve",
  "Add TACTAL # Fibre",
  "4-Way",
  "XXL",
  "L",
  "Come",
  "Letter",
  "Plain",
  "Wrist-Length Sleeve",
  "Add TACTAL # Fibre",
  "4-Way",
  "XXL",
  "L",
  "Plain",
  "Wrist-Length Sleeve",
  "Add TACTAL # Fibre",
  "XXL",
  "L",
  "Come",
  "Letter",
  "Plain",
  "Plain",
];
