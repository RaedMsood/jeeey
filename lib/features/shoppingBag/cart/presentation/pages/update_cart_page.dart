import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_post_api_data_widget.dart';
import 'package:jeeey/core/state/state.dart';
import '../../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../generated/l10n.dart';
import '../riverpod/cart_riverpod.dart';
import '../widgets/name_description_and_price_of_the_product_widget.dart';
import '../widgets/photo_list_widget.dart';
import '../widgets/product_colors_widget.dart';
import '../widgets/products_sizes_widget.dart';

class UpdateCartPage extends ConsumerStatefulWidget {
  final int id;
  final int productId;
  int? colorId;
  int? sizeId;
  final int quantity;
  final Function onSuccess;

  UpdateCartPage({
    super.key,
    required this.id,
    required this.productId,
    required this.quantity,
    required this.onSuccess,
    this.colorId,
    this.sizeId,
  });

  @override
  ConsumerState<UpdateCartPage> createState() => _UpdateCartPageState();
}

class _UpdateCartPageState extends ConsumerState<UpdateCartPage> {
  int mainIndex = 0;
  bool isMainInitialized = false;

  /// تحديد اللون الأساسي عند تحميل الصفحة لأول مرة
  void _initializeMainColor(data) {
    if (!isMainInitialized && data.productColors!.isNotEmpty) {
      mainIndex = data.productColors!
          .indexWhere((color) => color.colorId == widget.colorId);
      isMainInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(getProductDetailsForCartProvider(widget.productId));
    var cartState = ref.watch(cartProvider);
    return Container(
      margin: EdgeInsets.only(top: 140.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.sp),
          topRight: Radius.circular(8.sp),
        ),
      ),
      child: CheckStateInGetApiDataWidget(
          state: state,
          widgetOfLoading: Container(
            height: 40.h,
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(4.sp),
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5.w,
              ),
            ),
          ),
          widgetOfData: Consumer(
            builder: (context, ref, child) {
              _initializeMainColor(state.data);
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state.data.productColors!.isNotEmpty)
                            PhotoListWidget(
                                image: state
                                    .data.productColors![mainIndex].images!),
                          NameDescriptionAndPriceOfTheProductWidget(
                            name: state.data.name.toString(),
                            description: state.data.description.toString(),
                            price: state.data.basePrice.toString(),
                            currency: state.data.currency.toString(),
                          ),
                          if (state.data.productColors!.isNotEmpty)
                            ProductColorsWidget(
                              productsColors: state.data.productColors!,
                              colorId: widget.colorId!,
                              onSelect: (int colorId, int index) {
                                setState(() {
                                  widget.colorId = colorId;
                                  mainIndex = index;
                                });
                              },
                            ),
                          if (state.data.sizeTypeDetails!.isNotEmpty)
                            ProductsSizesWidget(
                              sizeTypeDetails: state.data.sizeTypeDetails!,
                              sizeId: widget.sizeId!,
                              onSelect: (int sizeId) {
                                setState(() {
                                  widget.sizeId = sizeId;
                                });
                              },
                            ),
                          10.h.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                  CheckStateInPostApiDataWidget(
                    state: cartState,
                    hasMessageSuccess: false,
                    functionSuccess: widget.onSuccess,
                    bottonWidget: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: DefaultButtonWidget(
                        text: S.of(context).update,
                        textSize: 13.5.sp,
                        isLoading: cartState.stateData == States.loading,
                        onPressed: () {
                          ref.read(cartProvider.notifier).updateCart(
                                id: widget.id,
                                prodectId: widget.productId,
                                colorId: widget.colorId!,
                                sizeId: widget.sizeId!,
                                quantity: widget.quantity,
                              );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
