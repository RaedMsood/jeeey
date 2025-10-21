import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/widgets/shimmer_widget.dart';

class ShimmerOrderCardWidget extends StatelessWidget {
  const ShimmerOrderCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          margin: EdgeInsets.only(top: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ShimmerWidget(
                    child: CircleAvatar(
                      radius: 7.5.r,
                    ),
                  ),
                  6.w.horizontalSpace,
                  ShimmerPlaceholderWidget(
                    width: 200.w,
                    height: 14.h,
                  ),
                ],
              ),
              8.h.verticalSpace,
              Row(
                children: [
                  ShimmerPlaceholderWidget(
                    height: 13.h,
                    width: 74.w,
                  ),
                  4.w.horizontalSpace,
                  ShimmerPlaceholderWidget(
                    height: 12.h,
                    width: 96.w,
                  ),
                ],
              ),
              12.h.verticalSpace,
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ShimmerPlaceholderWidget(
                        height: 110.h,
                        width: 120.w,
                      ),
                      Image.asset(
                        AppImages.logoWithText,
                        height: 58.h,
                        width: 78,
                      ),
                    ],
                  ),
                  8.w.horizontalSpace,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ShimmerPlaceholderWidget(
                        height: 120.h,
                        width: 120.w,
                      ),
                      Image.asset(
                        AppImages.logoWithText,
                        height: 58.h,
                        width: 78,
                      ),
                    ],
                  ),
                ],
              ),
              12.h.verticalSpace,
              Row(
                children: [
                  ShimmerPlaceholderWidget(
                    height: 13.h,
                    width: 90.w,
                  ),
                  4.w.horizontalSpace,
                  ShimmerPlaceholderWidget(
                    height: 12.h,
                    width: 100.w,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
