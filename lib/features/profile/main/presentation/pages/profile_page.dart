import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/app_bar_for_profile_widget.dart';
import '../widgets/coupons_points_wallet_and_gift_card_widget.dart';
import '../widgets/icon_and_title_design_widget.dart';
import '../widgets/jeeey_club_widget.dart';
import '../widgets/request_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarForProfileWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CouponsPointsWalletAndGiftCardWidget(),
            // 12.h.verticalSpace,
            // const JeeeyClubWidget(),
            const RequestWidget(),
            // Container(
            //   color: Colors.white,
            //   padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            //   alignment: Alignment.center,
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       IconAndTitleDesignWidget(
            //         title: S.of(context).support,
            //         icon: AppIcons.support,
            //         onPressed: () {},
            //       ),
            //       4.w.horizontalSpace,
            //       IconAndTitleDesignWidget(
            //         title: S.of(context).logIn,
            //         icon: AppIcons.logIn,
            //         onPressed: () {},
            //       ),
            //       IconAndTitleDesignWidget(
            //         title: S.of(context).surveyCenter,
            //         icon: AppIcons.surveyCenter,
            //         onPressed: () {},
            //       ),
            //       IconAndTitleDesignWidget(
            //         title: S.of(context).freeTrialCenter,
            //         icon: AppIcons.freeTrialCenter,
            //         onPressed: () {},
            //       ),
            //     ],
            //   ),
            // ),
            // 8.h.verticalSpace,
            // ProductListWidget(gradient: true,),
          ],
        ),
      ),
    );
  }
}
