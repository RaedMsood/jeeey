import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import 'package:jeeey/core/widgets/buttons/icon_button_widget.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../services/auth/auth.dart';
import '../../../productManagement/search_product/presntation/page/search_page.dart';
import '../../../productManagement/wishlist/presentation/pages/wishlist_page.dart';
import '../../../productManagement/wishlist/presentation/riverpod/wishlist_riverpod.dart';
import '../../../user/presentation/pages/log_in_page.dart';
import '../../data/model/section_data.dart';
import 'tap_bar_widget.dart';

final List<String> categories = [
  'الكل',
  'رجالي',
  'نسائي',
  'ولادي',
  'رجالي',
  'نسائي',
  'ولادي',
  'رجالي',
  'نسائي',
  'ولادي'
];

AppBar appBarHomeWidget({TabController? tabController,
  required Color iconColor,
  required Color appBarColor,
  required List<SectionData> section,
  required PageController pageController,
  required BuildContext context}) {
  return AppBar(
    elevation: 0,
    titleSpacing: 0,
    leadingWidth: 62.w,
    backgroundColor: appBarColor,

    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: iconColor == const Color(0xff8a1538)
          ? Brightness.dark
          : Brightness.light,
    ),
    title: InkWell(
      onTap: () {
        navigateTo(context, SearchPage(hintTextSearch: ""));
      },
      child: Container(
        height: 24.h,
        width: double.infinity,
        color: iconColor == const Color(0xff8a1538)
            ? AppColors.scaffoldColor
            : Colors.white54,
        child: Row(
          children: [
            4.w.horizontalSpace,
            Expanded(
              child: AutoSizeTextWidget(
                text: "البحث",
                colorText: iconColor == AppColors.primaryColor
                    ? AppColors.greySwatch.shade600
                    : Colors.white,
                fontSize: 12.sp,
              ),
            ),
            // InkWellButtonWidget(
            //   icon: AppIcons.camera,
            //   height: 12.5.h,
            //   iconColor: iconColor == AppColors.primaryColor
            //       ?AppColors.primaryColor
            //       : Colors.white,
            //   onPressed: () {},
            // ),
            6.w.horizontalSpace,
            Container(
              height: 24.h,
              color: iconColor,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: InkWellButtonWidget(
                icon: AppIcons.search,
                iconColor: iconColor == AppColors.primaryColor
                    ? Colors.white
                    : Colors.black,
                onPressed: () {

                },
              ),
            ),
          ],
        ),
      ),
    ),
    leading: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //14.w.horizontalSpace,
        // Expanded(
        //   child: InkWellButtonWidget(
        //     icon: AppIcons.message,
        //     iconColor: iconColor,
        //     onPressed: () {},
        //   ),
        // ),
        4.w.horizontalSpace,
        // Expanded(
        //   child: InkWellButtonWidget(
        //     icon: AppIcons.calender,
        //     iconColor: iconColor,
        //     onPressed: () {},
        //   ),
        // ),
      ],
    ),
    actions: [
      Consumer(
        builder: (context, ref, child) {
          return IconButtonWidget(
            icon: AppIcons.wishlist,
            iconColor: iconColor,
            onPressed: () {
              if (!Auth().loggedIn) {
                navigateTo(context, const LogInPage());
              } else {
                ref.refresh(getAllWishesProductsProvider);
                ref.refresh(getAllListProvider);
                navigateTo(context, const WishlistPage());
              }
            },
          );
        },
      ),
    ],
    bottom: TapBarWidget(
      tabController: tabController,
      iconColor: iconColor,
      appBarColor: appBarColor,
      sectionData: section,
    ),
  );
}
