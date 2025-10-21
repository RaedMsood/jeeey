import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/bill_design_widget.dart';

class BillWidget extends StatelessWidget {
  final double total;
  final String currency;
  final bool hasCopon;
  final double totalAfterDiscount;
  final double coponValue;
  final double deliveryCost;
  const BillWidget(
      {super.key,
      required this.total,
      required this.currency,
      required this.hasCopon,
        required this.coponValue,
        required this.deliveryCost,
      required this.totalAfterDiscount});

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
            color1: Colors.black87,
          ),
          BillDesignWidget(
            name: S.of(context).deliveryCost,
            price: deliveryCost,
          ),
          BillDesignWidget(
            name: S.of(context).discountOnBill,
            price: 0.0,
          ),
          Visibility(
            visible: hasCopon,
            child: BillDesignWidget(
              name: 'خصم الكوبون',
              price:coponValue ,
              color1: AppColors.primaryColor,
              color2:AppColors.primaryColor ,
            ),
          ),
          8.h.verticalSpace,
          BillDesignWidget(
            name: S.of(context).total,
            price: totalAfterDiscount,
            fontSize1: 14.sp,
            fontSize2: 11.6.sp,
            color1: Colors.black87,
            color2: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
