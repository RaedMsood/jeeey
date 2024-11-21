import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import 'horizontal_list_of_new_categories_widget.dart';
import 'show_drop_down_menu_button_for_new_categories_widget.dart';

class NewCategoriesWidget extends SliverPersistentHeaderDelegate {
  final ScrollController scrollController;

  const NewCategoriesWidget({required this.scrollController});

  @override
  double get maxExtent => 38.h;

  @override
  double get minExtent => 38.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Container(
      color: shrinkOffset == 0.0 ? Colors.transparent : Colors.white,
      padding: EdgeInsets.only(bottom: 8.h, top: 4.h),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: S.of(context).home == "الرئيسية"
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              children: [
                /// Class Horizontal List Of New Categories Widget
                const HorizontalListOfNewCategoriesWidget(),

                Container(
                  height: 38.h,
                  width: 34.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: shrinkOffset == 0.0
                            ? [
                                AppColors.scaffoldColor,
                                Colors.white10,
                              ]
                            : [
                                Colors.white,
                                Colors.white10,
                              ],
                        begin: S.of(context).home == "الرئيسية"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        end: S.of(context).home == "الرئيسية"
                            ? Alignment.centerRight
                            : Alignment.centerLeft),
                  ),
                ),
              ],
            ),
          ),
          4.w.horizontalSpace,

          /// Class show drop down menu button widget
          ShowDropDownMenuButtonForNewCategoriesWidget(
            scrollController: scrollController,
            shrinkOffset: shrinkOffset,
          ),
          8.w.horizontalSpace,
        ],
      ),
    );
  }
}

