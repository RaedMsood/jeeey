import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/default_button.dart';
import '../../../../generated/l10n.dart';
import '../widgets/app_bar_to_user_widget.dart';
import '../widgets/conditions_for_input_the_password_widget.dart';
import '../widgets/input_password_widget.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isPasswordValid = false;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarToUserWidget(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.logo,
                ),
              ),
              14.h.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: AutoSizeTextWidget(
                  text: S.of(context).createANewPassword,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              18.h.verticalSpace,
              AutoSizeTextWidget(
                text: S.of(context).newPassword,
                fontSize: 13.sp,
                colorText: Colors.black87,
              ),
              6.h.verticalSpace,

              /// Class Conditions For Input The Password Widget
              ConditionsForInputThePasswordWidget(
                onValidationChanged: (isValid) {
                  setState(() {
                    isPasswordValid = isValid;
                  });
                },
              ),
              8.h.verticalSpace,

              /// Class Input Password Widget
              InputPasswordWidget(
                title: S.of(context).confirmPassword,
                validator: S.of(context).pleaseConfirmYourPassword,
                passwordController: confirmPasswordController,
              ),
              22.h.verticalSpace,
              DefaultButtonWidget(
                text: S.of(context).confirm,
                height: 43.h,
                textSize: 14.sp,
                onPressed: isPasswordValid
                    ? () {
                        final isValid = formKey.currentState!.validate();

                        if (isValid) {}
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
