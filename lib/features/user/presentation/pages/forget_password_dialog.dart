import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/state/check_state_in_post_api_data_widget.dart';
import '../../../../core/state/state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/default_button.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../riverpod/user_riverpod.dart';
import '../widgets/app_bar_to_user_widget.dart';
import '../widgets/view_phone_ number_or_email_widget.dart';
import 'verify_code_page.dart';

// class ForgetPasswordPageDialog extends ConsumerWidget {
//   final String phoneNumberOrEmail;
//   final String title;
//
//   const ForgetPasswordPageDialog({
//     super.key,
//     required this.phoneNumberOrEmail,
//     required this.title,
//   });
//
//   @override
//   Widget build(BuildContext context, ref) {
//     var state = ref.watch(userProvider);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         InkWell(
//           onTap: () {
//             showDialog(
//               useSafeArea: true,
//               context: context,
//               builder: (context) {
//                 return Dialog(
//                   alignment: Alignment.center,
//                   backgroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.r),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(8.sp),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         AutoSizeTextWidget(
//                           text: S.of(context).forgotYourPassword,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         ViewPhoneNumberOrEmailWidget(
//                           email: phoneNumberOrEmail,
//                           title: title,
//                           editIcon: false,
//                         ),
//                         20.h.verticalSpace,
//                         CheckStateInPostApiDataWidget(
//                           state: state,
//                           hasMessageSuccess: false,
//                           functionSuccess: () {
//                             Navigator.pop(context);
//                             navigateTo(
//                               context,
//                               VerifyCodePage(
//                                 phoneNumberOrEmail: phoneNumberOrEmail,
//                                 verifyCodeWhenYouForgetYourPass: true,
//                               ),
//                             );
//                           },
//                           bottonWidget: DefaultButtonWidget(
//                             text: S.of(context).confirm,
//                             textSize: 14.sp,
//                             isLoading: state.stateData == States.loading,
//                             onPressed: () {
//                               ref.read(userProvider.notifier).forgetPassword(
//                                     phoneNumberOrEmail: phoneNumberOrEmail,
//                                   );
//                             },
//                           ),
//                         ),
//                         4.h.verticalSpace,
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//           child: AutoSizeTextWidget(
//             text: S.of(context).forgotYourPassword,
//             fontSize: 11.2.sp,
//             colorText: AppColors.fontColor,
//             maxLines: 2,
//           ),
//         ),
//       ],
//     );
//   }
// }

class ForgetPasswordPage extends ConsumerWidget {
  final String phoneNumberOrEmail;
  final String title;

  final formKey = GlobalKey<FormState>();

  ForgetPasswordPage({
    super.key,
    required this.phoneNumberOrEmail,
    required this.title,
  });

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(userProvider);

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
              18.h.verticalSpace,
              AutoSizeTextWidget(
                text: S.of(context).forgotYourPassword,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w600,
              ),
              // 14.h.verticalSpace,
              // AutoSizeTextWidget(
              //   text: S.of(context).phoneNumberOrEmail,
              //   fontSize: 13.sp,
              //   colorText: Colors.black87,
              // ),
              // 4.h.verticalSpace,
              ViewPhoneNumberOrEmailWidget(
                email: phoneNumberOrEmail,
                title: title,
                editIcon: false,
              ),
              // TextFormFieldWidget(
              //   controller: phoneNumberOrEmail,
              //   borderSide: const BorderSide(
              //     color: Colors.black26,
              //   ),
              //   borderSideError: const BorderSide(
              //     color: AppColors.primaryColor,
              //   ),
              //   fieldValidator: (value) {
              //     if (value == null || value.toString().isEmpty) {
              //       return S.of(context).pleaseEnterYourPhoneNumberOrEmail;
              //     }
              //   },
              // ),
              24.h.verticalSpace,
              CheckStateInPostApiDataWidget(
                state: state,
                hasMessageSuccess: false,
                functionSuccess: () {
                  navigateReplacement(
                    context,
                    VerifyCodePage(
                      phoneNumberOrEmail: phoneNumberOrEmail,
                      verifyCodeWhenYouForgetYourPass: true,
                    ),
                  );
                },
                bottonWidget: DefaultButtonWidget(
                  text: S.of(context).confirm,
                  height: 43.h,
                  textSize: 14.sp,
                  isLoading: state.stateData == States.loading,
                  onPressed: () {
                    final isValid = formKey.currentState!.validate();

                    if (isValid) {
                      ref.read(userProvider.notifier).forgetPassword(
                            phoneNumberOrEmail: phoneNumberOrEmail,
                          );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
