import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../generated/l10n.dart';

class CardToListMajorOffersAndTrendsAndDiscountWidget extends StatelessWidget {
  final Widget list;
  final double? height;
  final bool? majorOffers;
  final String title;

  const CardToListMajorOffersAndTrendsAndDiscountWidget({
    super.key,
    required this.list,
    this.height,
    this.majorOffers = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 150.h,
      width: double.infinity,
      margin:
          EdgeInsets.symmetric(horizontal: majorOffers == false ? 0.w : 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
        gradient: LinearGradient(
          colors:majorOffers == false?[
            AppColors.whiteColor,
            AppColors.whiteColor,
          ]: [
            AppColors.primarySwatch.shade200.withOpacity(.05),
            AppColors.primarySwatch.shade100.withOpacity(.5),
            AppColors.primarySwatch.shade50.withOpacity(.4),
            AppColors.whiteColor,
            AppColors.whiteColor,
            AppColors.whiteColor,
            AppColors.whiteColor,
            AppColors.whiteColor,
          ],
          begin: S.of(context).home == "الرئيسية"
              ? Alignment.topRight
              : Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeTextWidget(
                  text: title,
                  fontSize: 10.sp,
                  colorText: AppColors.fontColor,
                  fontWeight: FontWeight.w600,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      majorOffers == false
                          ? const SizedBox.shrink()
                          : AutoSizeTextWidget(
                              text: S.of(context).viewMore,
                              fontSize: 10.sp,
                              colorText: AppColors.fontColor,
                            ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.5.h),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: AppColors.fontColor.withOpacity(.65),
                          size: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          list,
        ],
      ),
    );
  }
}
