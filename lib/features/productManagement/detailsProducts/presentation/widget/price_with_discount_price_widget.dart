import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/productManagement/copons_and_discount/data/model/discount_model.dart';

import '../../../../../core/widgets/price_and_currency_widget.dart';
import 'line_through_price_widget.dart';

class PriceWithDiscountPriceWidget extends StatelessWidget {
  const PriceWithDiscountPriceWidget(
      {super.key, required this.discountModel, required this.price});

  final dynamic price;
  final DiscountModel? discountModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: discountModel == null,
          replacement: PriceAndCurrencyWidget(
            price: discountModel == null
                ? '0'
                : discountModel!.discountType != 'percent'
                    ? (price! - discountModel!.discount ?? 0).toString()
                    : (((price! * (discountModel!.discount! / 100) - price!)
                                .round()) *
                            (-1))
                        .toString(),
            fontSize1: 14.sp,
            fontSize2: 10.sp,
          ),
          child: PriceAndCurrencyWidget(
            price: price.toString(),
            fontSize1: 14.sp,
            fontSize2: 10.sp,
          ),
        ),
        Visibility(
          visible: discountModel != null,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0.sp),
            child: Stack(
              alignment: Alignment.center,
              children: [
                PriceAndCurrencyWidget(
                  price: price.toString(),
                  fontSize1: 10.sp,
                  fontSize2: 8.sp,
                  colorText2: Colors.black,
                  colorText1: Colors.black,
                ),
                Positioned.fill(
                  child: CustomPaint(
                    painter: LineThroughPainter(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
