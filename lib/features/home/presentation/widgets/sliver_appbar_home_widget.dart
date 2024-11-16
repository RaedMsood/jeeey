import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/theme/app_colors.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../core/widgets/online_images_widget.dart';
import 'carousel_slider_for_offers_widget.dart';

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

SliverAppBar sliverAppBarHomeWidget({
  required double expandedHeight,
  required Color iconColor,
  required String image,
  required Function(int index, CarouselPageChangedReason reason)? onPageChanged,
}) {
  return SliverAppBar(
    expandedHeight: expandedHeight,
    backgroundColor: Colors.white,
    elevation: 0,
    pinned: true,
    titleSpacing: 6.w,
    leadingWidth: 62.w,
    collapsedHeight: 60.h,
    title: Container(
      height: 24.h,
      width: double.infinity,
      color: Colors.white54,
      child: Row(
        children: [
          4.w.horizontalSpace,
          Expanded(
            child: AutoSizeTextWidget(
              text: "جاكيت",
              colorText: iconColor == Colors.black
                  ? AppColors.greySwatch.shade600
                  : Colors.white,
              fontSize: 12.sp,
            ),
          ),
          InkWellButtonWidget(
            icon: AppIcons.camera,
            height: 12.5.h,
            iconColor: iconColor == Colors.black
                ? AppColors.greySwatch.shade600
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
                  iconColor == Colors.black ? Colors.white : Colors.black,
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
    bottom: iconColor == Colors.black
        ? PreferredSize(
            preferredSize: Size.fromHeight(20.h),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    unselectedLabelStyle: TextStyle(color: iconColor),
                    labelColor: iconColor,
                    dividerHeight: 0.001,
                    unselectedLabelColor: iconColor,
                    tabAlignment: TabAlignment.start,
                    // controller: _tabController,
                    isScrollable: true,
                    tabs: categories.map((category) {
                      return Tab(text: category);
                    }).toList(),
                  ),
                ),
                Container(
                    width: 1.w,
                    height: 20.h,
                    color: AppColors.greySwatch.shade50.withOpacity(0.5)),
                8.w.horizontalSpace,
                InkWellButtonWidget(
                  icon: AppIcons.menu,
                  height: 21.h,
                  iconColor:
                      iconColor == Colors.black ? Colors.black : Colors.white,
                  onPressed: () {},
                ),
                14.w.horizontalSpace,
              ],
            ),
          )
        : PreferredSize(
            preferredSize: Size.fromHeight(0.h),
            child: SizedBox.shrink(),
          ),
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          OnlineImagesWidget(
            imageUrl: image,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              PreferredSize(
                preferredSize: Size.fromHeight(20.h),
                child: AnimatedContainer(
                  margin: EdgeInsets.only(
                    top: 60.h,
                  ),
                  duration: const Duration(seconds: 2),
                  alignment: const AlignmentDirectional(1, 1),
                  curve: Curves.easeOutQuint,
                  child: Row(
                    children: [
                      Expanded(
                        child: TabBar(
                          unselectedLabelStyle: TextStyle(color: iconColor),
                          labelColor: iconColor,
                          dividerHeight: 0.001,
                          unselectedLabelColor: iconColor,
                          tabAlignment: TabAlignment.start,
                          // controller: _tabController,
                          isScrollable: true,
                          tabs: categories.map((category) {
                            return Tab(text: category);
                          }).toList(),
                        ),
                      ),
                      Container(
                          width: 1.w,
                          height: 20.h,
                          color: AppColors.greySwatch.shade50.withOpacity(0.5)),
                      8.w.horizontalSpace,
                      InkWellButtonWidget(
                        icon: AppIcons.menu,
                        height: 21.h,
                        iconColor: iconColor == Colors.black
                            ? Colors.black
                            : Colors.white,
                        onPressed: () {},
                      ),
                      14.w.horizontalSpace,
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CarouselSliderForOffersWidget(
                  onPageChanged: onPageChanged,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

class SliverAppBarHomeWidget extends SliverPersistentHeaderDelegate {
  late double expandedHeight;
  final Color iconColor;
  final String image;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  SliverAppBarHomeWidget({
    required this.expandedHeight,
    required this.iconColor,
    required this.image,
    required this.onPageChanged,
  });

  late double hide = 0;
  late double height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (expandedHeight != 93.h) {
      hide = shrinkOffset / expandedHeight;
      height = expandedHeight / (shrinkOffset + 1);
    } else {
      hide = 0;
      height = expandedHeight;
    }
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: expandedHeight,
          backgroundColor: Colors.white,
          // toolbarHeight: 100,
          elevation: 0,
          pinned: true,
          automaticallyImplyLeading: false,
          titleSpacing: 6.w,
          leadingWidth: 62.w,
          title: Container(
            height: 24.h,
            width: double.infinity,
            color: hide < .1 ? Colors.white54 : AppColors.greySwatch.shade100,
            child: Row(
              children: [
                4.w.horizontalSpace,
                Expanded(
                  child: AutoSizeTextWidget(
                    text: "جاكيت",
                    colorText: hide < .1
                        ? Colors.white
                        : AppColors.greySwatch.shade600,
                    fontSize: 12.sp,
                  ),
                ),
                InkWellButtonWidget(
                  icon: AppIcons.camera,
                  height: 12.5.h,
                  iconColor:
                      hide > .1 ? AppColors.greySwatch.shade600 : Colors.white,
                  onPressed: () {},
                ),
                6.w.horizontalSpace,
                Container(
                  height: 24.h,
                  color: hide > .1 ? Colors.white : Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: InkWellButtonWidget(
                    icon: AppIcons.search,
                    iconColor: hide < .1 ? Colors.white : Colors.black,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              8.w.horizontalSpace,
              Expanded(
                child: InkWellButtonWidget(
                  icon: AppIcons.message,
                  iconColor: hide < .1 ? Colors.white : Colors.black,
                  onPressed: () {},
                ),
              ),
              4.w.horizontalSpace,
              Expanded(
                child: InkWellButtonWidget(
                  icon: AppIcons.calender,
                  iconColor: hide < .1 ? Colors.white : Colors.black,
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
                  iconColor: hide < .1 ? Colors.white : Colors.black,
                  onPressed: () {},
                ),
                8.w.horizontalSpace,
              ],
            ),
          ],

          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                hide > .1
                    ? SizedBox.shrink()
                    : OnlineImagesWidget(
                        imageUrl: image,
                        fit: BoxFit.fill,
                      ),
                Column(
                  children: [
                    PreferredSize(
                      preferredSize: Size.fromHeight(20.h),
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(
                          top: 60.h,
                        ),
                        duration: const Duration(seconds: 2),
                        alignment: const AlignmentDirectional(1, 1),
                        curve: Curves.easeOutQuint,
                        child: Row(
                          children: [
                            Expanded(
                              child: TabBar(
                                unselectedLabelStyle:
                                    TextStyle(color: iconColor),
                                labelColor:
                                    hide < .1 ? Colors.white : Colors.black,
                                dividerHeight: 0.001,
                                unselectedLabelColor:
                                    hide < .1 ? Colors.white : Colors.black,
                                tabAlignment: TabAlignment.start,
                                // controller: _tabController,
                                isScrollable: true,
                                tabs: categories.map((category) {
                                  return Tab(text: category);
                                }).toList(),
                              ),
                            ),
                            Container(
                                width: 1.4.w,
                                height: 20.h,
                                color: AppColors.greySwatch.shade300
                                    .withOpacity(0.5)),
                            8.w.horizontalSpace,
                            InkWellButtonWidget(
                              icon: AppIcons.menu,
                              height: 21.h,
                              iconColor:
                                  hide < .1 ? Colors.white : Colors.black,
                              onPressed: () {},
                            ),
                            8.w.horizontalSpace,
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CarouselSliderForOffersWidget(
                        onPageChanged: onPageChanged,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 56.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
