import 'package:flutter/material.dart';

import '../../data/model/copon_data.dart';
import 'card_of_copon_widget.dart';

class ListOfExpiredCoponWidget extends StatelessWidget {
  const ListOfExpiredCoponWidget({super.key,required this.copon,required this.isLoadingMore,required this.scrollController});
  final List<CoponData> copon;
  final ScrollController scrollController;
  final bool isLoadingMore;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        return Padding(
        padding: const EdgeInsets.all(10.0),
        child: CardOfCoponWidget(
          coponData: copon[index],
          showBottonShopping: false,
        ),
      );
      },
      itemCount: copon.length,
    );
  }
}
