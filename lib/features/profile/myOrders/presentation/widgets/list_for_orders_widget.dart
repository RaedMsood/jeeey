import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_get_api_data_widget.dart';
import 'package:jeeey/features/profile/myOrders/presentation/riverpod/order_riverpod.dart';

import '../../../../../core/state/state.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import 'order_card_widget.dart';

class ListForOrdersWidget extends ConsumerWidget {
  final int status;
  final bool? all;
  final ScrollController scrollController;

  const ListForOrdersWidget({
    super.key,
    required this.scrollController,
    required this.status,
    this.all = false,
  });

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(getAllOrdersProvider);
    return CheckStateInGetApiDataWidget(
      state: state,
      widgetOfData: ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        shrinkWrap: true,
        itemCount: state.data.orders.length,
        padding: EdgeInsets.only(bottom: 12.h),
        itemBuilder: (context, index) {
          return state.data.orders[index].status!.id == status || all == true
              ? OrderCardWidget(
                  data: state.data.orders[index],
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
