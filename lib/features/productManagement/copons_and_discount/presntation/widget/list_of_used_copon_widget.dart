import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../data/model/copon_data.dart';
import 'card_of_copon_widget.dart';

class ListOfUsedCoponWidget extends StatelessWidget {
  const ListOfUsedCoponWidget(
      {super.key,
      required this.coponUsed,
      required this.scrollController,
      required this.isLoadingMore});

  final List<CoponData> coponUsed;
  final ScrollController scrollController;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        if (index < coponUsed.length) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: CardOfCoponWidget(
              coponData: coponUsed[index],
              showBottonShopping: true,
            ),
          );
        }
        if (isLoadingMore) {
          return Padding(
            padding: EdgeInsets.only(top: 18.h),
            child: const CircularProgressIndicatorWidget(),
          );
        }
        return const SizedBox.shrink();
      },
      itemCount: coponUsed.length + (isLoadingMore ? 1 : 0),
    );
  }
}
