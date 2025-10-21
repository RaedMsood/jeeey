import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/home/data/model/section_data.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../services/auth/auth.dart';
import '../../../productManagement/wishlist/presentation/pages/wishlist_page.dart';
import '../../../productManagement/wishlist/presentation/riverpod/wishlist_riverpod.dart';
import '../../../user/presentation/pages/log_in_page.dart';

AppBar appBarCategoryWidget({
  required TabController tabController,
  required List<SectionData> sections,
}) {
  return AppBar(
    titleSpacing: 0,
    backgroundColor: Colors.white,
    title: Container(
      height: 27.h,
      width: double.infinity,
      color: AppColors.scaffoldColor,
      child: Row(
        children: [
          4.w.horizontalSpace,
          Expanded(
            child: AutoSizeTextWidget(
              text: "البحث",
              fontSize: 12.sp,
              colorText: AppColors.fontColor,
            ),
          ),
          // InkWellButtonWidget(
          //   icon: AppIcons.camera,
          //   height: 12.5.h,
          //   iconColor: AppColors.primaryColor,
          //   onPressed: () {},
          // ),
          4.w.horizontalSpace,
          Container(
            height: 24.h,
            // margin: EdgeInsets.all(1.5.sp),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.5.h),
            color: AppColors.primaryColor,
            child: InkWellButtonWidget(
              icon: AppIcons.search,
              iconColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
    leading: IconButtonWidget(
      icon: AppIcons.message,
      iconColor: AppColors.whiteColor,
      onPressed: () {},
    ),
    actions: [
      Consumer(
        builder: (context, ref, child) {
          return IconButtonWidget(
            icon: AppIcons.wishlist,
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
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(34.h),
      child: TabBar(
        controller: tabController,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'NotoKufi',
        ),
        labelColor: AppColors.primaryColor,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 1.6, color: AppColors.primaryColor),
          insets: EdgeInsets.symmetric(vertical: 10),
        ),
        isScrollable: true,
        tabs: sections.map((section) {
          return Tab(text: section.name);
        }).toList(),
      ),
    ),
  );
}
