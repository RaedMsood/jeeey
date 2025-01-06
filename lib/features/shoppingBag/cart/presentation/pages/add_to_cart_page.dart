import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_post_api_data_widget.dart';
import 'package:jeeey/core/state/state.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../../generated/l10n.dart';
import '../riverpod/cart_riverpod.dart';
import '../widgets/loading_design_to_display_product_details_to_add_to_cart_widget.dart';
import '../widgets/name_description_and_price_of_the_product_widget.dart';
import '../widgets/photo_list_widget.dart';
import '../widgets/product_colors_widget.dart';
import '../widgets/products_sizes_widget.dart';

class AddToCartPage extends ConsumerStatefulWidget {
  final int productId;
  int? colorId;
  int? sizeId;

  AddToCartPage({
    super.key,
    required this.productId,
    this.colorId = 00,
    this.sizeId = 00,
  });

  @override
  ConsumerState<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends ConsumerState<AddToCartPage> {
  int mainIndex = 0;
  bool isMainInitialized = false;
  bool isSizeIdValid = false;

  /// تحديد اللون الأساسي عند تحميل الصفحة لأول مرة
  void _initializeMainColor(data) {
    if (!isMainInitialized && data.productColors!.isNotEmpty) {
      mainIndex = data.productColors!.indexWhere((color) => color.isMain == 1);
      widget.colorId = data.productColors![mainIndex].colorId;
      isMainInitialized = true;
    }
  }

  /// تحديث قيم الحجم
  void _onSizeSelected(int sizeId) {
    setState(() {
      widget.sizeId = sizeId;
      print(widget.sizeId);
      isSizeIdValid = false;
    });
  }

  /// التحقق من صحة الحجم وإضافة المنتج للسلة
  void _onAddToCart() {
    if (widget.sizeId == 0) {
      setState(() => isSizeIdValid = true);
    } else {
      ref.read(cartProvider.notifier).addToCart(
            prodectId: widget.productId,
            colorId: widget.colorId!,
            sizeId: widget.sizeId!,
            quantity: 1,
          );
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
        widgetOfLoading:
            const LoadingDesignToDisplayProductDetailsToAddToCartWidget(),
        widgetOfData: Consumer(
          builder: (context, ref, child) {
            _initializeMainColor(state.data);

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.data.productColors!.isNotEmpty)
                          PhotoListWidget(
                              image:
                                  state.data.productColors![mainIndex].images!),
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
                        if (isSizeIdValid)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                            child: AutoSizeTextWidget(
                              text: "يرجى اختيار مقاس",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              colorText: AppColors.secondarySwatch.shade500,
                            ),
                          ),
                        if (state.data.sizeTypeDetails!.isNotEmpty)
                          ProductsSizesWidget(
                            sizeTypeDetails: state.data.sizeTypeDetails!,
                            sizeId: widget.sizeId!,
                            onSelect: _onSizeSelected,
                          ),
                        10.h.verticalSpace,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      IconButtonWidget(
                        icon: AppIcons.wishlist,
                        height: 20.h,
                        onPressed: () {},
                      ),
                      4.w.horizontalSpace,
                      Expanded(
                        child: CheckStateInPostApiDataWidget(
                          state: cartState,
                          functionSuccess: () => Navigator.of(context).pop(),
                          bottonWidget: DefaultButtonWidget(
                            text: S.of(context).addToCart,
                            textSize: 13.sp,
                            isLoading: cartState.stateData == States.loading,
                            onPressed: _onAddToCart,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
