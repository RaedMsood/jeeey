import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class IconShowCodeWidget extends StatefulWidget {
  const IconShowCodeWidget({super.key,required this.onTab,required this.isExpandedDetails});
  final GestureTapCallback onTab;
  final   bool isExpandedDetails ;

  @override
  State<IconShowCodeWidget> createState() => _IconShowCodeWidgetState();
}

class _IconShowCodeWidgetState extends State<IconShowCodeWidget> {

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
     onTap: widget.onTab,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 0.1.r,
          ),
        ),
        child: Icon(
          !widget.isExpandedDetails
              ? Icons.keyboard_arrow_down
              : Icons.keyboard_arrow_up,
          color: AppColors.primaryColor,
          size: 16,
        ),
      ),
    );
  }
}
