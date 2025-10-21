import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../riverpod/sections_riverpod.dart';
import 'package:dartz/dartz.dart';

// class FilterProductsHomeWidget extends SliverPersistentHeaderDelegate {
//   FilterProductsHomeWidget();
//
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Consumer(
//       builder: (context, ref, child) {
//
//         // return Container(
//         //   color: Colors.white,
//         //   padding: EdgeInsets.symmetric(vertical: 4.h),
//         //   child: ListView(
//         //     scrollDirection: Axis.horizontal,
//         //     children: [
//         //       CategoriesFilterWidget(
//         //         title: 'من اجلك',
//         //         isActive: true,
//         //         onTap: () {},
//         //       ),
//         //       CategoriesFilterWidget(
//         //         title: 'مدخلات جديدة',
//         //         isActive: false,
//         //         onTap: () {},
//         //       ),
//         //       CategoriesFilterWidget(
//         //         title: 'خصومات',
//         //         isActive: false,
//         //         onTap: () {
//         //           // provider.changeFilter(HomeCompaniesFilter.famous);
//         //         },
//         //       ),
//         //       CategoriesFilterWidget(
//         //         title: 'الأكثر مبيعا',
//         //         isActive: false,
//         //         onTap: () {
//         //           // provider.changeFilter(HomeCompaniesFilter.famous);
//         //         },
//         //       ),
//         //       SizedBox(width: 21.5.w)
//         //     ],
//         //   ),
//         // );
//         return TabBar(tabs: [
//           Tab(text: '',),
//           Tab(text: '',),
//           Tab(text: '',)
//         ]);
//       },
//     );
//   }
//
//   @override
//   double get maxExtent => 44.h;
//
//   @override
//   double get minExtent =>  44.h;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
class FilterProductsHomeWidget extends ConsumerStatefulWidget {
  FilterProductsHomeWidget({required this.idSection});

  final int idSection;

  @override
  ConsumerState<FilterProductsHomeWidget> createState() =>
      _FilterProductsHomeWidgetState();
}

class _FilterProductsHomeWidgetState
    extends ConsumerState<FilterProductsHomeWidget>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  // isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  controller: tabController,
                  dividerHeight: 0,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: [
                    _buildTab('من اجلك', 0),
                    _buildTab('مدخلات جديدة', 1),
                    _buildTab('خصومات', 2),
                    _buildTab('الاكثر مبيعا', 3),
                  ],
                  onTap: (index) {
                    ref
                        .read(getSectionFilterTypeProvider(widget.idSection)
                            .notifier)
                        .setSectionFilterNumber(tabController.index + 1);

                    // ref.read(
                    //     subSectionProvider(Tuple2(1, tabController.index+1)).notifier)
                    //     .updateFilter(tabController.index+1);
                  }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(String label, int index) {
    bool isSelected =
        tabController.index == index; // تحقق مما إذا كان التاب مفعلًا

    return Tab(
      child: Container(
        height: 30.h,
        padding: EdgeInsets.symmetric(horizontal: 6.sp),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.scaffoldColor,
          // التاب المفعل باللون الأحمر والباقي باللون الرمادي
          borderRadius:
              BorderRadius.circular(25.r), // إضافة زاوية دائرية للمستطيل
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              // color: isSelected ? Colors.white :const Color(0xff282e3a) , // النص داخل التاب المفعل أبيض وغير المفعل أسود
            ),
          ),
        ),
      ),
    );
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        child: AutoSizeTextWidget(
          text: title,
          fontSize: 11.sp,
          colorText: isActive ? AppColors.whiteColor : const Color(0xff282e3a),
        ),
      ),
    );
  }
}
