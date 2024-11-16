import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../generated/l10n.dart';

AppBar appBarRecommendWidget({
  required BuildContext context
}){

  return  AppBar(
    titleSpacing: 0,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    title: AutoSizeTextWidget(
      text: S.of(context).recommend,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    leading: const IconButtonWidget(
      icon: AppIcons.arrowBack,
      iconColor: AppColors.primaryColor,
    ),
    actions: [
      8.w.horizontalSpace,
      IconButtonWidget(
        icon: AppIcons.search,
        iconColor: AppColors.primaryColor,
        height: 18.h,
        onPressed: () {},
      ),
      InkWellButtonWidget(
        icon: AppIcons.showRow,
        iconColor: AppColors.primaryColor,
        onPressed: () {},
      ),
      IconButtonWidget(
        icon: AppIcons.wishlist,
        iconColor: AppColors.primaryColor,
        onPressed: () {},
      ),
    ],
  );
}