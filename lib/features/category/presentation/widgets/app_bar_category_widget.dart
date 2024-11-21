import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../home/presentation/widgets/app_bar_home_widget.dart';

AppBar appBarCategoryWidget({
  required TabController tabController,
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
          InkWellButtonWidget(
            icon: AppIcons.camera,
            height: 12.5.h,
            iconColor: Colors.black,
            onPressed: () {},
          ),
          4.w.horizontalSpace,
          Container(
            height: 24.h,
            // margin: EdgeInsets.all(1.5.sp),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.5.h),
            color: Colors.black,
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
      iconColor: Colors.black,
      onPressed: (){

      },
    ),
    actions: [
      IconButtonWidget(
        icon: AppIcons.wishlist,
        iconColor: Colors.black,
        onPressed: () {},
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(34.h),
      child: TabBar(
        controller: tabController,
        indicatorWeight: 4.0,
        isScrollable: true,
        tabs: categories.map((category) {
          return Tab(text: category);
        }).toList(),
      ),
    ),
  );
}
