import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/size_data.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../state_mangment/riverpod.dart';

class ListOfUnitInFilterWidget extends ConsumerWidget {
  const ListOfUnitInFilterWidget({super.key, required this.isSearchFilter,required this.unit,required this.idCategory,required this.nameSearch});
  final bool isSearchFilter;
  final String nameSearch;
  final List<SizeData> unit;
  final int idCategory;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUnits = ref.watch(selectedUnitsProvider(idCategory));
    final stateFilter = ref.watch(filterProductProvider);

    return Wrap(
      spacing: 10.w,
      runSpacing: 8.h,
      children: unit.map((item) {
        final isSelected = selectedUnits.contains(item.id);
        return InkWell(
          onTap: () {
            if (stateFilter.stateData != States.loading) {
              ref.read(selectedUnitsProvider(idCategory).notifier).toggleUnit(item.id!);
              ref.read(filterProductProvider.notifier).getProductOfFilter(
                  idSize: ref.read(selectedSizesProvider(idCategory)),
                  idColor: ref.read(selectedColorsProvider(idCategory)),
                  idSubCategory: ref.read(selectedCategoryProvider(idCategory)),
                  price: ref.read(selectedPriceProvider(idCategory)) ,
                  idCategory: idCategory,
                  nameSearch:isSearchFilter? nameSearch:'',
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
              text: item.sizeTypeName,
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
