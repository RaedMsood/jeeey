import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/cart_model.dart';
import '../riverpod/cart_riverpod.dart';
import 'cart_card_widget.dart';

class ListForCartWidget extends ConsumerStatefulWidget {
  const ListForCartWidget({super.key});

  @override
  ConsumerState<ListForCartWidget> createState() => _ListForCartWidgetState();
}

class _ListForCartWidgetState extends ConsumerState<ListForCartWidget> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(getAllCartProvider);
    var cartState = ref.watch(cartProvider.notifier);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.data.length,
      itemBuilder: (context, index) {
        return CartCardWidget(
          data: state.data[index],
          onDelete: () {
            setState(() {
              state.data.removeAt(index);
            });
          },
        );
      },
    );
  }
}
