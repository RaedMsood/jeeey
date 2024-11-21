import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/default_button.dart';
import '../../../../generated/l10n.dart';
import '../widgets/app_bar_to_user_widget.dart';
import '../widgets/resend_code_widget.dart';
import '../widgets/verify_pinput_widget.dart';
import 'reset_password_page.dart';

class VerifyCodePage extends StatelessWidget {
  VerifyCodePage({super.key});

  final formKey = GlobalKey<FormState>();

  TextEditingController verifyController = TextEditingController();

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
            children: [
              Image.asset(
                AppImages.logo,
              ),
              8.h.verticalSpace,

              AutoSizeTextWidget(
                text: "${S.of(context).codeHasBeenSendTo} rraed22******.com",
                fontSize: 14.5.sp,
                maxLines: 2,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
              34.h.verticalSpace,

              /// Class Pinput
              VerifyPinputWidget(
                verifyController: verifyController,
              ),
              34.h.verticalSpace,

              /// Class resend code widget
              const ResendCodeWidget(),
              34.h.verticalSpace,
              DefaultButtonWidget(
                text: S.of(context).confirm,
                height: 44.h,
                textSize: 14.sp,
                onPressed: () async {
                  final isValid = formKey.currentState!.validate();

                  if (isValid) {
                    navigateTo(context, const ResetPasswordPage());
                  }

                  // final isValid = formKey.currentState!.validate();
                  //
                  // if (isValid) {
                  //   ref.read(checkOtpProvider.notifier).checkOtp(
                  //     context,
                  //     otp: verifyController.text,
                  //     onSuccess: updateEmail == true
                  //         ? () {
                  //       ref
                  //           .read(updateMyAccountProvider.notifier)
                  //           .updateMyAccount(
                  //           context,
                  //           lat: mapController.location.latitude,
                  //           lng: mapController.location.longitude,
                  //           onSuccess: (){
                  //             Navigator.of(context).pop();
                  //             Navigator.of(context).pop();
                  //             showFlashBarSuccess(
                  //               message: 'Updated Successfully',
                  //               context: context,
                  //             );
                  //           }
                  //       );
                  //     }
                  //         : verifyCodeWhenYouForgetYourPass == true
                  //         ? () {
                  //       navigateReplacement(
                  //           context, const ResetPasswordPage());
                  //     }
                  //         : () {
                  //       ref
                  //           .read(registerProvider.notifier)
                  //           .register(
                  //         context,
                  //         lat: mapController.location.latitude,
                  //         lng: mapController.location.longitude,
                  //         onSuccess: () {
                  //           navigateAndFinish(context,
                  //               const BottomNavigationBarWidget());
                  //           ref
                  //               .read(
                  //               getAllOrdersProvider.notifier)
                  //               .getData();
                  //           showFlashBarSuccess(
                  //             message:
                  //             "Account created successfully",
                  //             context: context,
                  //           );
                  //         },
                  //       );
                  //     },
                  //   );
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
