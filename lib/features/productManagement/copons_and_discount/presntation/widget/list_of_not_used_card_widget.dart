import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/productManagement/copons_and_discount/data/model/copon_data.dart';

import '../../../../../core/widgets/loading_widget.dart';
import 'card_of_copon_widget.dart';

class ListOfNotUsedCardWidget extends StatelessWidget {
  const ListOfNotUsedCardWidget(
      {super.key,
      required this.copon,
      required this.isLoadingMore,
      required this.scrollController});

  final List<CoponData> copon;
  final ScrollController scrollController;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: CardOfCoponWidget(
            coponData: copon[index],
            showBottonShopping: true,
          ),
        );
      },
      itemCount: copon.length,
    );

  }
}
