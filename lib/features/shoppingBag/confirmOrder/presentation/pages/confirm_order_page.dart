import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../../core/state/check_state_in_post_api_data_widget.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/bottomNavbar/bottom_navigation_bar_widget.dart';
import '../../../../../core/widgets/bottomNavbar/button_bottom_navigation_bar_design_widget.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../../core/widgets/text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../cart/presentation/riverpod/cart_riverpod.dart';
import '../riverpod/confirm_order_riverpod.dart';
import '../widgets/address_to_confirm_the_order_widget.dart';
import '../widgets/bill_widget.dart';
import '../widgets/general_design_for_order_confirmation_sections_widget.dart';
import '../widgets/list_of_payment_method_widget.dart';
import '../widgets/list_of_shipping_methods_widget.dart';
import '../widgets/order_confirmation_product_card_widget.dart';
import '../widgets/order_success_dialog_widget.dart';
import '../widgets/recipients_phone_number_widget.dart';
import '../widgets/required_inputs_widget.dart';

class ConfirmOrderPage extends ConsumerWidget {
  ConfirmOrderPage({super.key});

  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    var confirmOrderState = ref.watch(confirmOrderProvider);
    var getConfirmOrderDataState = ref.watch(getConfirmOrderDataProvider);

    var cartState = ref.watch(cartProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: AutoSizeTextWidget(
          text: S.of(context).confirmOrder,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButtonWidget(
          height: 22.h,
        ),
      ),
      body: CheckStateInGetApiDataWidget(
        state: getConfirmOrderDataState,
        widgetOfData: SingleChildScrollView(
          child: ReactiveFormBuilder(
            form: () => ConfirmOrderController.form.group,
            builder: (context, form, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressToConfirmTheOrderWidget(
                    form: form,
                  ),
                  const RecipientsPhoneNumberWidget(
                    formControlName: 'recipients_phone_number',
                  ),
                  RequiredInputsWidget(
                    form: form,
                    value: 'shipping_method_id',
                    requiredText: S.of(context).pleaseChoseAShippingMethod,
                  ),
                  GeneralDesignForOrderConfirmationSectionsWidget(
                    title: S.of(context).shippingMethod,
                    child: ListOfShippingMethodsWidget(
                      form: form,
                    ),
                  ),
                  RequiredInputsWidget(
                    form: form,
                    value: 'payment_method',
                    requiredText: S.of(context).pleaseChoseAPaymentMethod,
                  ),
                  GeneralDesignForOrderConfirmationSectionsWidget(
                    title: S.of(context).paymentMethod,
                    child: ListOfPaymentMethodWidget(
                      form: form,
                    ),
                  ),
                  GeneralDesignForOrderConfirmationSectionsWidget(
                    title: S.of(context).haveACouponOrDiscountVoucher,
                    fontSize: 12.8.sp,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      child: TextFormFieldWidget(
                        controller: noteController,
                        textAlign: TextAlign.center,
                        hintText: "xxx - xxx",
                        fillColor: AppColors.scaffoldColor,
                      ),
                    ),
                  ),
                  4.h.verticalSpace,
                  Column(
                    children: cartState.selectedProducts.map((items) {
                      return OrderConfirmationProductCardWidget(data: items);
                    }).toList(),
                  ),
                  BillWidget(
                    total: cartState.calculateSelectedTotalPrice(),
                    currency: cartState.selectedProducts[0].currency.toString(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: getConfirmOrderDataState.stateData == States.loaded
          ? ButtonBottomNavigationBarDesignWidget(
              child: CheckStateInPostApiDataWidget(
                state: confirmOrderState,
                hasMessageSuccess: false,
                functionSuccess: () {
                  CompleteOrder.successDialog(context, ref);
                },
                bottonWidget: DefaultButtonWidget(
                  text: S.of(context).confirmOrder,
                  height: 41.h,
                  isLoading: confirmOrderState.stateData == States.loading,
                  onPressed: () {
                    ref.read(confirmOrderProvider.notifier).confirmOrder(
                          cart: cartState.selectedProducts,
                          note: noteController.text,
                          unitPrice: cartState
                              .calculateSelectedTotalPrice()
                              .toString(),
                        );
                  },
                ),
              ),
            )
          : null,
    );
  }
}

class CompleteOrder {
  static successDialog(BuildContext context, ref) {
    showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return const Dialog(
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          child: OrderSuccessDialogWidget(),
        );
      },
    ).then((v) {
      ref.read(activeIndexProvider.notifier).state = 0;
      navigateAndFinish(context, const BottomNavigationBarWidget());
    });
  }
}
