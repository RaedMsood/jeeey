import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/core/widgets/online_images_widget.dart';

import '../pages/subcategory_product_filter_page.dart';

class CircleCardForCategoriesWidget extends StatelessWidget {
  final String image;
  final String name;
  final double? circularRadius;
  final VoidCallback? onPressed;

  const CircleCardForCategoriesWidget({
    super.key,
    required this.name,
    this.circularRadius,
    this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, SubcategoryProductFilterPage());
      },
      child: SizedBox(
        width: 70.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OnlineImagesWidget(
              imageUrl: image,
              circularImage: true,
              circularRadius: circularRadius ?? 28.sp,
            ),
            2.h.verticalSpace,
            Flexible(
              child: AutoSizeTextWidget(
                text: name,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                maxLines: 2,
                minFontSize: 10,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
