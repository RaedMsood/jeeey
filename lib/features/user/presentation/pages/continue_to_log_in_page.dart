import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/default_button.dart';
import '../../../../generated/l10n.dart';
import '../widgets/app_bar_to_user_widget.dart';
import '../widgets/exclusive_discount_and_benefits_widget.dart';
import '../widgets/input_password_widget.dart';
import '../widgets/receive_newsletters_widget.dart';
import '../widgets/view_email_widget.dart';
import 'forget_password_page.dart';

class ContinueToLogInPage extends StatefulWidget {
  const ContinueToLogInPage({super.key});

  @override
  State<ContinueToLogInPage> createState() => _ContinueToLogInPageState();
}

class _ContinueToLogInPageState extends State<ContinueToLogInPage> {
  TextEditingController passwordController = TextEditingController();
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
              InputPasswordWidget(
                title: S.of(context).password,
                validator: S.of(context).pleaseEnterYourPassword,
                passwordController: passwordController,
              ),
              2.5.h.verticalSpace,

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(context, ForgetPasswordPage());
                    },
                    child: AutoSizeTextWidget(
                      text: S.of(context).forgotYourPassword,
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
              const ReceiveNewslettersWidget(),

              DefaultButtonWidget(
                text: S.of(context).logIn,
                height: 42.h,
                textSize: 13.sp,
                onPressed: () {
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {}
                },
              ),
              14.h.verticalSpace,

              /// Class Exclusive Discount And Benefits Widget
              const ExclusiveDiscountAndBenefitsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
