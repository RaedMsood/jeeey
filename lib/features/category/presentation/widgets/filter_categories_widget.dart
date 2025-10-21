import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import 'package:jeeey/core/widgets/skeletonizer_widget.dart';
import 'package:jeeey/features/category/presentation/widgets/skeletonizer_category_in_main_pages.dart';
import 'package:jeeey/features/home/presentation/widgets/app_bar_home_widget.dart';

import '../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../home/presentation/riverpod/sections_riverpod.dart';
import '../riverpod/category_riverpod.dart';
import 'list_of_subcategory_in_main_pages.dart';

class FilterCategoriesWidget extends ConsumerStatefulWidget {
  const FilterCategoriesWidget({super.key, required this.idSectionsCategory,});

  final int idSectionsCategory;


  @override
  ConsumerState<FilterCategoriesWidget> createState() =>
      _FilterCategoriesWidgetState();
}

class _FilterCategoriesWidgetState
    extends ConsumerState<FilterCategoriesWidget> {
  String tempCategoryName = '';
  int initialIndex =0;

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(subSectionProvider(Tuple2(widget.idSectionsCategory,1)));
    var category = state.data.sections!.isNotEmpty
        ? state.data.sections!
        .expand((section) => section.category!)
        .toList()
        : [];

    return CheckStateInGetApiDataWidget(
      state: state,
      widgetOfLoading:const SkeletonizerCategoryInMainPages(),
      widgetOfData: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(

                itemCount: category.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        initialIndex = index;
                        tempCategoryName = category[index].name!;
                      });
                    },
                    child: Container(
                      color: tempCategoryName == category[index].name! ||
                              index == 0 && initialIndex == 0
                          ? Colors.white
                          : Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (tempCategoryName == category[index].name! ||
                              index == 0 && initialIndex == 0)
                            Container(
                              height: 18.h,
                              width: 4.5.w,
                              color: AppColors.primaryColor,
                            ),
                          2.w.horizontalSpace,
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: AutoSizeTextWidget(
                                text: category[index].name!,
                                fontSize: 12.sp,
                                colorText:
                                    tempCategoryName == category[index].name! ||
                                            index == 0 && initialIndex == 0
                                        ? AppColors.primaryColor
                                        : Colors.grey[800],
                                fontWeight:
                                    tempCategoryName == category[index].name! ||
                                            index == 0 && initialIndex == 0
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                maxLines: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ListOfSubcategoryInMainPages(
              idCategory: category.isNotEmpty
                  ? category[initialIndex].id
                  : initialIndex,
            ),
          ],
        ),
      ),
    );
  }
}
