import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/core/widgets/online_images_widget.dart';
import 'package:jeeey/features/category/data/model/category_data.dart';

import '../pages/subcategory_product_filter_page.dart';
import '../riverpod/category_riverpod.dart';

class CircleCardForCategoriesWidget extends ConsumerWidget {
  final String image;
  final String name;
  final double? circularRadius;
  final VoidCallback? onPressed;
 final int idCategory;
  //final List<CategoryData> category;
  const CircleCardForCategoriesWidget({
    super.key,
    required this.name,
    //required this.category,
    this.circularRadius,
    this.onPressed,
    required this.image,
    required this.idCategory
    //required this.index
  });

  @override
  Widget build(BuildContext context,ref) {
    return InkWell(
      onTap: () {
        print(idCategory.toString() +"-------------");
        navigateTo(context, SubcategoryProductFilterPage(idCategory: idCategory,));
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
