import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../theme/app_colors.dart';
import 'product_card.dart';

class ProductListWidget extends StatelessWidget {
  final bool? gradient;
  const ProductListWidget({super.key, this.gradient=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(colors:gradient==false? [
          AppColors.whiteColor,
          AppColors.scaffoldColor,
          AppColors.scaffoldColor,

        ]:[
          AppColors.scaffoldColor,
          AppColors.scaffoldColor,
        ], begin: Alignment.topCenter, end: Alignment.center),
      ),
      child: MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        // padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 8.0,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            id: 1,
            image:
                "https://www.swishschool.com/w/wp-content/uploads/2016/08/%D8%A7%D8%AC%D9%85%D9%84-%D9%85%D9%88%D8%AF%D9%8A%D9%84-%D8%A7%D8%B9%D9%84%D8%A7%D9%86%D8%A7%D8%AA-5.jpg",
            name: "Raed",
            rates: 4,
            price: "2,700ر.ي",
            isFavorite: true,
          );
        },
        itemCount: 12,
      ),
    );
  }
}

// class ProductListWidget extends StatelessWidget {
//   const ProductListWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: AppColors.whiteColor,
//         gradient: LinearGradient(colors: [
//           AppColors.whiteColor,
//           AppColors.whiteColor,
//           AppColors.scaffoldColor,
//         ], begin: Alignment.topCenter, end: Alignment.center),
//       ),
//       child: StaggeredGridView.countBuilder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
//         crossAxisCount: 6,
//         mainAxisSpacing: 6.0,
//         crossAxisSpacing: 8.0,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(top: index.isEven ? 0.h : 0),
//             child: ProductCard(
//               id: 1,
//               image:
//                   "https://www.swishschool.com/w/wp-content/uploads/2016/08/%D8%A7%D8%AC%D9%85%D9%84-%D9%85%D9%88%D8%AF%D9%8A%D9%84-%D8%A7%D8%B9%D9%84%D8%A7%D9%86%D8%A7%D8%AA-5.jpg",
//               name: "Raed",
//               rates: 4,
//               price: "2,700ر.ي",
//               isFavorite: true,
//             ),
//           );
//         },
//         staggeredTileBuilder: (index) =>
//             StaggeredTile.count(3, index.isEven ? 5.1 : 4.7),
//         itemCount: 12,
//       ),
//     );
//   }
// }
