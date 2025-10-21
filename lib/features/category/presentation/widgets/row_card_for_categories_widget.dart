import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/online_images_widget.dart';

class RowCardForCategoriesWidget extends StatelessWidget {
  final bool circularImage;
  final String nameCategory;

  final String image;
  const RowCardForCategoriesWidget({
    super.key,
    required this.circularImage ,
    required this.nameCategory,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(1.sp),
      width: 80.w,
      margin: EdgeInsets.only(bottom: 3.h),
      decoration: BoxDecoration(
         color:circularImage==true?Colors.white: AppColors.greySwatch.shade100.withOpacity(.6),

      ),
      child: Row(
        children: [
          Flexible(
            child: OnlineImagesWidget(
              imageUrl:
                image,
              circularImage: circularImage,

            ),
          ),
          3.w.horizontalSpace,
          Flexible(
            child: AutoSizeTextWidget(
              text: nameCategory,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              maxLines: 2,
              minFontSize: 10,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
