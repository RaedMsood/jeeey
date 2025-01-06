import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/auto_size_text_widget.dart';

class NumberOfImageWidget extends StatelessWidget {
  const NumberOfImageWidget({super.key,required this.numImageAndIndex});
  final String numImageAndIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.sp),
      color: Colors.white,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          child: AutoSizeTextWidget(
            text:numImageAndIndex,
            colorText: Colors.white,
            textAlign: TextAlign.center,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
