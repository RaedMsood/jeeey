import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'card_for_major_offers_and_trends_and_discount_widget.dart';
import 'card_to_list_major_offers_and_trends_and_discount_widget.dart';

class ListOfMajorOffersWidget extends StatelessWidget {
  const ListOfMajorOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardToListMajorOffersAndTrendsAndDiscountWidget(
      title: "العروض الكبرى",
      majorOffers: true,
      list: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          itemCount: 8,
          itemBuilder: (context, index) {
            return const CardForMajorOffersAndTrendsAndDiscountWidget();
          },
        ),
      ),
    );
  }
}
