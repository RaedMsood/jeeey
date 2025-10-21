import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class TitleAndDescriptionOfTheTrendWidget extends StatelessWidget {
  final String name;
  final String description;
  final bool arrowIcon;

  const TitleAndDescriptionOfTheTrendWidget({
    super.key,
    required this.name,
    required this.description,
    this.arrowIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(11.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                height: 10.h,
                width: 98.w,
                color: AppColors.purpleColor,
                margin: EdgeInsets.only(top: 8.h),
              ),
              Row(
                children: [
                  Flexible(
                    child: AutoSizeTextWidget(
                      text: name,
                      fontSize: 18.5.sp,
                      fontWeight: FontWeight.bold,
                      colorText: Colors.white,
                    ),
                  ),
                  2.w.horizontalSpace,
                  Visibility(
                    visible: arrowIcon,
                    child: Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Colors.white,
                      size: 18.5.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          10.h.verticalSpace,
          AutoSizeTextWidget(
            text: description,
            fontSize: 9.8.sp,
            fontWeight: FontWeight.w600,
            colorText: Colors.white.withOpacity(.85),
          ),
        ],
      ),
    );
  }
}
