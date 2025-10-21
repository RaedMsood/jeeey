import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/category/data/model/category_data.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../detailsProducts/data/model/color_data.dart';
import '../../../detailsProducts/data/model/size_data.dart';
import '../state_mangment/riverpod.dart';
import '../widgets/list_of_color_in_filter_widget.dart';
import '../widgets/list_of_filter_category_widget.dart';
import '../widgets/list_of_size_in_filter_widget.dart';
import '../widgets/card_of_sub_filter_drawer_widget.dart';
import '../widgets/clear_button_and_done.dart';
import '../widgets/list_unit_in_filter_widget.dart';

class SubFilterDrawerWidget extends ConsumerStatefulWidget {
  const SubFilterDrawerWidget(
      {super.key,
      required this.colorFilterList,
      required this.sizeFilterList,
        required this.categoryFilterList,
        required this.nameSearch,
        required this.isSearchFilter,
        required this.unitFilterList,
      required this.idCategory});

  final List<SizeData> sizeFilterList;
  final List<ColorOfProductData> colorFilterList;
  final List<CategoryData> categoryFilterList;
  final String nameSearch;
  final int idCategory;
  final bool isSearchFilter;
  final List<SizeData> unitFilterList;


  @override
  ConsumerState<SubFilterDrawerWidget> createState() => _SubFilterDrawerWidgetState();
}

class _SubFilterDrawerWidgetState extends ConsumerState<SubFilterDrawerWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 694);

  @override
  Widget build(BuildContext context) {
    final selectedSizes = ref.watch(selectedSizesProvider(widget.idCategory ));
    final selectedUnit= ref.watch(selectedUnitsProvider(widget.idCategory ));
    final selectedColors = ref.watch(selectedColorsProvider(widget.idCategory ));
    final selectedCategory = ref.watch(selectedCategoryProvider(widget.idCategory));
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          28.h.verticalSpace,
          AutoSizeTextWidget(
            text: S.of(context).filter,
            fontSize: 16.5.sp,
            fontWeight: FontWeight.w600,
          ),
          6.h.verticalSpace,
          Divider(
            color: AppColors.fontColor,
            thickness: 0.2.sp,
            height: 0,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardOfSubFilterDrawerWidget(
                    isOpenToRead: selectedColors.isNotEmpty?true:false,
                    title: "لون",
                    child: ListOfColorInFilterWidget(
                      colorFilter: widget.colorFilterList,
                      idCategory: widget.idCategory,
                      nameSearch: widget.nameSearch,
                      isSearchFilter: widget.isSearchFilter,
                    ),
                  ),
                  CardOfSubFilterDrawerWidget(
                    isOpenToRead: selectedSizes.isNotEmpty?true:false,
                    title: "مقاس",
                    child: ListOfSizeInFilterWidget(
                      size: widget.sizeFilterList,
                      idCategory: widget.idCategory,
                       nameSearch: widget.nameSearch,
                      isSearchFilter: widget.isSearchFilter,

                    ),
                  ),
                  CardOfSubFilterDrawerWidget(
                    isOpenToRead: selectedUnit.isNotEmpty?true:false,
                    title: "وحدات",
                    child: ListOfUnitInFilterWidget(
                      unit: widget.unitFilterList,
                      idCategory: widget.idCategory,
                      nameSearch: widget.nameSearch,
                      isSearchFilter: widget.isSearchFilter,

                    ),
                  ),
                  CardOfSubFilterDrawerWidget(
                    isOpenToRead: selectedCategory!=null?true:false,
                    title: "فئات",
                    child: ListOfFilterCategoryWidget(
                      categoryFilter: widget.categoryFilterList,
                      idCategory: widget.idCategory,
                      nameSearch: widget.nameSearch,
                      isSearchFilter: widget.isSearchFilter,

                    ),
                  ),

                  // const CardOfSubFilterDrawerWidget(
                  //   title: "الحجم",
                  //   child: AMenuToDisplayTheSubFilterContentWidget(),
                  // ),
                  // AutoSizeTextWidget(
                  //   text: "نطاق السعر",
                  //   fontSize: 13.5.sp,
                  //   fontWeight: FontWeight.w600,
                  // ),
                  // 8.h.verticalSpace,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     AutoSizeTextWidget(
                  //       text: '\$${_currentRangeValues.start.toInt()}',
                  //       fontSize: 11.sp,
                  //       colorText: Colors.black87,
                  //     ),
                  //     AutoSizeTextWidget(
                  //       text: '\$${_currentRangeValues.end.toInt()}',
                  //       fontSize: 11.sp,
                  //       colorText: Colors.black87,
                  //     ),
                  //   ],
                  // ),
                  // 2.5.h.verticalSpace,
                  // SliderTheme(
                  //   data: SliderTheme.of(context).copyWith(
                  //     thumbColor: Colors.grey[200],
                  //     activeTrackColor: Colors.black,
                  //     inactiveTrackColor: Colors.grey,
                  //     trackHeight: 0.6.h,
                  //     overlayShape: RoundSliderOverlayShape(overlayRadius: 0.r),
                  //     valueIndicatorColor:
                  //         AppColors.primaryColor.withOpacity(.8),
                  //     valueIndicatorTextStyle: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 12.sp,
                  //     ),
                  //   ),
                  //   child: RangeSlider(
                  //     values: _currentRangeValues,
                  //     min: 0,
                  //     max: 694,
                  //     divisions: 694,
                  //     labels: RangeLabels(
                  //       '\$${_currentRangeValues.start.toInt()}',
                  //       '\$${_currentRangeValues.end.toInt()}',
                  //     ),
                  //     onChanged: (RangeValues values) {
                  //       setState(() {
                  //         _currentRangeValues = values;
                  //       });
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Divider(
            color: AppColors.fontColor,
            thickness: 0.2.sp,
            height: 0,
          ),
          ClearButtonAndDone(
            height: 29.h,
            doneOnTap: () {
              Navigator.pop(context);
            },
            clearOnTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
