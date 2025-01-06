import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../generated/l10n.dart';

class JeeeyClubWidget extends StatelessWidget {
  const JeeeyClubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: const Color(0xfff7eccb).withOpacity(.85),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xfffbdb79), width: 0.8.w),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 2.h),
                decoration: BoxDecoration(
                  color: const Color(0xfffbdb79),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r),
                  ),
                ),
                child: AutoSizeTextWidget(
                  text: "jeeey club",
                  fontSize: 7.4.sp,
                  fontWeight: FontWeight.w700,
                  minFontSize: 6,
                  colorText: const Color(0xffa77703),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(18.r),
                  border:
                      Border.all(color: const Color(0xffa77703), width: 0.5.w),
                ),
                child: AutoSizeTextWidget(
                  text: S.of(context).joinNow,
                  fontSize: 7.6.sp,
                  fontWeight: FontWeight.w700,
                  minFontSize: 6,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.8.sp,
                        fontFamily: 'PlusJakartaSans',
                      ),
                      children: [
                        const TextSpan(
                          text: "أحصل على",
                        ),
                        TextSpan(
                          text: " خصم 5% ",
                          style: TextStyle(
                            color: AppColors.primarySwatch.shade600,
                          ),
                        ),
                        const TextSpan(
                          text: "اضافي و",
                        ),
                        TextSpan(
                          text: " 15x ",
                          style: TextStyle(
                            color: AppColors.primarySwatch.shade600,
                          ),
                        ),
                        const TextSpan(
                          text: "شحن مجاني",
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.receiptDiscount,
                      height: 13.h,
                    ),
                    4.w.horizontalSpace,
                    SvgPicture.asset(
                      AppIcons.truckFast,
                      height: 11.h,
                    ),
                    2.w.horizontalSpace,
                  ],
                ),
              ],
            ),
          ),
          2.h.verticalSpace,
        ],
      ),
    );
  }
}
