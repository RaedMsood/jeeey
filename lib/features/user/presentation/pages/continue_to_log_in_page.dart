import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/state/check_state_in_post_api_data_widget.dart';
import '../../../../core/state/state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/default_button.dart';
import '../../../../generated/l10n.dart';
import '../riverpod/user_riverpod.dart';
import '../widgets/app_bar_to_user_widget.dart';
import '../widgets/exclusive_discount_and_benefits_widget.dart';
import '../widgets/input_password_widget.dart';
import '../widgets/receive_newsletters_widget.dart';
import '../widgets/view_phone_ number_or_email_widget.dart';
import 'forget_password_dialog.dart';
import 'verify_code_page.dart';

class ContinueToLogInPage extends ConsumerStatefulWidget {
  const ContinueToLogInPage({super.key});

  @override
  ConsumerState<ContinueToLogInPage> createState() =>
      _ContinueToLogInPageState();
}

class _ContinueToLogInPageState extends ConsumerState<ContinueToLogInPage> {
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(checkUserProvider);
    var logInState = ref.watch(logInOrSignUpProvider);

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
              ViewPhoneNumberOrEmailWidget(
                email: state.data.input,
                title: state.data.type,
              ),
              InputPasswordWidget(
                title: S.of(context).password,
                validator: S.of(context).pleaseEnterYourPassword,
                passwordController: passwordController,
              ),
              2.5.h.verticalSpace,
              // ForgetPasswordPageDialog(
              //   phoneNumberOrEmail: state.data.input,
              //   title: state.data.type,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        ForgetPasswordPage(
                          phoneNumberOrEmail: state.data.input,
                          title: state.data.type,
                        ),
                      );
                    },
                    child: AutoSizeTextWidget(
                      text: S.of(context).forgotYourPassword,
                      fontSize: 11.2.sp,
                      colorText: AppColors.fontColor,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              10.h.verticalSpace,
              const ReceiveNewslettersWidget(),
              CheckStateInPostApiDataWidget(
                state: logInState,
                hasMessageSuccess: false,
                functionSuccess: () {
                  navigateTo(
                      context,
                      VerifyCodePage(
                        phoneNumberOrEmail: state.data.input,
                      ));
                },
                bottonWidget: DefaultButtonWidget(
                  text: S.of(context).logIn,
                  height: 42.h,
                  textSize: 13.sp,
                  isLoading: logInState.stateData == States.loading,
                  onPressed: () {
                    final isValid = formKey.currentState!.validate();
                    if (isValid) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      ref.read(logInOrSignUpProvider.notifier).logInOrSignUp(
                            name: "",
                            phoneNumberOrEmail: state.data.input,
                            password: passwordController.text,
                          );
                    }
                  },
                ),
              ),
              14.h.verticalSpace,
              const ExclusiveDiscountAndBenefitsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
