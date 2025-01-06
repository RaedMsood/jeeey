import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/shoppingBag/confirmOrder/presentation/riverpod/confirm_order_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../address/data/model/address_model.dart';
import '../../../../address/presentation/pages/add_or_update_an_address_page.dart';
import 'list_of_addresses_to_confirm_the_order_widget.dart';

class BottomSheetDesignForOrderConfirmationAddressesWidget
    extends ConsumerWidget {
  final FormGroup form;

  const BottomSheetDesignForOrderConfirmationAddressesWidget({
    super.key,
    required this.form,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 140.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeTextWidget(
                text: S.of(context).yourAddress,
                fontWeight: FontWeight.w600,
              ),
              InkWellButtonWidget(
                icon: AppIcons.close,
                height: 16.5.r,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          ListOfAddressesToConfirmTheOrderWidget(
            form: form,
          ),
          DefaultButtonWidget(
            text: S.of(context).addANewAddress,
            textSize: 13.5.sp,
            onPressed: () {
              navigateTo(
                  context,
                  AddANewAddressPage(
                    address: AddressModel.empty(),
                    onSuccess: () {
                      ref.refresh(getConfirmOrderDataProvider);
                      Navigator.of(context).pop();
                    },
                    locationIsEmpty: true,
                  ));
            },
          ),
        ],
      ),
    );
  }
}
