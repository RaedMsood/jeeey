import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/widgets/base_input.dart';
import '../../../../../generated/l10n.dart';
import 'general_design_for_order_confirmation_sections_widget.dart';

class RecipientsPhoneNumberWidget extends StatelessWidget {
  final String formControlName;
  final EdgeInsets? margin;
  final int max;

  const RecipientsPhoneNumberWidget({
    super.key,
    required this.formControlName,
    this.margin,
    this.max = 9,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralDesignForOrderConfirmationSectionsWidget(
      title: S.of(context).recipientsPhoneNumber,
      fontSize: 12.7.sp,
      child: BaseInputWidget(
        formControlName: formControlName,
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        borderSide: BorderSide.none,
        hintText: "967+",
        hintFontSize: 11.sp,
        contentPadding: 10.5.sp,
        prefix: Image.asset(AppImages.yemen),
        inputFormatters: [
          LengthLimitingTextInputFormatter(max),
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.phone,
        validationMessages: {
          ValidationMessage.required: (e) =>
              S.of(context).pleaseEnterTheRecipientsPhoneNumber,
          ValidationMessage.pattern: (e) => S.of(context).invalidPhoneNumber,
        },
      ),
    );
  }
}
