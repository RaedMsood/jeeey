import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';

import '../../../../../core/widgets/secondary_app_bar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/divider_widget.dart';
import '../widgets/list_tile_settings_widget.dart';
import 'change_password_page.dart';

class ManageMyAccountPage extends StatelessWidget {
  const ManageMyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBarWidget(
        title: S.of(context).manageMyAccount,
        centerTitle: false,
        fontSize: 13.4.sp,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.h.verticalSpace,
            // ListTileSettingsWidget(
            //   title: S.of(context).email,
            //   fontSize: 11.5.sp,
            //   onTap: () {},
            // ),
            // const DividerWidget(),
            // ListTileSettingsWidget(
            //   title: S.of(context).phoneNumber,
            //   fontSize: 11.5.sp,
            //   onTap: () {},
            // ),
            // const DividerWidget(),
            ListTileSettingsWidget(
              title: S.of(context).changePassword,
              fontSize: 11.5.sp,
              onTap: () {
                navigateTo(context, const ChangePasswordPage());
              },
            ),
            // const DividerWidget(),
            // ListTileSettingsWidget(
            //   title: S.of(context).deleteAccount,
            //   fontSize: 11.5.sp,
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
