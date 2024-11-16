import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';

class FilterProductsHomeWidget extends SliverPersistentHeaderDelegate {
  FilterProductsHomeWidget();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Consumer(
      builder: (context, ref, child) {

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CategoriesFilterWidget(
                title: 'من اجلك',
                isActive: true,
                onTap: () {},
              ),
              CategoriesFilterWidget(
                title: 'مدخلات جديدة',
                isActive: false,
                onTap: () {},
              ),
              CategoriesFilterWidget(
                title: 'خصومات',
                isActive: false,
                onTap: () {
                  // provider.changeFilter(HomeCompaniesFilter.famous);
                },
              ),
              CategoriesFilterWidget(
                title: 'الأكثر مبيعا',
                isActive: false,
                onTap: () {
                  // provider.changeFilter(HomeCompaniesFilter.famous);
                },
              ),
              SizedBox(width: 21.5.w)
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 44.h;

  @override
  double get minExtent =>  44.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class CategoriesFilterWidget extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback? onTap;

  const CategoriesFilterWidget({
    super.key,
    required this.title,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 14.w),
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 4.h

        ),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xff282e3a)
              : AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        child: AutoSizeTextWidget(
          text: title,
          fontSize: 12.sp,
          colorText: isActive
              ? AppColors.whiteColor
              :  const Color(0xff282e3a) ,
        ),
      ),
    );
  }
}
