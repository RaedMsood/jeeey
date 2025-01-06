import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import 'price_and_currency_design_widget.dart';

class NameDescriptionAndPriceOfTheProductWidget extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String currency;

  const NameDescriptionAndPriceOfTheProductWidget({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeTextWidget(
            text: "$name $description",
            fontSize: 12.sp,
            maxLines: 8,
          ),
          8.h.verticalSpace,
          PriceAndCurrencyDesignWidget(
            price: price.toString(),
            currency: currency.toString(),
            fontSize1: 14.sp,
            fontSize2: 10.sp,
          ),

          8.h.verticalSpace,
        ],
      ),
    );
  }
}
