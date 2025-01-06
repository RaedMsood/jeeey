import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/show_modal_bottom_sheet_widget.dart';
import '../../../../../generated/l10n.dart';
import 'bottom_sheet_design_for_order_confirmation_addresses_widget.dart';
import 'dashed_border_painter_widget.dart';
import 'required_inputs_widget.dart';

class AddressToConfirmTheOrderWidget extends StatelessWidget {
  final FormGroup form;

  const AddressToConfirmTheOrderWidget({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredInputsWidget(
          form: form,
          value: 'address',
          requiredText: S.of(context).addressIsRequired,
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
          child: InkWell(
            child: Column(
              children: [
                CustomPaint(
                  painter: DashedBorderPainterWidget(),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(12.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeTextWidget(
                          text: form.control('address').invalid
                              ? S.of(context).address
                              : form.control('address').value,
                        ),
                        2.w.horizontalSpace,
                        SvgPicture.asset(
                          AppIcons.addNewAddress,
                          height: 18.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              showModalBottomSheetWidget(
                backgroundColor: Colors.transparent,
                context: context,
                page: BottomSheetDesignForOrderConfirmationAddressesWidget(
                  form: form,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
