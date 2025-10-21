import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/shimmer_widget.dart';

class OrderDetailsShimmerWidget extends StatelessWidget {
  const OrderDetailsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
          margin: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerPlaceholderWidget(
                height: 16.h,
                width: 120.w,
              ),
              ShimmerPlaceholderWidget(
                height: 16.h,
                width: 120.w,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerPlaceholderWidget(
                height: 16.h,
                width: 120.w,
              ),
              ShimmerPlaceholderWidget(
                height: 16.h,
                width: 120.w,
              ),
            ],
          ),
        ),
        Column(
          children: List.generate(
            3,
            (index) {
              return Container(
                margin: EdgeInsets.only(top: 11.h),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.02),
                      blurRadius: 1.r,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ShimmerPlaceholderWidget(
                          height: 84.h,
                          width: 90.w,
                        ),
                        Image.asset(
                          AppImages.logoWithText,
                          height: 48.h,
                          width: 70,
                        ),
                      ],
                    ),
                    12.w.horizontalSpace,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerPlaceholderWidget(
                            height: 13.5.h,
                            width: 170.w,
                          ),
                          8.h.verticalSpace,
                          ShimmerPlaceholderWidget(
                            height: 12.h,
                            width: 140.w,
                          ),
                          4.h.verticalSpace,
                          ShimmerPlaceholderWidget(
                            height: 12.h,
                            width: 120.w,
                          ),
                          4.h.verticalSpace,
                          ShimmerPlaceholderWidget(
                            height: 12.h,
                            width: 100.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
          margin: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            children: List.generate(
              4,
              (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ShimmerPlaceholderWidget(
                          height: 14.h,
                        ),
                      ),
                      54.w.horizontalSpace,
                      Expanded(
                        child: ShimmerPlaceholderWidget(
                          height: 14.h,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
