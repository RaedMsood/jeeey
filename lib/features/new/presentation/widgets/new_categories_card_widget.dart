import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';

class NewCategoriesCardWidget extends StatelessWidget {
  final String categoriesName;
  final String tempCategoriesName;
  final AlignmentGeometry? alignment;

  const NewCategoriesCardWidget(
      {super.key,
      required this.categoriesName,
      required this.tempCategoriesName,
      this.alignment=Alignment.center,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.sp),
        border: Border.all(
            color: tempCategoriesName == categoriesName
                ? Colors.green
                : AppColors.fontColor,
            width: tempCategoriesName == categoriesName?0.7 :0.1),
      ),
      alignment:alignment,
      child: AutoSizeTextWidget(
        text: categoriesName,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
      ),
    );
  }
}
