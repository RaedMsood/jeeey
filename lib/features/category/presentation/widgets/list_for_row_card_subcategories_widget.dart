import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/category_data.dart';
import 'row_card_for_categories_widget.dart';


class ListForRowCardSubcategoriesWidget extends StatelessWidget {
  // final bool circularImage;
  final List<CategoryData> category;

  const ListForRowCardSubcategoriesWidget({super.key,
    required this.category
  });

  @override
  Widget build(BuildContext context) {
    return category.isNotEmpty? Container(
      height: 40.h,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              RowCardForCategoriesWidget(

                circularImage: category[index].hasChildren==true?true:false,
                nameCategory: category[index].name!,
                image: category[index].image!,
              ),
              category[index].hasChildren==true?0.horizontalSpace: 6.w.horizontalSpace,

            ],
          );
        },
      ),
    ):const SizedBox();
  }
}

// class ListForRowCardSubcategoriesWidget2 extends SliverPersistentHeaderDelegate {
//   final bool circularImage;
//   const ListForRowCardSubcategoriesWidget2({
//     required this.circularImage,
// });
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.white,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 8.w),
//         itemCount: 8,
//         itemBuilder: (context, index) {
//           return Row(
//             children: [
//               RowCardForCategoriesWidget(
//                 circularImage: circularImage,
//               ),
//              circularImage==true?0.horizontalSpace: 6.w.horizontalSpace,
//
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   double get maxExtent => 34.h;
//
//   @override
//   double get minExtent => 34.h;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
