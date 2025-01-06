import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/auto_size_text_widget.dart';


class GeneralDesignForOrderConfirmationSectionsWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Widget child;

  const GeneralDesignForOrderConfirmationSectionsWidget({
    super.key,
    required this.title,
    required this.child,
    this.fontSize,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      margin: EdgeInsets.only(top: 12.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric( horizontal: 12.w,),
            child: AutoSizeTextWidget(
              text: title,
              fontSize:fontSize?? 13.2.sp,
            ),
          ),
          2.h.verticalSpace,
          child,
        ],
      ),
    );
  }
}
