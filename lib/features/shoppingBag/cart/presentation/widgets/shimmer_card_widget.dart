import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/constants/app_images.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/shimmer_widget.dart';

class ShimmerCardWidget extends ConsumerWidget {
  const ShimmerCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 8.h),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ShimmerPlaceholderWidget(
                    height: 70.h,
                    width: 80.w,
                  ),
                  Image.asset(
                    AppImages.logoWithText,
                    height: 54.h,
                    width: 54.w,
                  ),
                ],
              ),
              8.w.horizontalSpace,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerPlaceholderWidget(
                      width: 180.w,
                      height: 14.h,
                    ),
                    6.h.verticalSpace,
                    ShimmerPlaceholderWidget(
                      height: 13.h,
                      width: 140.w,
                    ),
                    6.h.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ShimmerPlaceholderWidget(
                            height: 12.h,
                            width: 80.w,
                          ),
                        ),
                        Row(
                          children: [
                            ShimmerPlaceholderWidget(
                              height: 16.h,
                              width: 22.w,
                            ),
                            4.w.horizontalSpace,
                            ShimmerWidget(
                              child: AutoSizeTextWidget(
                                text: "0",
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            4.w.horizontalSpace,
                            ShimmerPlaceholderWidget(
                              height: 16.h,
                              width: 22.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
