import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/bottomNavbar/bottom_navigation_bar_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../data/model/section_data.dart';
import '../riverpod/sections_riverpod.dart';

class TapBarWidget extends ConsumerStatefulWidget implements PreferredSizeWidget {
   TabController? tabController;
  final Color iconColor;
  final Color appBarColor;
  final List<SectionData> sectionData;
  final PageController pageController;
  TapBarWidget({
    super.key,
    required this.tabController,
    required this.iconColor,
    required this.appBarColor,
     required this.sectionData,
     required this.pageController

   });

  @override
  ConsumerState<TapBarWidget> createState() => _TapBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(22.h);
}

class _TapBarWidgetState extends ConsumerState<TapBarWidget> with TickerProviderStateMixin {
  int lenghtCategory = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Size get preferredSize => Size.fromHeight(22.h);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            child: TabBar(

              controller: widget.tabController,
              labelStyle: const  TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'IBMPlexSansArabic',
                  ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'IBMPlexSansArabic',
              ),
              labelColor: widget.iconColor,
              unselectedLabelColor: widget.iconColor == const Color(0xff8a1538)
                  ? AppColors.fontColor
                  : AppColors.greySwatch.shade100,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 1.6, color: widget.iconColor),
                insets: const EdgeInsets.symmetric(vertical: 10),
              ),
              indicatorColor: widget.iconColor,
              dividerHeight: 0.001,
              isScrollable: true,
              onTap: (index) {
                widget.pageController.jumpToPage(index);
                ref.read(colorIconAppBarProvider.notifier).setColorIcon(Colors.white);
                ref.read(colorBackAppBarProvider.notifier).setColorBackGround(Colors.transparent);
                  //ref.read(sectionProvider.notifier).getSectionId();
                  //ref.read(sectionIdProvider.notifier).setSectionId(widget.sectionData[index].id!);
                 // print(ref.watch(sectionProvider.notifier).idSection);

              },

              tabs: [
               // Tab(text: "الكل",),
                ...widget.sectionData.map((category)=>Tab(text:category.name ,)),
              ],
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
                widget.iconColor == const Color(0xff8a1538) ? const Color(0xff8a1538) : Colors.white,
                onPressed: () {
                  ref
                      .read(activeIndexProvider.notifier)
                      .state = 1;
                },
              );
            },
          ),
        ],
      );
  }
}
