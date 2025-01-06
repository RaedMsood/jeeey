import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import 'package:jeeey/features/user/presentation/pages/log_in_page.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../services/auth/auth.dart';
import '../../../settings/presentation/pages/settings_page.dart';

class AppBarForProfileWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarForProfileWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(44.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0.0,
      title: !Auth().loggedIn
          ? InkWell(
              onTap: () {
                navigateTo(context, const LogInPage());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.sp),
                  border: Border.all(color: Colors.black, width: 0.7),
                ),
                child: AutoSizeTextWidget(
                  text: S.of(context).logIn,
                  fontSize: 12.sp,
                ),
              ),
            )
          : AutoSizeTextWidget(
              text: Auth().email,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
      actions: [
        IconButtonWidget(
          icon: AppIcons.setting,
          onPressed: () {
            navigateTo(context, const SettingsPage());
          },
        ),
      ],
    );
  }
}
