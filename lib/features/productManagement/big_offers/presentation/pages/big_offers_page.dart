import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jeeey/core/constants/app_images.dart';

import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/product_card.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/app_bar_big_offers_widget.dart';

class BigOffersPage extends StatelessWidget {
  const BigOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBarBigOffersWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image.asset(
            //   AppImages.bigOffers,
            //   fit: BoxFit.cover,
            //   height: 120.h,
            // ),
            Container(
              height: 100.h,
              width: double.infinity,
              color: Color(0xffbf1300),
            ),
            MasonryGridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: gradientTopTrends?0:8.h),
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
          ],
        ),
      ),
    );
  }
}
