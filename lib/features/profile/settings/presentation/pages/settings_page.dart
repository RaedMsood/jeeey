import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../core/widgets/show_modal_bottom_sheet_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../services/auth/auth.dart';
import '../../../../address/presentation/pages/view_all_address_page.dart';
import '../../../../user/presentation/pages/log_in_page.dart';
import '../widgets/app_bar_for_settings_widget.dart';
import '../widgets/divider_widget.dart';
import '../widgets/list_tile_settings_widget.dart';
import '../widgets/sign_out_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForSettingsWidget(
        title: S.of(context).settings,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: Auth().loggedIn,
              child: Column(
                children: [
                  10.h.verticalSpace,
                  ListTileSettingsWidget(
                    title: S.of(context).addressBook,
                    onTap: () {
                      navigateTo(context, const ViewAllAddressPage());

                    },
                  ),
                  const DividerWidget(),
                  ListTileSettingsWidget(
                    title: S.of(context).manageMyAccount,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            10.h.verticalSpace,
            ListTileSettingsWidget(
              title: S.of(context).language,
              onTap: () {},
            ),

            Visibility(
              visible: Auth().loggedIn,
              child: Column(
                children: [
                  const DividerWidget(),
                  ListTileSettingsWidget(
                    title: S.of(context).currency,
                    onTap: () {},
                  ),
                  const DividerWidget(),
                  ListTileSettingsWidget(
                    title: S.of(context).contactPreferences,
                    onTap: () {},
                  ),
                  const DividerWidget(),
                  ListTileSettingsWidget(
                    title: S.of(context).clearCache,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            10.h.verticalSpace,
            ListTileSettingsWidget(
              title: S.of(context).privacyAndCookiePolicy,
              onTap: () {},
            ),
            const DividerWidget(),
            ListTileSettingsWidget(
              title: S.of(context).termsAndConditions,
              onTap: () {},
            ),
            const DividerWidget(),
            ListTileSettingsWidget(
              title: S.of(context).ratingAndFeedback,
              onTap: () {},
            ),
            const DividerWidget(),
            ListTileSettingsWidget(
              title: S.of(context).connectToUs,
              onTap: () {},
            ),
            const DividerWidget(),
            ListTileSettingsWidget(
              title: S.of(context).aboutJeeey,
              onTap: () {},
            ),
            14.h.verticalSpace,
            DefaultButtonWidget(
              text:!Auth().loggedIn?S.of(context).logIn: S.of(context).signOut,
              borderRadius: 0,
              background: Colors.white,
              textColor: AppColors.primarySwatch.shade600,
              height: 46.h,
              onPressed: () {
                if(!Auth().loggedIn){
                  navigateTo(context, const LogInPage());

                }else{
                  showModalBottomSheetWidget(
                    context: context,
                    page: const SignOutWidget(),
                  );
                }

              },
            ),
            14.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
