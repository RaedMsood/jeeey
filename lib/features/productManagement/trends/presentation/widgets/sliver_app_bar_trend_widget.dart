import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../../core/widgets/online_images_widget.dart';
import 'title_and_description_of_the_trend_widget.dart';

class SliverAppBarTrendWidget extends SliverPersistentHeaderDelegate {
  final String title;
  final String image;
  final String description;
  late double expandedHeight;

  SliverAppBarTrendWidget({
    required this.title,
    required this.image,
    required this.description,
    required this.expandedHeight,
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
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          titleSpacing: 0,
          leadingWidth: 32.w,
          automaticallyImplyLeading: false,
          pinned: false,
          floating: false,
          expandedHeight: expandedHeight,
          toolbarHeight: 44.h,
          title: Opacity(
            opacity: hide > .7
                ? 1.0
                : hide > .65
                    ? 0.5
                    : hide > .6
                        ? 0.3
                        : 0.0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              child: AutoSizeTextWidget(
                text: title,
                colorText: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          leading: IconButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const CircleBorder()),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            icon: Icon(
              Localizations.localeOf(context).languageCode == "ar"
                  ? Icons.arrow_back_ios_rounded
                  : Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 18.r,
            ),
          ),
          actions: [
            IconButtonWidget(
              icon: AppIcons.cart,
              iconColor: Colors.white,
              height: 20.r,
            ),
          ],
          flexibleSpace: Stack(
            children: [
              OnlineImagesWidget(
                imageUrl: image,
                size: Size(double.infinity, 330.h),
                borderRadius: 0,
              ),
              Container(
                height: 330.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: hide > .7
                        ? [
                            Colors.black54,
                            Colors.black54,
                          ]
                        : hide > .65
                            ? [
                                Colors.black38,
                                Colors.black38,
                              ]
                            : [
                                Colors.black45,
                                Colors.black26,
                                Colors.black12,
                                Colors.black12,
                                Colors.black12,
                                Colors.black26,
                                Colors.black38,
                                Colors.black45,
                                Colors.black54,
                                Colors.black54,
                              ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TitleAndDescriptionOfTheTrendWidget(
                      name: title,
                      description: description,
                      arrowIcon: false,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 24.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
