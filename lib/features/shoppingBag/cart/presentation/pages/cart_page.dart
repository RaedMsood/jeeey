import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/shoppingBag/confirmOrder/presentation/riverpod/confirm_order_riverpod.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/bottomNavbar/button_bottom_navigation_bar_design_widget.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../services/auth/auth.dart';
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

    return Scaffold(
      appBar: const AppBarCartWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (!Auth().loggedIn)
              const LoginRequiredWidget()
            else
              CheckStateInGetApiDataWidget(
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
                    // const ProductListWidget(),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: state.stateData == States.loaded && state.data.isNotEmpty
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
                          height: 33.h,
                          borderRadius: 0.0,
                          onPressed: () {
                            if (cartStateNotifier.selectedProducts.isEmpty) {
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
                          },
                        ),
                        10.w.horizontalSpace,
                        Flexible(
                          child: AutoSizeTextWidget(
                            text:
                                "${cartStateNotifier.calculateSelectedTotalPrice()} ر.ي",
                            colorText: Colors.black87,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
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
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      // 4.w.horizontalSpace,
                      CheckBoxForCartProductsWidget(
                        value:
                            cartStateNotifier.isAllProductsSelected(state.data),
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
    );
  }
}
