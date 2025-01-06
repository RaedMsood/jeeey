import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/category/data/model/category_data.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../pages/subcategory_product_filter_page.dart';
import '../riverpod/category_riverpod.dart';
import 'circle_card_for_categories_widget.dart';

class ListToDisplayCategoriesOnTheHomeWidget extends ConsumerWidget {
  const ListToDisplayCategoriesOnTheHomeWidget({super.key,required this.category});
 final List<CategoryData>? category;


  @override
  Widget build(BuildContext context,ref) {
    return Container(
      height: 265.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
      ),

      child: Padding(
        padding:  EdgeInsets.all(8.0.sp),
        child: Wrap(
          spacing: 8.0.w,
          runSpacing: 10.0.h,
          children: category!.map((item){
            return CircleCardForCategoriesWidget(
                      idCategory: item.id!,
                      name: item.name!,
                      image: 'https://eyess.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F07%2F2138-1.jpg&n=Flq38TbBQfHfEB8rSZ0XQ',
                    );
          }).toList(),
        ),
      ),
    );
  }
}
