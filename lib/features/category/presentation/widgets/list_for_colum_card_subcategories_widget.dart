import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/category/data/model/category_data.dart';
import 'package:jeeey/features/home/presentation/widgets/app_bar_home_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../productManagement/filterProducts/presentation/state_mangment/riverpod.dart';
import 'circle_card_for_categories_widget.dart';
import 'list_to_display_categories_on_the_home_widget.dart';
import 'colum_rectangular_card_for_categories_widget.dart';

class ListForColumCardSubcategoriesWidget extends ConsumerWidget {
  final List<CategoryData> category;
  final int parentIdCategory;
  final String nameSearch;

  ListForColumCardSubcategoriesWidget(
      {super.key,
      required this.parentIdCategory,
      required this.category,
      required this.nameSearch});

  bool oneOfSubCategoryHasChild = false;

  @override
  Widget build(BuildContext context, ref) {
    return category.isNotEmpty == true
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            itemCount: category.length,
            itemBuilder: (context, index) {
              for (int i = 0; i <= category.length;) {
                if (category[i].hasChildren == true) {
                  print(category[i].hasChildren);
                  oneOfSubCategoryHasChild = true;
                }
                break;
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // viewType == 1
                  oneOfSubCategoryHasChild == true
                      ? CircleCardForCategoriesWidget(
                          idCategory: category[index].id!,
                          circularRadius: 30.sp,
                          name: category[index].name!,
                          image: category[index].image!,
                        )
                      : RectangularCardForCategoriesWidget(
                          idCategory: category[index].id!,
                          image: category[index].image!,
                          name: category[index].name!,
                          parentIdCategory: parentIdCategory,
                    nameSearch: nameSearch,
                        ),
                  4.w.horizontalSpace,
                ],
              );
            },
          )
        : SizedBox();
    // return   Wrap(
    //   spacing: 10.w,
    //   runSpacing: 8.h,
    //   children: category.map((item) {
    //     final selectedCategory= ref.watch(selectedCategoryProvider(item.id!));
    //     final isSelected = selectedCategory == item.id; // تحديد العنصر المختار
    //
    //     return InkWell(
    //       onTap: () {
    //
    //
    //         final isSelected = selectedCategory == item.id;
    //
    //         ref
    //             .read(selectedCategoryProvider(
    //             item.id!)
    //             .notifier)
    //             .selectCategory(item.id!);
    //         print(item.id!);
    //         print(ref.read(
    //             selectedCategoryProvider(item.id!)));
    //         ref
    //             .read(filterProductProvider.notifier)
    //             .getProductOfFilter(
    //           idSize: ref.read(selectedSizesProvider(
    //               item.id!)),
    //           idColor: ref.read(selectedColorsProvider(
    //               item.id!)),
    //           idSubCategory: ref.read(
    //               selectedCategoryProvider(
    //                   item.id!)),
    //           price: ref.read(selectedPriceProvider(
    //               item.id!)),
    //           idCategory: item.id!,
    //           //nameSearch:isSearchFilter? nameSearch:''
    //         );
    //
    //       },
    //       child: Container(
    //         padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
    //         decoration: BoxDecoration(
    //           color: isSelected
    //               ? AppColors.primaryColor.withOpacity(0.2)
    //               : AppColors.whiteColor,
    //           border: Border.all(
    //             color: isSelected
    //                 ? AppColors.primaryColor
    //                 : AppColors.fontColor,
    //             width: isSelected ? 1.5.r : 0.1.r,
    //           ),
    //         ),
    //         child: AutoSizeTextWidget(
    //           text: item.name!,
    //           colorText: isSelected
    //               ? AppColors.primaryColor
    //               : AppColors.fontColor,
    //           fontSize: 10.sp,
    //           fontWeight: FontWeight.w500,
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     );
    //   }).toList(),
    // );
  }
}
