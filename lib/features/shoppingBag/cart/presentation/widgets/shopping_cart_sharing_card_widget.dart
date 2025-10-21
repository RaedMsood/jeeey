import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/extension/string.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/online_images_widget.dart';
import '../../data/model/cart_model.dart';
import '../riverpod/share_my_cart_riverpod.dart';
import 'check_box_for_cart_products_widget.dart';
import '../../../../../core/widgets/price_and_currency_widget.dart';

class ShoppingCartSharingCardWidget extends ConsumerStatefulWidget {
  final CartModel data;

  const ShoppingCartSharingCardWidget({super.key, required this.data});

  @override
  ConsumerState<ShoppingCartSharingCardWidget> createState() =>
      _ShoppingCartSharingCardWidgetState();
}

class _ShoppingCartSharingCardWidgetState
    extends ConsumerState<ShoppingCartSharingCardWidget> {
  @override
  Widget build(BuildContext context) {
    var shareStateNotifier = ref.watch(shareMyCartProvider.notifier);
    return Container(
      margin: EdgeInsets.only(top: 10.h),
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
            value: shareStateNotifier.selectedProducts
                .any((product) => product.id == widget.data.id),
            onChanged: (isChecked) {
              shareStateNotifier.toggleProductSelection(
                isChecked ?? false,
                widget.data,
              );
              setState(() {});
            },
          ),
          6.w.horizontalSpace,
          OnlineImagesWidget(
            imageUrl: widget.data.images.toString(),
            size: Size(88.w, 84.h),
            fit: BoxFit.cover,
            borderRadius: 2.r,
          ),
          12.w.horizontalSpace,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeTextWidget(
                  text: widget.data.productName.toString(),
                  maxLines: 2,
                  fontSize: 12.2.sp,
                  minFontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
                8.h.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.data.colorHex!.isNotEmpty
                          ? CircleAvatar(
                              backgroundColor: widget.data.colorHex!.toColor(),
                              radius: 5.r,
                            )
                          : const SizedBox.shrink(),
                      6.w.horizontalSpace,
                      Flexible(
                        child: AutoSizeTextWidget(
                          text: widget.data.colorName!.isNotEmpty
                              ? "${widget.data.colorName.toString()}  /  ${widget.data.sizeName.toString()}"
                              : widget.data.sizeName.toString(),
                          colorText: AppColors.fontColor,
                          fontSize: 10.5.sp,
                          maxLines: 2,
                        ),
                      ),
                      2.w.horizontalSpace,
                    ],
                  ),
                ),
                8.h.verticalSpace,
                PriceAndCurrencyWidget(
                  price: (double.parse(widget.data.price.toString()) *
                          widget.data.quantity!)
                      .toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
