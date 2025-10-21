import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import 'package:jeeey/core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../productManagement/search_product/presntation/page/search_page.dart';
import 'list_for_row_card_subcategories_widget.dart';

SliverAppBar appBarToFilterSubcategoryProductsWidget({
  required int viewType,
  required Widget flexibleSpace,
  required PreferredSize bottom,
  required BuildContext context,
  required String hintTextSearch,
  required int idCategory
}) {
  return SliverAppBar(
    backgroundColor: Colors.white,
    expandedHeight:viewType!=0 ?viewType == 1 ? 130.h : 155.h:0,
    // expandedHeight:viewType!=0 ?viewType == 1 ? 250.h : 265.h:0,

    elevation: 0,
    pinned: true,
    titleSpacing: 0.w,
    automaticallyImplyLeading: false,
    surfaceTintColor: Colors.white,
    title: GestureDetector(
      onTap: (){
        navigateTo(context, SearchPage(hintTextSearch: hintTextSearch,));
      },
      child: Container(
        height: 28.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color:AppColors.primaryColor),
        ),
        child: Row(
          children: [
            8.w.horizontalSpace,
            Expanded(
              child: AutoSizeTextWidget(
                text: hintTextSearch,
                fontSize: 12.sp,
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
              margin: EdgeInsets.all(1.5.sp),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.5.h),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
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
    ),
    leading: const IconButtonWidget(
      icon: AppIcons.arrowBack,
    ),
    actions: [
      8.w.horizontalSpace,
    //   InkWellButtonWidget(
    //     icon: AppIcons.showRow,
    //     iconColor: AppColors.primaryColor,
    //     onPressed: () {},
    //   ),
    //   IconButtonWidget(
    //     icon: AppIcons.wishlist,
    //     iconColor: AppColors.primaryColor,
    //     onPressed: () {},
    //   ),
     ],
    bottom: bottom,
    flexibleSpace: FlexibleSpaceBar(
      background: Padding(
        padding:  EdgeInsets.only(top: 68.0.sp),
        child: flexibleSpace,
      ),
    ),
    // flexibleSpace: FlexibleSpaceBar(
    //   background: Image.asset(
    //     //height: 180.h,
    //     'assets/images/1.jpg', // استخدم المسار الصحيح لصورتك
    //     fit: BoxFit.cover,
    //   ),
    // ),
  );
}