import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/online_images_widget.dart';


class PaymentMethodWidget extends StatelessWidget {
  final String name;
  final String value;
  final String paymentMethodGroupValue;
  final ValueChanged onChanged;
  final VoidCallback onPressed;

  const PaymentMethodWidget({
    super.key,
    required this.name,
    required this.value,
    required this.paymentMethodGroupValue,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            OnlineImagesWidget(
              size: Size(48.w, 36.h),
              imageUrl: "",
              fit: BoxFit.contain,
            ),
            12.w.horizontalSpace,
            Flexible(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
                child: AutoSizeTextWidget(
                  text: name.toString(),
                  fontSize: 11.4.sp,
                  colorText: Colors.grey[700],
                  maxLines: 2,
                ),
              ),
            ),
            8.w.horizontalSpace,
            value == paymentMethodGroupValue
                ? SizedBox(
                    width: 16.w,
                    height: 12.h,
                    child: Transform.scale(
                      scale: 1,
                      child: Radio(
                        value: value,
                        groupValue: paymentMethodGroupValue,
                        activeColor: AppColors.primaryColor,
                        onChanged: onChanged,
                        splashRadius: 30,
                      ),
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: const Color(0xffe4eae8),
                    radius: 8.r,
                  ),
          ],
        ),
      ),
    );
  }
}
