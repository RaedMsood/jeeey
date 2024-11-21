import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';

AppBar appBarForRecommendationsAndDailyNews({
  required String title,
}) {
  return AppBar(
    titleSpacing: 0,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    title: AutoSizeTextWidget(
      text: title,
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
    ),
    leading: const IconButtonWidget(
      icon: AppIcons.arrowBack,
    ),
    actions: [
      8.w.horizontalSpace,
      IconButtonWidget(
        icon: AppIcons.search,
        height: 18.h,
        onPressed: () {},
      ),
      InkWellButtonWidget(
        icon: AppIcons.showRow,
        onPressed: () {},
      ),
      IconButtonWidget(
        icon: AppIcons.wishlist,
        onPressed: () {},
      ),
    ],
  );
}
