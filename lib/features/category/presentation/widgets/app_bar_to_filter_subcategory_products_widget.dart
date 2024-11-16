import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import 'list_for_row_card_subcategories_widget.dart';

SliverAppBar appBarToFilterSubcategoryProductsWidget({
  required int viewType,
  required Widget flexibleSpace,
  required PreferredSize bottom,

}) {
  return SliverAppBar(
    backgroundColor: Colors.white,
    expandedHeight: viewType == 1 ? 140.h : 155.h,
    elevation: 0,
    pinned: true,
    titleSpacing: 0.w,
    automaticallyImplyLeading: false,
    surfaceTintColor: Colors.white,
    title: Container(
      height: 28.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          4.w.horizontalSpace,
          Expanded(
            child: AutoSizeTextWidget(
              text: "جاكيت",
              fontSize: 12.sp,
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
            margin: EdgeInsets.all(1.5.sp),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.5.h),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(14.sp)),
            child: InkWellButtonWidget(
              icon: AppIcons.search,
              iconColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
    leading: const IconButtonWidget(
      icon: AppIcons.arrowBack,
    ),
    actions: [
      8.w.horizontalSpace,
      InkWellButtonWidget(
        icon: AppIcons.showRow,
        iconColor: Colors.black,
        onPressed: () {},
      ),
      IconButtonWidget(
        icon: AppIcons.wishlist,
        iconColor: Colors.black,
        onPressed: () {},
      ),
    ],
    bottom: bottom,
    flexibleSpace: FlexibleSpaceBar(
      background: Padding(
        padding: EdgeInsets.only(top: 68.h),
        child: flexibleSpace,
      ),
    ),
  );
}
