import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/theme/app_colors.dart';

import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/online_images_widget.dart';

class CardForMajorOffersAndTrendsAndDiscountWidget extends StatelessWidget {
  final double? priceFontSize;


  const CardForMajorOffersAndTrendsAndDiscountWidget({
    super.key,
    this.priceFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: OnlineImagesWidget(
                imageUrl: "https://www.fay3.com/iu7992Dg6/download",
                size: Size(75.w, double.infinity),
              ),
            ),
            3.h.verticalSpace,
            AutoSizeTextWidget(
              text: "6,700 ر.ي",
              fontSize: priceFontSize ?? 10.sp,
              colorText: AppColors.primarySwatch.shade600,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        5.w.horizontalSpace,
      ],
    );
  }
}
