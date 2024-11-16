import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/default_button.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../generated/l10n.dart';
import '../widgets/exclusive_discount_and_benefits_widget.dart';
import '../widgets/input_password_to_log_in_widget.dart';
import '../widgets/input_password_to_sign_up_widget.dart';
import '../widgets/receive_newsletters_widget.dart';
import '../widgets/view_email_widget.dart';

class ContinueToLogInPage extends StatefulWidget {
  const ContinueToLogInPage({super.key});

  @override
  State<ContinueToLogInPage> createState() => _ContinueToLogInPageState();
}

class _ContinueToLogInPageState extends State<ContinueToLogInPage> {
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 36.h,
        leading: IconButtonWidget(
          icon: AppIcons.arrowBack,
          iconColor: AppColors.primaryColor,
          height: 30.h,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeTextWidget(
              text: "مرحبا بعودتك!",
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w600,
            ),
            AutoSizeTextWidget(
              text:
                  "أدخل كلمة المرور الخاصة بك لتسجيل الدخول إلى حسابك على Jeeey",
              fontSize: 12.5.sp,
              colorText: AppColors.fontColor,
              maxLines: 2,
            ),
            12.h.verticalSpace,
            AutoSizeTextWidget(
              text: S.of(context).email,
              fontSize: 13.sp,
              colorText: Colors.black87,
            ),
            6.h.verticalSpace,

            /// Class View Email Widget
            const ViewEmailWidget(
              email: "mraedsshkahs@gmail.com",
            ),

            /// Class Input Password Widget
            InputPasswordToLogInWidget(),
            2.5.h.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: AutoSizeTextWidget(
                    text:
                    "هل نسيت كلمة المرور؟",
                    fontSize: 11.2.sp,
                    colorText: AppColors.fontColor,
                    maxLines: 2,
                    // textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),

            10.h.verticalSpace,
            /// Class Receive Newsletters Widget
            ReceiveNewslettersWidget(),

            DefaultButtonWidget(
              text: S.of(context).logIn,
              height: 42.h,
              textSize: 13.sp,
              onPressed: isPasswordValid ? () {} : null,
            ),
            14.h.verticalSpace,

            /// Class Exclusive Discount And Benefits Widget
            const ExclusiveDiscountAndBenefitsWidget(),
          ],
        ),
      ),
    );
  }
}
