// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../data/model/cart_model.dart';
// import '../riverpod/cart_riverpod.dart';
// import 'cart_card_widget.dart';
//
// class ListForCartWidget extends ConsumerStatefulWidget {
//   const ListForCartWidget({super.key});
//
//   @override
//   ConsumerState<ListForCartWidget> createState() => _ListForCartWidgetState();
// }
//
// class _ListForCartWidgetState extends ConsumerState<ListForCartWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     var state = ref.watch(getAllCartProvider);
//     // var cartState = ref.watch(cartProvider);
//
//     return ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: state.data.length,
//       itemBuilder: (context, index) {
//         return CartCardWidget(
//           data: state.data[index],
//           onDelete: () {
//             setState(() {
//               state.data.removeAt(index);
//
//               // state.data[index]=state.data[index];
//               // cartState.isAllProductsSelected(state.data);
//             });
//           },
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import 'package:jeeey/features/productManagement/detailsProducts/presentation/page/details_page.dart';
import '../../../../../core/state/check_state_in_post_api_data_widget.dart';
import '../../../../../core/state/state.dart';
import '../../data/model/cart_model.dart';
import '../riverpod/cart_riverpod.dart';
import 'cart_card_widget.dart';

class ListForCartWidget extends ConsumerStatefulWidget {
  const ListForCartWidget({super.key});

  @override
  ConsumerState<ListForCartWidget> createState() => _ListForCartWidgetState();
}

class _ListForCartWidgetState extends ConsumerState<ListForCartWidget> {
  int loadingId = 0;
  bool delete = false;

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(getAllCartProvider);
    var cartStateNotifier = ref.watch(cartProvider.notifier);
    var cartState = ref.watch(cartProvider);

    return CheckStateInPostApiDataWidget(
      state: cartState,
      hasMessageSuccess: false,
      functionSuccess: () {
        setState(() {
          if (delete) {
            delete = false;
          } else {
            ref.read(cartProductProvider(loadingId).notifier).updateProduct(
                  ref
                      .read(cartProductProvider(loadingId))
                      .updateCartProduct(ref.read(cartProvider).data),
                );
            final index = state.data.indexWhere((item) => item.id == loadingId);
            if (index != -1) {
              state.data[index] =
                  state.data[index].updateCartProduct(cartState.data);
            }
          }
        });
      },
      bottonWidget: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.data.length,
        itemBuilder: (context, index) {
          var item = state.data[index];
          return GestureDetector(
            onTap: () {
              navigateTo(
                context,
                DetailsPage(
                  idProduct: item.productId!,
                  name: item.productName.toString(),
                  price: item.price,
                  image: [item.images!],
                ),
              );
            },
            child: CartCardWidget(
              productId: item.id,
              loadingId: loadingId,
              onDelete: () {
                setState(() {
                  loadingId = item.id;
                  delete = true;
                });
                cartStateNotifier.deleteAProductFromTheCart(
                    id: item.id, ref: ref);
              },
              onUpdateQuantity: (int newQuantity) {
                setState(() {
                  loadingId = item.id;

                  cartStateNotifier.updateCart(
                    id: item.id,
                    prodectId: item.productId!,
                    colorId: item.colorId,
                    sizeId: item.sizeId!,
                    price: item.price.toString(),
                    quantity: newQuantity,
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
