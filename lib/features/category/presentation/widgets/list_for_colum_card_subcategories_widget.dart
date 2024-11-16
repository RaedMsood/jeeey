import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'circle_card_for_categories_widget.dart';
import 'list_to_display_categories_on_the_home_widget.dart';
import 'colum_rectangular_card_for_categories_widget.dart';

class ListForColumCardSubcategoriesWidget extends StatelessWidget {
  final int viewType;

  const ListForColumCardSubcategoriesWidget({super.key, required this.viewType});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            viewType == 1
                ? CircleCardForCategoriesWidget(
                     circularRadius: 30.sp,
                    name: index == 0 ? "ملابس نسائية منسوجة" : name[1],
              image: '"https://cdn.salla.sa/wWwyOy/ukjqWnMW48kbzf1lqDGyKeUSsDnXdoSyxr6PWJKX.jpg"',
                  )
                : RectangularCardForCategoriesWidget(
                    // circularRadius: 30.sp,
                    name: index == 0 ? "ملابس نسائية منسوجة" : name[1],
                  ),
            4.w.horizontalSpace,
          ],
        );
      },
    );
  }
}
