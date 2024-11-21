import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';

class InkWellButtonWidget extends StatelessWidget {
  final String icon;
  final Color? iconColor;
  final double? height;
  final VoidCallback onPressed;

  const InkWellButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.sp),
      splashColor: AppColors.primaryColor.withOpacity(.1),
      highlightColor: AppColors.primaryColor.withOpacity(.2),
      onTap: onPressed,
      child: SvgPicture.asset(
        icon,
        color: iconColor??AppColors.primaryColor,
        height: height,
      ),
    );
  }
}