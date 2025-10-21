import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/features/profile/myOrders/data/model/order_details_model.dart';

import '../../../../../core/widgets/bill_design_widget.dart';
import '../../../../../generated/l10n.dart';

class OrderBillWidget extends StatelessWidget {
  final OrderDetailsModel data;
  const OrderBillWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeTextWidget(
            text: S.of(context).paymentDetails,
            fontSize: 11.6.sp,
            colorText: const Color(0xff707070),
          ),
          10.h.verticalSpace,
          BillDesignWidget(
            name: S.of(context).theTotal,
            price:data.productsTotal.toDouble(),
            fontSize1: 11.8.sp,
            fontSize2: 11.sp,
            color1: Colors.black87,
          ),
          4.h.verticalSpace,
          BillDesignWidget(
            name: S.of(context).deliveryCost,
            price: data.deliveryTotal.toDouble(),
            fontSize1: 11.4.sp,
            fontSize2: 11.sp,
          ),
          4.h.verticalSpace,
          BillDesignWidget(
            name: S.of(context).discountOnBill,
            price: data.discount.toDouble(),
            fontSize1: 11.5.sp,
            fontSize2: 11.sp,
          ),
          11.h.verticalSpace,
          BillDesignWidget(
            name: S.of(context).total,
            price: data.total.toDouble(),
            fontSize1: 13.sp,
            fontSize2: 11.4.sp,
            color1: Colors.black87,
            // color2: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
