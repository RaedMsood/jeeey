import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_icons.dart';
import '../../theme/app_colors.dart';

class IconButtonWidget extends StatelessWidget {
  final String icon;
  final Color? iconColor;
  final double? height;
  final VoidCallback? onPressed;

  const IconButtonWidget({
    super.key,
    required this.icon,
    this.iconColor,
    this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: AppColors.primarySwatch.shade800.withOpacity(.1),
      highlightColor: AppColors.primarySwatch.shade800.withOpacity(.1),
      splashRadius: 2,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        // padding: MaterialStateProperty.all(EdgeInsets.all(14.r)),


      ),
      onPressed: onPressed ??
          () {
            Navigator.of(context).pop();
          },
      icon: SvgPicture.asset(

         icon,
        height: height,
        color: iconColor,
      ),
    );
  }
}