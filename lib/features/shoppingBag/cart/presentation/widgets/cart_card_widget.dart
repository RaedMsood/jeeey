// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../../core/constants/app_icons.dart';
// import '../../../../../core/state/check_state_in_post_api_data_widget.dart';
// import '../../../../../core/state/state.dart';
// import '../../../../../core/theme/app_colors.dart';
// import '../../../../../core/widgets/auto_size_text_widget.dart';
// import '../../../../../core/widgets/online_images_widget.dart';
// import '../../data/model/cart_model.dart';
// import '../riverpod/cart_riverpod.dart';
// import 'check_box_for_cart_products_widget.dart';
// import 'color_and_size_design_for_cart_card_widget.dart';
// import '../../../../../core/widgets/price_and_currency_widget.dart';
//
// class CartCardWidget extends ConsumerStatefulWidget {
//   CartModel data;
//   final Function onDelete;
//
//   CartCardWidget({
//     super.key,
//     required this.data,
//     required this.onDelete,
//   });
//
//   @override
//   ConsumerState<CartCardWidget> createState() => _CartCardWidgetState();
// }
//
// class _CartCardWidgetState extends ConsumerState<CartCardWidget> {
//   bool delete = false;
//   int? loadingId;
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     var cartState = ref.watch(cartProvider);
//     var cartStateNotifier = ref.watch(cartProvider.notifier);
//
//     return Container(
//       margin: EdgeInsets.only(top: 8.h),
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//       decoration: BoxDecoration(
//         color: AppColors.whiteColor,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(.02),
//             blurRadius: 1.r,
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           CheckBoxForCartProductsWidget(
//             value: cartStateNotifier.selectedProducts
//                 .any((product) => product.id == widget.data.id),
//             onChanged: (isChecked) {
//               cartStateNotifier.toggleProductSelection(
//                 isChecked ?? false,
//                 widget.data,
//               );
//               setState(() {
//                 this.isChecked = isChecked ?? false;
//               });
//             },
//           ),
//           6.w.horizontalSpace,
//           OnlineImagesWidget(
//             imageUrl: widget.data.images.toString(),
//             size: Size(82.w, 84.h),
//             fit: BoxFit.cover,
//             borderRadius: 2.r,
//           ),
//           8.w.horizontalSpace,
//           Flexible(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AutoSizeTextWidget(
//                   text: widget.data.productName.toString(),
//                   maxLines: 2,
//                   fontSize: 10.8.sp,
//                   minFontSize: 10,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 8.h.verticalSpace,
//                 ColorAndSizeDesignForCartCardWidget(
//                   id: widget.data.id,
//                   productId: widget.data.productId!,
//                   sizeId: widget.data.sizeId,
//                   colorId: widget.data.colorId,
//                   colorHex: widget.data.colorHex!,
//                   colorName: widget.data.colorName.toString(),
//                   sizeName: widget.data.sizeName.toString(),
//                   quantity: widget.data.quantity!,
//                   onSuccess: () {
//                     setState(() {
//                       widget.data =
//                           widget.data.updateCartProduct(cartState.data);
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 8.h.verticalSpace,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Flexible(
//                       child: PriceAndCurrencyWidget(
//                         price: (double.parse(widget.data.price.toString()) *
//                                 widget.data.quantity!)
//                             .toString(),
//                       ),
//                     ),
//                     4.w.horizontalSpace,
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           child: SvgPicture.asset(
//                             widget.data.quantity! <= 1
//                                 ? AppIcons.cartDelete
//                                 : AppIcons.cartMinus,
//                             height: 15.h,
//                           ),
//                           onTap: () {
//                             setState(() => loadingId = widget.data.id);
//                             if (widget.data.quantity! <= 1) {
//                               cartStateNotifier.deleteAProductFromTheCart(
//                                 id: widget.data.id,
//                               );
//                               setState(() => delete = true);
//                             } else {
//                               cartStateNotifier.updateCart(
//                                 id: widget.data.id,
//                                 prodectId: widget.data.productId!,
//                                 colorId: widget.data.colorId,
//                                 sizeId: widget.data.sizeId!,
//                                 price: widget.data.price.toString(),
//                                 quantity: widget.data.quantity! - 1,
//                               );
//                             }
//                           },
//                         ),
//                         CheckStateInPostApiDataWidget(
//                           state: cartState,
//                           hasMessageSuccess: false,
//                           functionSuccess: () {
//                             setState(() {
//                               loadingId = null;
//                               if (delete == true) {
//                                 widget.onDelete();
//                                 isChecked = false;
//                               } else {
//                                 // تحديث المنتج في الصفحة
//                                 widget.data = widget.data
//                                     .updateCartProduct(cartState.data);
//                                 //  تحديث منتج معين في ال getAllCartProvider  لحساب المجموع عند التحديد على الكل
//                                 var index = ref
//                                     .read(getAllCartProvider)
//                                     .data
//                                     .indexWhere((p) => p.id == widget.data.id);
//                                 if (index != -1) {
//                                   ref.read(getAllCartProvider).data[index] =
//                                       widget.data
//                                           .updateCartProduct(cartState.data);
//                                 }
//
//                                 if (isChecked) {
//                                   cartStateNotifier
//                                       .updateSelectedProduct(widget.data);
//                                 }
//                               }
//                             });
//                           },
//                           bottonWidget:
//                               (cartState.stateData == States.loading &&
//                                       loadingId == widget.data.id)
//                                   ? SpinKitThreeBounce(
//                                       color: AppColors.primaryColor,
//                                       size: 9.3.sp,
//                                     )
//                                   : Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 6.w),
//                                       child: AutoSizeTextWidget(
//                                         text: widget.data.quantity.toString(),
//                                         fontSize: 9.8.sp,
//                                         fontWeight: FontWeight.bold,
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                         ),
//                         InkWell(
//                           child: SvgPicture.asset(
//                             AppIcons.cartPlus,
//                             height: 15.h,
//                           ),
//                           onTap: () {
//                             cartStateNotifier.updateCart(
//                               id: widget.data.id,
//                               prodectId: widget.data.productId!,
//                               colorId: widget.data.colorId,
//                               sizeId: widget.data.sizeId!,
//                               price: widget.data.price.toString(),
//                               quantity: widget.data.quantity! + 1,
//                             );
//
//                             setState(() {
//                               loadingId = widget.data.id;
//                               delete = false;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // تأكد من استيراد الحزمة
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/online_images_widget.dart';
import '../../data/model/cart_model.dart';
import '../riverpod/cart_riverpod.dart';
import 'check_box_for_cart_products_widget.dart';
import 'color_and_size_design_for_cart_card_widget.dart';
import '../../../../../core/widgets/price_and_currency_widget.dart';

// class CartCardWidget extends ConsumerStatefulWidget {
//   CartModel data;
//   final int? loadingId; // معامل جديد لمعرفة حالة التحميل
//   final Function onDelete;
//   final Function(int) onUpdateQuantity;
//   final Function productUpdatedSuccessfully;
//
//   CartCardWidget({
//     super.key,
//     required this.data,
//     required this.loadingId,
//     required this.onDelete,
//     required this.onUpdateQuantity,
//     required this.productUpdatedSuccessfully,
//   });
//
//   @override
//   ConsumerState<CartCardWidget> createState() => _CartCardWidgetState();
// }
//
// class _CartCardWidgetState extends ConsumerState<CartCardWidget> {
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     var cartState = ref.watch(cartProvider);
//     var cartStateNotifier = ref.watch(cartProvider.notifier);
//     return Container(
//       margin: EdgeInsets.only(top: 8.h),
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//       decoration: BoxDecoration(
//         color: AppColors.whiteColor,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(.02),
//             blurRadius: 1.r,
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           CheckBoxForCartProductsWidget(
//             value: cartStateNotifier.selectedProducts
//                 .any((product) => product.id == widget.data.id),
//             onChanged: (isChecked) {
//               cartStateNotifier.toggleProductSelection(
//                 isChecked ?? false,
//                 widget.data,
//               );
//               setState(() {
//                 this.isChecked = isChecked ?? false;
//               });
//             },
//           ),
//           6.w.horizontalSpace,
//           OnlineImagesWidget(
//             imageUrl: widget.data.images.toString(),
//             size: Size(82.w, 84.h),
//             fit: BoxFit.cover,
//             borderRadius: 2.r,
//           ),
//           8.w.horizontalSpace,
//           Flexible(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AutoSizeTextWidget(
//                 text: widget.data.productName.toString(),
//                 maxLines: 2,
//                 fontSize: 10.8.sp,
//                 minFontSize: 10,
//                 fontWeight: FontWeight.w600,
//               ),
//               8.h.verticalSpace,
//               ColorAndSizeDesignForCartCardWidget(
//                 id: widget.data.id,
//                 productId: widget.data.productId!,
//                 sizeId: widget.data.sizeId,
//                 colorId: widget.data.colorId,
//                 colorHex: widget.data.colorHex!,
//                 colorName: widget.data.colorName.toString(),
//                 sizeName: widget.data.sizeName.toString(),
//                 quantity: widget.data.quantity!,
//                 onSuccess: () {
//                   setState(() {
//                     widget.data = widget.data.updateCartProduct(cartState.data);
//                     print("ddddddddddddddddddddddddddddd");
//                   });
//                   Navigator.of(context).pop();
//                 },
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Flexible(
//                     child: PriceAndCurrencyWidget(
//                       price: (double.parse(widget.data.price.toString()) *
//                               widget.data.quantity!)
//                           .toString(),
//                     ),
//                   ),
//                   4.w.horizontalSpace,
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       InkWell(
//                         child: SvgPicture.asset(
//                           widget.data.quantity! <= 1
//                               ? AppIcons.cartDelete
//                               : AppIcons.cartMinus,
//                           height: 15.h,
//                         ),
//                         onTap: () {
//                           if (widget.data.quantity! <= 1) {
//                             widget.onDelete();
//                           } else {
//                             widget.onUpdateQuantity(widget.data.quantity! - 1);
//                           }
//                         },
//                       ),
//                       (ref.watch(cartProvider).stateData == States.loading &&
//                               widget.loadingId == widget.data.id)
//                           ? SpinKitThreeBounce(
//                               color: AppColors.primaryColor,
//                               size: 9.3.sp,
//                             )
//                           : Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 6.w),
//                               child: AutoSizeTextWidget(
//                                 text: widget.data.quantity.toString(),
//                                 fontSize: 9.8.sp,
//                                 fontWeight: FontWeight.bold,
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                       InkWell(
//                         child: SvgPicture.asset(
//                           AppIcons.cartPlus,
//                           height: 15.h,
//                         ),
//                         onTap: () {
//                           widget.onUpdateQuantity(widget.data.quantity! + 1);
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }

class CartCardWidget extends ConsumerWidget {
  final int productId;
  final int? loadingId;
  final Function onDelete;
  final Function(int) onUpdateQuantity;

  const CartCardWidget({
    super.key,
    required this.productId,
    required this.loadingId,
    required this.onDelete,
    required this.onUpdateQuantity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartProductState = ref.watch(cartProductProvider(productId));
    var cartStateNotifier = ref.watch(cartProvider.notifier);

    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.02),
            blurRadius: 1.r,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CheckBoxForCartProductsWidget(
            value: cartStateNotifier.selectedProducts
                .any((product) => product.id == cartProductState.id),
            onChanged: (isChecked) {
              cartStateNotifier.toggleProductSelection(
                isChecked ?? false,
                cartProductState,
              );
            },
          ),
          6.w.horizontalSpace,
          OnlineImagesWidget(
            imageUrl: cartProductState.images.toString(),
            size: Size(82.w, 84.h),
            fit: BoxFit.cover,
            borderRadius: 2.r,
          ),
          8.w.horizontalSpace,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeTextWidget(
                  text: cartProductState.productName.toString(),
                  maxLines: 2,
                  fontSize: 10.8.sp,
                  minFontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
                8.h.verticalSpace,
                ColorAndSizeDesignForCartCardWidget(
                  id: cartProductState.id,
                  productId: cartProductState.productId!,
                  sizeId: cartProductState.sizeId,
                  colorId: cartProductState.colorId,
                  colorHex: cartProductState.colorHex!,
                  colorName: cartProductState.colorName.toString(),
                  sizeName: cartProductState.sizeName.toString(),
                  quantity: cartProductState.quantity!,
                  onSuccess: () {
                    ref
                        .read(cartProductProvider(productId).notifier)
                        .updateProduct(
                          cartProductState
                              .updateCartProduct(ref.read(cartProvider).data),
                        );
                    if (cartStateNotifier.selectedProducts
                        .any((product) => product.id == cartProductState.id)) {
                      cartStateNotifier.updateSelectedProduct(cartProductState
                          .updateCartProduct(ref.read(cartProvider).data));
                    }
                    Navigator.of(context).pop();
                  },
                ),
                8.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: PriceAndCurrencyWidget(
                        price:
                            (double.parse(cartProductState.price.toString()) *
                                    cartProductState.quantity!)
                                .toString(),
                      ),
                    ),
                    4.w.horizontalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: SvgPicture.asset(
                            cartProductState.quantity! <= 1
                                ? AppIcons.cartDelete
                                : AppIcons.cartMinus,
                            height: 15.h,
                          ),
                          onTap: () {
                            if (cartProductState.quantity! <= 1) {
                              onDelete();
                            } else {
                              onUpdateQuantity(cartProductState.quantity! - 1);
                            }
                          },
                        ),
                        (ref.watch(cartProvider).stateData == States.loading &&
                                loadingId == cartProductState.id)
                            ? SpinKitThreeBounce(
                                color: AppColors.primaryColor,
                                size: 9.3.sp,
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: AutoSizeTextWidget(
                                  text: cartProductState.quantity.toString(),
                                  fontSize: 9.8.sp,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                        InkWell(
                          child: SvgPicture.asset(
                            AppIcons.cartPlus,
                            height: 15.h,
                          ),
                          onTap: () {
                            onUpdateQuantity(cartProductState.quantity! + 1);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
