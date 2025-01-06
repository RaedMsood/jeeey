import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/category/data/model/category_data.dart';
import 'package:jeeey/features/home/presentation/widgets/app_bar_home_widget.dart';

import 'circle_card_for_categories_widget.dart';
import 'list_to_display_categories_on_the_home_widget.dart';
import 'colum_rectangular_card_for_categories_widget.dart';


class ListForColumCardSubcategoriesWidget extends StatelessWidget {
  final List<CategoryData> category;
   ListForColumCardSubcategoriesWidget({super.key, required this.category});


  bool oneOfSubCategoryHasChild = false;
  @override
  Widget build(BuildContext context) {
    return category.isNotEmpty==true?ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      itemCount: category.length,
      itemBuilder: (context, index) {

          for (int i = 0; i <= category.length; ) {
            if (category[i].hasChildren == true) {
              print(category[i].hasChildren);
              oneOfSubCategoryHasChild = true;
            }
            break;
          }


        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // viewType == 1
            oneOfSubCategoryHasChild==true  ? CircleCardForCategoriesWidget(
              idCategory: category[index].id!,
                     circularRadius: 30.sp,
              name: category[index].name!,
              image: "https://cdn.salla.sa/wWwyOy/ukjqWnMW48kbzf1lqDGyKeUSsDnXdoSyxr6PWJKX.jpg",
                  )
                : RectangularCardForCategoriesWidget(
              idCategory: category[index].id!,
                    // circularRadius: 30.sp,

              name: category[index].name!,
                  ),
            4.w.horizontalSpace,
          ],
        );
      },
    ):SizedBox();
  }
}
