import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'card_for_major_offers_and_trends_and_discount_widget.dart';
import 'card_to_list_major_offers_and_trends_and_discount_widget.dart';

class ListOfDiscountWidget extends StatelessWidget {
  const ListOfDiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardToListMajorOffersAndTrendsAndDiscountWidget(
      title: "خصم حتى 80%",
      height: 145.h,
      list:Expanded(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),

          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal:8.w,vertical: 4.h),
          itemCount: 2,
          itemBuilder: (context, index) {
            return  CardForMajorOffersAndTrendsAndDiscountWidget(
              priceFontSize: 6.sp,
            );
          },
        ),
      ) ,
    );

  }
}
