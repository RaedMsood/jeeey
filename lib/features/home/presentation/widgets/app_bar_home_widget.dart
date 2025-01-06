import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/category/data/model/category_data.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';
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


AppBar  appBarHomeWidget ({
   TabController? tabController,
  required Color iconColor,
  required Color appBarColor,
  required List<SectionData> section,
  required PageController pageController,
}) {
  return AppBar(
    elevation: 0,
    titleSpacing: 6.w,
    leadingWidth: 62.w,
    backgroundColor: appBarColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          iconColor == const Color(0xff8a1538) ? Brightness.dark : Brightness.light,
    ),
    title: Container(
      height: 24.h,
      width: double.infinity,
      color:iconColor == const Color(0xff8a1538)?AppColors.scaffoldColor :Colors.white54,
      child: Row(
        children: [
          4.w.horizontalSpace,
          Expanded(
            child: AutoSizeTextWidget(
              text: "جاكيت",
              colorText: iconColor == const Color(0xff8a1538)
                  ? AppColors.greySwatch.shade600
                  : Colors.white,
              fontSize: 12.sp,
            ),
          ),
          InkWellButtonWidget(
            icon: AppIcons.camera,
            height: 12.5.h,
            iconColor: iconColor == const Color(0xff8a1538)
                ?const Color(0xff8a1538)
                : Colors.white,
            onPressed: () {},
          ),
          6.w.horizontalSpace,
          Container(
            height: 24.h,
            color: iconColor,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: InkWellButtonWidget(
              icon: AppIcons.search,
              iconColor:
                  iconColor ==const Color(0xff8a1538) ? Colors.white : Colors.black,
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
    leading: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        14.w.horizontalSpace,
        Expanded(
          child: InkWellButtonWidget(
            icon: AppIcons.message,
            iconColor: iconColor,
            onPressed: () {},
          ),
        ),
        4.w.horizontalSpace,
        Expanded(
          child: InkWellButtonWidget(
            icon: AppIcons.calender,
            iconColor: iconColor,
            onPressed: () {},
          ),
        ),
      ],
    ),
    actions: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWellButtonWidget(
            icon: AppIcons.wishlist,
            iconColor: iconColor,
            onPressed: () {},
          ),
          14.w.horizontalSpace,
        ],
      ),
    ],
    //bottom: tabBarWidget,
    bottom: TapBarWidget(
      tabController: tabController,
      iconColor: iconColor,
      appBarColor: appBarColor,
      sectionData: section,
      pageController: pageController,
    ),
  );
}


