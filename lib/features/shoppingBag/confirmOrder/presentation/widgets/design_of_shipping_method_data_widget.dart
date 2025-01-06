import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class DesignOfShippingMethodDataWidget extends StatelessWidget {
  final String title;
  final String description;
  final String value;
  final ValueChanged onChanged;
  final VoidCallback onPressed;
  final String shippingMethodGroupValue;

  const DesignOfShippingMethodDataWidget({
    super.key,
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
    required this.onPressed,
    required this.shippingMethodGroupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onPressed,
          child: Row(
            children: [
              value == shippingMethodGroupValue
                  ? SizedBox(
                      width: 14.w,
                      height: 12.h,
                      child: Transform.scale(
                        scale: 0.9,
                        child: Radio(
                          value: value,
                          groupValue: shippingMethodGroupValue,
                          activeColor: AppColors.primaryColor,
                          onChanged: onChanged,
                          splashRadius: 20,
                        ),
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: const Color(0xffe4eae8),
                      radius: 7.r,
                    ),
              4.w.horizontalSpace,
              AutoSizeTextWidget(
                text: title,
                fontSize: 12.sp,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
          child: AutoSizeTextWidget(
            text: description,
            colorText: AppColors.primaryColor,
            fontSize: 11.5.sp,
            maxLines: 12,
          ),
        ),
      ],
    );
  }
}
