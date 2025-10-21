import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class DesignDateWidget extends StatelessWidget {
   DesignDateWidget({super.key,required this.value,required this.isProductPage});
  bool isProductPage=false;

  final String value;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(2.sp),
      margin: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        color:isProductPage? Colors.black: AppColors.primaryColor.withOpacity(0.1),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 0.1.r,
        ),
      ),
      child: AutoSizeTextWidget(
        text: value,
        fontSize: 9.sp,
        colorText:isProductPage? Colors.white: Colors.black,
      ),
    );
  }
}
