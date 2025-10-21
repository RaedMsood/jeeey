import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/price_and_currency_widget.dart';

import 'auto_size_text_widget.dart';

class BillDesignWidget extends StatelessWidget {
  final String name;
  final double price;
  final double? fontSize1;
  final double? fontSize2;

  final Color? color1;
  final Color? color2;

  const BillDesignWidget({
    super.key,
    required this.name,
    required this.price,
    this.fontSize1,
    this.fontSize2,
    this.color1,
    this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AutoSizeTextWidget(
              text: name,
              fontWeight: FontWeight.w600,
              colorText: color1 ?? const Color(0xff707070),
              fontSize: fontSize1 ?? 12.sp,
            ),
          ),
          Expanded(
            child: PriceAndCurrencyWidget(
              price: price.toString(),
              fontSize1: fontSize2 ?? 11.5.sp,
              fontSize2: 9.sp,
              colorText1: color2 ?? const Color(0xff384354),
              colorText2: color2 ?? const Color(0xff384354),
              textAlign1: TextAlign.end,
              textAlign2: TextAlign.end,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          14.w.horizontalSpace,
        ],
      ),
    );
  }
}
