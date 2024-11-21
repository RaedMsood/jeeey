import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/bottomNavbar/bottom_navigation_bar_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';

class TapBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final Color iconColor;
  final Color appBarColor;
  final List<String> categories;

  const TapBarWidget({
    super.key,
    required this.tabController,
    required this.iconColor,
    required this.appBarColor,
    required this.categories,
  });

  @override
  Size get preferredSize => Size.fromHeight(22.h);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TabBar(
            controller: tabController,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            labelColor: iconColor,
            unselectedLabelColor: iconColor == Colors.black
                ? AppColors.fontColor
                : AppColors.greySwatch.shade100,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 1.6, color: iconColor),
              insets: const EdgeInsets.symmetric(vertical: 10),
            ),
            indicatorColor: iconColor,
            dividerHeight: 0.001,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: categories.map((category) {
              return Tab(text: category);
            }).toList(),
          ),
        ),
        Container(
          width: 1.w,
          height: 20.h,
          color: AppColors.greySwatch.shade50.withOpacity(0.6),
        ),
        Consumer(
          builder: (context, ref, child) {
            return IconButtonWidget(
              icon: AppIcons.menu,
              height: 21.h,
              iconColor:
                  iconColor == Colors.black ? Colors.black : Colors.white,
              onPressed: () {
                ref.read(activeIndexProvider.notifier).state = 1;
              },
            );
          },
        ),
      ],
    );
  }
}
