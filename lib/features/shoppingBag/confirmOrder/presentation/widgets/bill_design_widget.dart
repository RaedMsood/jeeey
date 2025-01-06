import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/auto_size_text_widget.dart';

class BillDesignWidget extends StatelessWidget {
  final String name;
  final double price;
  final String currency;
  final double? fontSize1;
  final double? fontSize2;

  final Color? color1;
  final Color? color2;

  const BillDesignWidget({
    super.key,
    required this.name,
    required this.price,
    required this.currency,
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
              fontSize: fontSize1 ?? 13.sp,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AutoSizeTextWidget(
                  text: price.toString(),
                  fontSize: fontSize2 ?? 11.4.sp,
                  colorText: color2 ?? const Color(0xff384354),
                  textAlign: TextAlign.end,
                  fontWeight: FontWeight.w700,
                ),
                2.5.w.horizontalSpace,
                AutoSizeTextWidget(
                  text: currency,
                  fontSize: 9.sp,
                  colorText: color2 ?? const Color(0xff384354),
                  textAlign: TextAlign.end,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          18.w.horizontalSpace,
        ],
      ),
    );
  }
}
