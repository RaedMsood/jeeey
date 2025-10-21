import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/price_and_currency_widget.dart';
import '../../../../../core/helpers/flash_bar_helper.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/bottomNavbar/button_bottom_navigation_bar_design_widget.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../services/auth/auth.dart';
import '../../../confirmOrder/presentation/riverpod/confirm_order_riverpod.dart';
import '../riverpod/cart_riverpod.dart';
import '../widgets/app_bar_cart_widget.dart';
import '../widgets/check_box_for_cart_products_widget.dart';
import '../widgets/list_for_cart_widget.dart';
import '../../../confirmOrder/presentation/pages/confirm_order_page.dart';
import '../widgets/login_required_widget.dart';
import '../widgets/shimmer_card_widget.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(getAllCartProvider);
    var cartStateNotifier = ref.watch(cartProvider.notifier);
    var cartState = ref.watch(cartProvider);

    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () async {
        ref.refresh(getAllCartProvider);
      },
      child: Scaffold(
        appBar: AppBarCartWidget(data: state.data),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: CheckStateInGetApiDataWidget(
            state: state,
            widgetOfLoading: const ShimmerCardWidget(),
            widgetOfData: Column(
              children: [
                if (state.data.isNotEmpty)
                  const ListForCartWidget()
                else
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    child: const AutoSizeTextWidget(
                      text: "السلة فارغة",
                      colorText: Colors.black87,
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                // 8.h.verticalSpace,
                // AutoSizeTextWidget(
                //   text: S.of(context).youMayWantToFillIn,
                //   colorText: Colors.black87,
                //   fontSize: 12.5,
                //   fontWeight: FontWeight.w600,
                // ),
                // 5.h.verticalSpace,
              ],
            ),
          ),
        ),
        bottomNavigationBar: state.stateData == States.loaded &&
                state.data.isNotEmpty
            ? ButtonBottomNavigationBarDesignWidget(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          DefaultButtonWidget(
                            text: S.of(context).payment,
                            width: 86.w,
                            height: 30.h,
                            borderRadius: 0.0,
                            textSize: 11.sp,
                            onPressed: () {
                              if (!Auth().loggedIn) {
                                pressAgainToExit(
                                  context: context,
                                  text: S.of(context).loginRequired,
                                );
                              } else {
                                if (cartStateNotifier
                                    .selectedProducts.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(S
                                          .of(context)
                                          .pleaseSelectTheProductsYouWishToPayFor),
                                      backgroundColor:
                                          AppColors.secondarySwatch.shade600,
                                    ),
                                  );
                                } else {
                                  ConfirmOrderController.form.reset();
                                  navigateTo(context, ConfirmOrderPage());
                                }
                              }
                            },
                          ),
                          10.w.horizontalSpace,
                          Flexible(
                            child: PriceAndCurrencyWidget(
                              price: cartStateNotifier
                                  .calculateSelectedTotalPrice()
                                  .toString(),
                              fontSize1: 12.4.sp,
                              fontSize2: 9.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        AutoSizeTextWidget(
                          text: S.of(context).all,
                          colorText: Colors.black87,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        // 4.w.horizontalSpace,
                        CheckBoxForCartProductsWidget(
                          value: cartStateNotifier
                              .isAllProductsSelected(state.data),
                          onChanged: (isChecked) {
                            cartStateNotifier.toggleAllProductsSelection(
                              isChecked ?? false,
                              state.data,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
