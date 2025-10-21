import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/constants/app_icons.dart';
import 'package:jeeey/features/category/data/model/category_data.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/size_data.dart';

import '../../../../../core/helpers/dropdown_helper.dart';
import '../../../detailsProducts/data/model/color_data.dart';
import '../state_mangment/riverpod.dart';
import '../widgets/list_of_color_in_filter_widget.dart';
import '../widgets/list_of_filter_category_widget.dart';
import '../widgets/list_of_size_in_filter_widget.dart';
import '../widgets/list_unit_in_filter_widget.dart';
import '../widgets/sub_filter_design_widget.dart';
import '../widgets/sub_filter_dropdown_menu_widget.dart';

class ListToSubFilterWidget extends ConsumerWidget {
  const ListToSubFilterWidget(
      {super.key,
      required this.sizeFilterList,
      required this.colorFilterList,
        required this.categoryFilterList,
        required this.nameSearch,
        required this.isSearchFilter,
        required this.unitFilterList,
      required this.idCategory});

  final List<SizeData> sizeFilterList;
  final List<SizeData> unitFilterList;

  final List<ColorOfProductData> colorFilterList;
  final List<CategoryData> categoryFilterList;
  final int idCategory;
  final String nameSearch;
  final bool isSearchFilter;
  @override
  Widget build(BuildContext context, ref) {
    final sizeList = ref.watch(selectedSizesProvider(idCategory));
    final unitList = ref.watch(selectedUnitsProvider(idCategory));

    final colorList = ref.watch(selectedColorsProvider(idCategory));
    final categoryFilter = ref.watch(selectedCategoryProvider(idCategory));

    return Container(
      height: 36.h,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration:
                BoxDecoration(border: colorList.isEmpty ? null : Border.all()),
            child: SubFilterDesignWidget(
              title: "لون${colorList.isEmpty ? '' : '(${colorList.length})'}",
              icon: AppIcons.arrowBottom,
              onTap: () {
                DropdownHelper().toggleDropdown(
                  context: context,
                  items: SubFilterDropdownMenuWidget(
                    aMenuToDisplayTheSubFilterContentWidget:
                        ListOfColorInFilterWidget(
                      colorFilter: colorFilterList,
                          idCategory: idCategory,
                          nameSearch: nameSearch,
                          isSearchFilter: isSearchFilter,
                    ),
                  ),
                );
              },
            ),
          ),
          6.w.horizontalSpace,
          Container(
            decoration:
                BoxDecoration(border: sizeList.isEmpty ? const Border() : Border.all()),
            child: SubFilterDesignWidget(
              title: "مقاس${sizeList.isEmpty ? '' : '(${sizeList.length})'}",
              icon: AppIcons.arrowBottom,
              onTap: () {
                DropdownHelper().toggleDropdown(
                  context: context,
                  items: SubFilterDropdownMenuWidget(
                    aMenuToDisplayTheSubFilterContentWidget:
                        ListOfSizeInFilterWidget(
                      size: sizeFilterList,
                          idCategory: idCategory,
                          nameSearch: nameSearch,
                          isSearchFilter: isSearchFilter,
                    ),
                  ),
                );
              },
            ),
          ),
          6.w.horizontalSpace,
          Container(
            decoration:
            BoxDecoration(border: unitList.isEmpty ? const Border() : Border.all()),
            child: SubFilterDesignWidget(
              title: "وحدات${unitList.isEmpty ? '' : '(${unitList.length})'}",
              icon: AppIcons.arrowBottom,
              onTap: () {
                DropdownHelper().toggleDropdown(
                  context: context,
                  items: SubFilterDropdownMenuWidget(
                    aMenuToDisplayTheSubFilterContentWidget:
                    ListOfUnitInFilterWidget(
                      unit: unitFilterList,
                      idCategory: idCategory,
                      nameSearch: nameSearch,
                      isSearchFilter: isSearchFilter,
                    ),
                  ),
                );
              },
            ),
          ),
          6.w.horizontalSpace,
          Container(
            decoration:
            BoxDecoration(border: categoryFilter==null ? const Border() : Border.all()),
            child: SubFilterDesignWidget(
              title: "فئات",
              icon: AppIcons.arrowBottom,
              onTap: () {
                print(categoryFilter);

                DropdownHelper().toggleDropdown(
                  context: context,
                  items:  SubFilterDropdownMenuWidget(
                    aMenuToDisplayTheSubFilterContentWidget:
                    ListOfFilterCategoryWidget(
                      categoryFilter: categoryFilterList,
                          idCategory: idCategory,
                      nameSearch: nameSearch,
                      isSearchFilter: isSearchFilter,
                    ),
                  ),
                );
              },
            ),
          ),
          6.w.horizontalSpace,
        ],
      ),
    );
  }
}
