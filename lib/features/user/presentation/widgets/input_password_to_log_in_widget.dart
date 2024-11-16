import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../generated/l10n.dart';

class InputPasswordToLogInWidget extends StatefulWidget {
  const InputPasswordToLogInWidget({super.key});

  @override
  State<InputPasswordToLogInWidget> createState() => _InputPasswordToLogInWidgetState();
}

class _InputPasswordToLogInWidgetState extends State<InputPasswordToLogInWidget> {
  final TextEditingController _passwordController = TextEditingController();

  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        6.h.verticalSpace,
        AutoSizeTextWidget(
          text: S.of(context).password,
          fontSize: 13.sp,
          colorText: Colors.black87,
        ),
        6.h.verticalSpace,
        TextFormFieldWidget(
          controller: _passwordController,
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
          fieldValidator: (value) {
            if (value == null || value.toString().isEmpty) {
              return "${S.of(context).pleaseEnter} ${S.of(context).password}";
            }
          },
        ),
      ],
    );
  }
}
