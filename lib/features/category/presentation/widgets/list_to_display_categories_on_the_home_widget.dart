import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'circle_card_for_categories_widget.dart';

List<String> name = [
  "ملابس نسائية",
  "ملابس نسائية",
  "ملابس نسائية",
  "ملابس نسائية",
  "ملابس نسائية",
  "ملابس نسائية",
  "ملابس نسائية",
  "ملابس نسائية",
];

class ListToDisplayCategoriesOnTheHomeWidget extends StatelessWidget {
  const ListToDisplayCategoriesOnTheHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      alignment: Alignment.center,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(8.sp),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 1.2,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return CircleCardForCategoriesWidget(
            name: index==0?"ملابس نسائية منسوجة": name[1],
            image: 'https://eyess.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F07%2F2138-1.jpg&n=Flq38TbBQfHfEB8rSZ0XQ',
          );
        },
      ),
    );
  }
}
