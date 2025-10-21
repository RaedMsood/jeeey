import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/dropdown_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import 'sub_filter_dropdown_menu_widget.dart';

class SubFilterDesignWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Color? color;
  final GestureTapCallback onTap;
  const SubFilterDesignWidget({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeTextWidget(
              text: title,
              colorText: AppColors.fontColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            3.w.horizontalSpace,
            SvgPicture.asset(
              icon ,
              color: AppColors.fontColor,
            ),
          ],
        ),
      ),
    );
  }
}
