import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/shimmer_widget.dart';

class ShimmerAddressCardWidget extends StatelessWidget {
  const ShimmerAddressCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.sp),
          ),
          child: Row(
            children: [
              ShimmerWidget(
                child: SvgPicture.asset(
                  AppIcons.cardAddress,
                  height: 42.h,
                ),
              ),
              8.w.horizontalSpace,
              Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerPlaceholderWidget(
                        width: 180.w,
                        height: 16.h,
                      ),
                      8.h.verticalSpace,
                      Row(
                        children: [
                          ShimmerPlaceholderWidget(
                            width: 80.w,
                            height: 14.h,
                          ),
                          8.w.horizontalSpace,
                          ShimmerPlaceholderWidget(
                            width: 80.w,
                            height: 14.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}