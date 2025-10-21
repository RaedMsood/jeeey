import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import 'package:jeeey/core/widgets/buttons/icon_button_widget.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/bottomNavbar/bottom_navigation_bar_widget.dart';
import '../../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../../services/firebase/deep_link_services.dart';
import '../../../search_product/presntation/page/search_page.dart';

class AppBarWithTabBarOfDetailsWidget extends StatelessWidget {
  AppBarWithTabBarOfDetailsWidget(
      {super.key,
      required this.tabController,
      required this.pageController,
      required this.descriptionForShare,
      required this.idProductForShare,
      required this.imageForShare,
      required this.nameForShare,
      required this.price});

  final String nameForShare;
  final String descriptionForShare;
  final String imageForShare;
  final int idProductForShare;
  final String price;
  late PageController pageController;
  late TabController tabController;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 0.0,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryColor,
                size: 19.sp,
              ),
            ),
          ),
          leadingWidth: 34.w,
          title: InkWell(
            onTap: () {
              navigateTo(
                  context,
                  SearchPage(
                    hintTextSearch: "",
                  ));
            },
            child: Container(
              height: 28.h,
              width: double.infinity,
              color: AppColors.scaffoldColor,
              child: Row(
                children: [
                  Container(
                    height: 24.h,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: InkWellButtonWidget(
                      icon: AppIcons.search,
                      iconColor: AppColors.primaryColor,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: AutoSizeTextWidget(
                      text: "البحث",
                      colorText: AppColors.primaryColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  6.w.horizontalSpace,
                ],
              ),
            ),
          ),
          actions: [
            12.horizontalSpace,
            InkWellButtonWidget(
              icon: AppIcons.sharing,
              height: 20.h,
              onPressed: () {
                DynamicLinkService.shareProduct(
                  context,
                  nameForShare,
                  descriptionForShare,
                  idProductForShare,
                  imageForShare,
                  price,
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return IconButtonWidget(
                  icon: AppIcons.cartActive,
                  height: 20.h,
                  onPressed: () {
                    ref.read(activeIndexProvider.notifier).state = 2;
                    navigateTo(context, const BottomNavigationBarWidget());
                  },
                );
              },
            ),
          ],
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 40.h,
          alignment: Alignment.center,
          child: TabBar(
            controller: tabController,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoKufi',
                color: AppColors.primaryColor),
            labelColor: AppColors.primaryColor,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 1.6, color: AppColors.primaryColor),
              insets: EdgeInsets.symmetric(vertical: 10),
            ),
            isScrollable: true,
            dividerHeight: 0,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 33.sp),
            tabAlignment: TabAlignment.center,
            tabs: const [
              Tab(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "السلع",
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "التعليقات",
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "التوصية",
                  ),
                ),
              ),
            ],
            onTap: (index) {
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
          ),
        ),
      ],
    );
  }
}
