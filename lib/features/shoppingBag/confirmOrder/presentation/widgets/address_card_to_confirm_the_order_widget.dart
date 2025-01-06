import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';


class AddressCardToConfirmTheOrderWidget extends ConsumerWidget {
  final String address;
  final String city;
  final String district;

  final String value;
  final ValueChanged onChanged;
  final VoidCallback onPressed;

  final String addressGroupValue;

  const AddressCardToConfirmTheOrderWidget({
    super.key,
    required this.address,
    required this.city,
    required this.district,
    required this.value,
    required this.onChanged,
    required this.onPressed,
    required this.addressGroupValue,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.all(8.sp),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: AppColors.greySwatch.shade50,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.cardAddress,
                  // height: 44.h,
                ),
                8.w.horizontalSpace,
                Flexible(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeTextWidget(
                          text: address.toString(),
                          fontSize: 13.4.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        4.h.verticalSpace,
                        AutoSizeTextWidget(
                          text: "$city - $district",
                          fontSize: 9.6.sp,
                          colorText: AppColors.greySwatch.shade600,
                        ),
                      ],
                    ),
                  ),
                ),
                value == addressGroupValue
                    ? SizedBox(
                        width: 20.w,
                        child: Radio(
                          value: value,
                          groupValue: addressGroupValue,
                          activeColor: AppColors.primaryColor,
                          onChanged: onChanged,
                          splashRadius: 30,
                        ),
                      )
                    : SizedBox(
                        width: 20.w,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffe4eae8),
                          radius: 8.5.r,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
