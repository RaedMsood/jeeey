import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';

class IconAndTitleDesignWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const IconAndTitleDesignWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          InkWellButtonWidget(
            icon: icon,
            onPressed: onPressed,
          ),
          3.h.verticalSpace,
          AutoSizeTextWidget(
            text: title,
            fontSize: 10.4.sp,
            fontWeight: FontWeight.w500,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
