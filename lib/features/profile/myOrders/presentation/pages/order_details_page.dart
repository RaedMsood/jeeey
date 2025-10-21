import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_get_api_data_widget.dart';
import '../../../../../core/extension/string.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/secondary_app_bar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../riverpod/order_riverpod.dart';
import '../widgets/copy_and_view_the_order_number_widget.dart';
import '../widgets/order_bill_widget.dart';
import '../widgets/order_details_product_card_widget.dart';
import '../widgets/order_details_shimmer_widget.dart';

class OrderDetailsPage extends ConsumerWidget {
  final int orderId;

  const OrderDetailsPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(orderDetailsProvider(orderId));
    return Scaffold(
      appBar: SecondaryAppBarWidget(
        title: S.of(context).orderDetails,
        fontSize: 13.4.sp,
      ),
      body: SingleChildScrollView(
        child: CheckStateInGetApiDataWidget(
          state: state,
          widgetOfLoading: const OrderDetailsShimmerWidget(),
          widgetOfData: Column(
            children: [
              CopyAndViewTheOrderNumberWidget(orderNumber: state.data.trxId),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
                child: Row(
                  children: [
                    AutoSizeTextWidget(
                      text: S.of(context).shippingTime,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.5.sp,
                    ),
                    Expanded(
                      child: AutoSizeTextWidget(
                        text: state.data.date,
                        fontSize: 9.6.sp,
                        fontWeight: FontWeight.w600,
                        colorText: Colors.black87,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
              // 4.h.verticalSpace,
              Column(
                children: state.data.orderProducts.map((items) {
                  return OrderDetailsProductCardWidget(
                    orderProducts: items,
                    orderId: orderId,
                    status: state.data.status.id!,
                  );
                }).toList(),
              ),
              OrderBillWidget(data: state.data),
            ],
          ),
        ),
      ),
    );
  }
}
