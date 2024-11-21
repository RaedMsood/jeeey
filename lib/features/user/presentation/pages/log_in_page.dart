import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/default_button.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../widgets/app_bar_to_user_widget.dart';
import '../widgets/continue_with_google_or_facebook_widget.dart';
import '../widgets/exclusive_discount_and_benefits_widget.dart';
import 'continue_to_log_in_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController phoneNumberOrEmailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarToUserWidget(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: AutoSizeTextWidget(
                  text: "جي",
                  fontSize: 20.sp,
                  maxLines: 2,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AutoSizeTextWidget(
                  text: "jeeey",
                  fontSize: 16.sp,
                ),
              ),
              14.h.verticalSpace,

              /// Class Exclusive Discount And Benefits Widget
              const ExclusiveDiscountAndBenefitsWidget(),
              14.h.verticalSpace,

              AutoSizeTextWidget(
                text: S.of(context).phoneNumberOrEmail,
                fontSize: 12.4.sp,
                colorText: Colors.black87,
              ),
              6.h.verticalSpace,

              TextFormFieldWidget(
                controller: phoneNumberOrEmailController,
                borderSide: const BorderSide(
                  color: Colors.black26,
                ),
                borderSideError: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                fieldValidator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return S.of(context).pleaseEnterYourPhoneNumberOrEmail;
                  }
                },
              ),
              12.h.verticalSpace,

              DefaultButtonWidget(
                text: S.of(context).following,
                height: 42.h,
                textSize: 13.sp,
                onPressed: () {
                  final isValid = formKey.currentState!.validate();

                  if (isValid) {
                    navigateTo(context, const ContinueToLogInPage());
                  }
                },
              ),
              22.h.verticalSpace,

              /// Class Continue To Google Or Facebook Widget
              ContinueWithGoogleOrFacebookWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
