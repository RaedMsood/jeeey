import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class CategoriesOfCoponWidget extends StatefulWidget {
  const CategoriesOfCoponWidget({super.key, required this.category});

  final List<String> category;

  @override
  State<CategoriesOfCoponWidget> createState() =>
      _CategoriesOfCoponWidgetState();
}

class _CategoriesOfCoponWidgetState extends State<CategoriesOfCoponWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عرض بعض الـ categories (مثلاً أول 3 فقط)
          Wrap(
            children: [
              ...widget.category.take(4).map((category) => Container(
                    padding: EdgeInsets.all(2.sp),
                    margin: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      // borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 0.1.r,
                      ),
                    ),
                    child: AutoSizeTextWidget(
                      fontSize: 7.sp,
                      text: category,
                      colorText: Colors.black,
                    ),
                  )),
              if (widget.category.length > 4)
                Visibility(
                  visible: !isExpanded,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        // borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 0.1.r,
                        ),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primaryColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (isExpanded)
            Wrap(
              children: [
                ...widget.category.skip(4).map((category) => Container(
                      padding: EdgeInsets.all(2.sp),
                      margin: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        // borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 0.1.r,
                        ),
                      ),
                      child: AutoSizeTextWidget(
                        text: category,
                        fontSize: 9.sp,
                        colorText: Colors.black,
                      ),
                    )),
                if (widget.category.length > 4)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        // borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 0.1.r,
                        ),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: AppColors.primaryColor,
                        size: 16,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
