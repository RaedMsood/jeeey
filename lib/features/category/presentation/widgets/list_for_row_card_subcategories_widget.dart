import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'row_card_for_categories_widget.dart';


class ListForRowCardSubcategoriesWidget extends StatelessWidget {
  final bool circularImage;
  const ListForRowCardSubcategoriesWidget({
    required this.circularImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Row(
            children: [
              RowCardForCategoriesWidget(
                circularImage: circularImage,
              ),
              circularImage==true?0.horizontalSpace: 6.w.horizontalSpace,

            ],
          );
        },
      ),
    );
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
