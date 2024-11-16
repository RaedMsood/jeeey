import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class MainFilterDesignWidget extends StatelessWidget {
  final String title;
  final bool active;
  final String? icon;
  final Color? color;
  final bool? priceIcon;
  final bool? highPrice;

  final VoidCallback onTap;

  const MainFilterDesignWidget({
    super.key,
    required this.onTap,
    required this.title,
     this.icon,
    this.color =AppColors.fontColor,
    this.priceIcon = false,
    required this.active,
    this.highPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AutoSizeTextWidget(
            text: title,
            colorText: active ? Colors.black : AppColors.fontColor,
            fontSize: 12.1.sp,
            fontWeight:active ? FontWeight.w600:FontWeight.w500,
          ),
          0.5.w.horizontalSpace,
          priceIcon == false
              ? SvgPicture.asset(
                  icon??"",
                  color: active ? Colors.black : color,
                )
              : Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SvgPicture.asset(
                      AppIcons.highPrice,
                      color:  highPrice==true?Colors.black: AppColors.fontColor,
                      height: 10.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.6.h),
                      child: SvgPicture.asset(
                        AppIcons.lowPrice,
                        color:  active && highPrice==false? Colors.black:AppColors.fontColor,
                        height: 10.5.h,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

