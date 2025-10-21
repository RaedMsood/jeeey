import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/state.dart';
import 'package:jeeey/features/category/data/model/category_data.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../state_mangment/riverpod.dart';

class ListOfFilterCategoryWidget extends ConsumerWidget {
  const ListOfFilterCategoryWidget(
      {super.key,
      required this.categoryFilter,
      required this.idCategory,
      required this.nameSearch,
      required this.isSearchFilter});

  final List<CategoryData> categoryFilter;
  final int idCategory;
  final String nameSearch;
  final bool isSearchFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider(idCategory));
    final stateFilter = ref.watch(filterProductProvider);

    return Wrap(
      spacing: 10.w,
      runSpacing: 8.h,
      children: categoryFilter.map((item) {
        final isSelected = selectedCategory == item.id;

        return InkWell(
          onTap: () {
            if (stateFilter.stateData != States.loading) {
              ref
                  .read(selectedCategoryProvider(idCategory).notifier)
                  .selectCategory(item.id!);

              ref.read(filterProductProvider.notifier).getProductOfFilter(
                    idSize: ref.read(selectedSizesProvider(idCategory)),
                    idColor: ref.read(selectedColorsProvider(idCategory)),
                    idSubCategory:
                        ref.read(selectedCategoryProvider(idCategory)) ??
                            idCategory,
                    price: ref.read(selectedPriceProvider(idCategory)),
                    idCategory: idCategory,
                    nameSearch: isSearchFilter ? nameSearch : '',
                    idUnit: ref.read(selectedUnitsProvider(idCategory)),
                  );
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor.withOpacity(0.2)
                  : AppColors.whiteColor,
              border: Border.all(
                color:
                    isSelected ? AppColors.primaryColor : AppColors.fontColor,
                width: isSelected ? 1.5.r : 0.1.r,
              ),
            ),
            child: AutoSizeTextWidget(
              text: item.name!,
              colorText:
                  isSelected ? AppColors.primaryColor : AppColors.fontColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }
}
