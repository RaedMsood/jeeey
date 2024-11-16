import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/core/widgets/buttons/default_button.dart';
import 'package:jeeey/core/widgets/buttons/icon_button_widget.dart';
import 'package:jeeey/core/widgets/text_form_field.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../widgets/continue_with_google_or_facebook_widget.dart';
import '../widgets/exclusive_discount_and_benefits_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController phoneNumberOrEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 34.h,
        leading: const IconButtonWidget(
          icon: AppIcons.arrowBack,
          iconColor: AppColors.primaryColor,
        ),
      ),
      body: SingleChildScrollView(
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
            ),
            12.h.verticalSpace,

            DefaultButtonWidget(
              text: S.of(context).following,
              height: 42.h,
              textSize: 13.sp,
              onPressed: () {},
            ),
            22.h.verticalSpace,

            /// Class Continue To Google Or Facebook Widget
            ContinueWithGoogleOrFacebookWidget(),
          ],
        ),
      ),
    );
  }
}
