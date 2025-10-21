import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeeey/core/theme/app_colors.dart';

import '../../../../../core/constants/app_icons.dart';

class IconsOfAppbarDetailsWidget extends StatelessWidget {
  const IconsOfAppbarDetailsWidget({super.key,required this.icon, this.onPressed});
  final String icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 30.h,
      width: 35.w,

      padding: EdgeInsets.all(6.sp),
      decoration: BoxDecoration(
        color: Colors.white60.withOpacity(0.7),
        borderRadius: BorderRadius.all(Radius.circular(20.sp))
      ),

      child:  InkWell(
        onTap: onPressed,
        child: SvgPicture.asset(
          icon,
          height: 18.h,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
