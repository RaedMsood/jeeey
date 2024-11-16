import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeeey/core/helpers/flash_bar_helper.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/core/widgets/buttons/icon_button_widget.dart';
import 'package:jeeey/core/widgets/text_form_field.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class InputPasswordToSignUpWidget extends StatefulWidget {
  final ValueChanged<bool> onValidationChanged;

  const InputPasswordToSignUpWidget(
      {super.key, required this.onValidationChanged});

  @override
  State<InputPasswordToSignUpWidget> createState() =>
      _InputPasswordToSignUpWidgetState();
}

class _InputPasswordToSignUpWidgetState
    extends State<InputPasswordToSignUpWidget> {
  final TextEditingController _passwordController = TextEditingController();
  bool isLengthValid = false;
  bool hasLetter = false;
  bool hasNumber = false;
  bool isFirstInput = true;
  bool isShow = true;

  void validatePassword(String password) {
    setState(() {
      isFirstInput = false;
      isLengthValid = password.length >= 8;
      hasLetter = password.contains(RegExp(r'[A-Za-z]'));
      hasNumber = password.contains(RegExp(r'[0-9]'));
      widget.onValidationChanged(isFormValid);
    });
  }

  bool get isFormValid => isLengthValid && hasLetter && hasNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormFieldWidget(
          controller: _passwordController,
          onChanged: validatePassword,
          borderSide: const BorderSide(
            color: Colors.black26,
          ),
          isPassword: isShow,
          suffixIcon: IconButtonWidget(
            onPressed: () {
              setState(() {
                isShow = !isShow;
              });
            },
            icon: isShow ? AppIcons.hidePassword : AppIcons.showPassword,
            iconColor: AppColors.primaryColor,
          ),
        ),
        6.h.verticalSpace,
        buildRequirementText(
          S.of(context).atLeast8Characters,
          isLengthValid,
        ),
        buildRequirementText(
          S.of(context).atLeastOneLetter,
          hasLetter,
        ),
        buildRequirementText(
          S.of(context).atLeastOneNumber,
          hasNumber,
        ),
      ],
    );
  }

  Widget buildRequirementText(String text, bool isValid) {
    Color color =
        isFirstInput ? Colors.black : (isValid ? Colors.green : AppColors.primarySwatch.shade600);

    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: AutoSizeTextWidget(
        text: text,
        colorText: color,
        fontSize: 10.5.sp,
      ),
    );
  }
}
