import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'bill_design_widget.dart';

class BillWidget extends StatelessWidget {
  final double total;
  final String currency;

  const BillWidget({super.key, required this.total, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      margin: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BillDesignWidget(
            name: S.of(context).theTotal,
            price: total,
            currency: currency,
            color1: Colors.black87,
          ),
          BillDesignWidget(
            name: S.of(context).deliveryCost,
            price: 0.0,
            currency: currency,

          ),
          BillDesignWidget(
            name: S.of(context).discountOnBill,
            price: 0.0,
            currency: currency,

          ),
          8.h.verticalSpace,
          BillDesignWidget(
            name: S.of(context).total,
            price: total,
            currency: currency,
            fontSize1: 14.2.sp,
            fontSize2: 11.8.sp,
            color1: Colors.black87,
            color2: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
