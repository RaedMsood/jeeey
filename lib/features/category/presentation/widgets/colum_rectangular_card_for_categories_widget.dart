import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/theme/app_colors.dart';

import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/online_images_widget.dart';
import '../pages/subcategory_product_filter_page.dart';

class RectangularCardForCategoriesWidget extends StatelessWidget {
  final String name;
  final int idCategory;

  const RectangularCardForCategoriesWidget({
    super.key,
    required this.name,
    required this.idCategory
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(idCategory);
        //navigateTo(context, SubcategoryProductFilterPage(idCategory: idCategory,));
      },
      child: Container(
        width: 70.w,
        padding: EdgeInsets.all(2.sp),
        margin: EdgeInsets.only(bottom: 1.h),
        decoration: BoxDecoration(
          color: AppColors.greySwatch.shade100.withOpacity(.6),
          // border: choose == true
          //     ? Border.all(color: Colors.black, width: 0.8)
          //     : Border.all(color: Colors.transparent),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OnlineImagesWidget(
              imageUrl:
                  "https://cdn.salla.sa/wWwyOy/ukjqWnMW48kbzf1lqDGyKeUSsDnXdoSyxr6PWJKX.jpg",
              size: Size(double.infinity, 63.h),
            ),
            2.h.verticalSpace,
            Flexible(
              child: SizedBox(
                height: 30.h,
                child: AutoSizeTextWidget(
                  text: name,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  minFontSize: 9,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
