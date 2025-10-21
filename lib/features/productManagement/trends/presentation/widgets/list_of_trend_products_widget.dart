import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/product_card.dart';

class ListOfTrendProductsWidget extends StatelessWidget {
  final bool gradientTopTrends;

  const ListOfTrendProductsWidget({super.key, this.gradientTopTrends = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(gradientTopTrends ? 0 : 16.r),
          topLeft: Radius.circular(gradientTopTrends ? 0 : 16.r),
        ),
        gradient: LinearGradient(
          colors: gradientTopTrends
              ? [
                  Colors.purple.shade50.withOpacity(.7),
                  AppColors.scaffoldColor,
                  AppColors.scaffoldColor,
                  AppColors.scaffoldColor,
                  AppColors.scaffoldColor,
                ]
              : [
                  AppColors.whiteColor,
                  AppColors.scaffoldColor,
                  AppColors.scaffoldColor,
                ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: gradientTopTrends?0:8.h),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 6.0,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return ProductCard(
            id: 1,
            image: index == 0
                ? ["https://www.fay3.com/iu7992Dg6/download"]
                : index == 1
                    ? [
                        'https://meaningg.cc/wp-content/uploads/2019/07/3947-16.jpg'
                      ]
                    : [
                        'https://meaningg.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F07%2F3947-1.jpg&n=6HIfwnIaMkYZpv222iyJYw'
                      ],
            name: "ملابس نسائية",
            rates: 4,
            price: 2000,
            isFavorite: true,
          );
        },
      ),
    );
  }
}
