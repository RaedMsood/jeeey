import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/constants/app_icons.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import '../../../../../core/helpers/dropdown_helper.dart';
import '../../../../../generated/l10n.dart';
import '../state_mangment/riverpod.dart';
import '../widgets/design_and_recommend_list_widget.dart';
import '../widgets/main_filter_design_widget.dart';

var mainFilterActiveIndexProvider = StateProvider<int>((ref) => 0);

class MainFilterWidget extends ConsumerStatefulWidget {
  final int idCategory;
  final VoidCallback? onTapFilter;
  final String nameSearch;

  const MainFilterWidget(
      {super.key, this.onTapFilter, required this.idCategory,required this.nameSearch});

  @override
  ConsumerState<MainFilterWidget> createState() => _MainFilterWidgetState();
}

class _MainFilterWidgetState extends ConsumerState<MainFilterWidget> {
  bool highPrice = false;

  bool active = false;
  bool? noFilterPrice;

  @override
  Widget build(BuildContext context) {
    var mainFilterActiveIndex = ref.watch(mainFilterActiveIndexProvider);
    ref.watch(recommendIndexProvider);
    final selectedSizes = ref.watch(selectedSizesProvider(widget.idCategory));
    final selectedColors = ref.watch(selectedColorsProvider(widget.idCategory));
    final selectedCategory =
        ref.watch(selectedCategoryProvider(widget.idCategory));

    final sumOfSelectedItemInFilter = selectedSizes.length +
        selectedColors.length +
        (selectedCategory == null ? 0 : 1);

    return WillPopScope(
      onWillPop: () async {
        if (DropdownHelper().overlayEntry == null) {
          return true;
        } else {
          setState(() {});
          DropdownHelper().overlayEntry!.remove();
          DropdownHelper().overlayEntry = null;
          return false;
        }
      },
      child: Container(
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Recommend
            // MainFilterDesignWidget(
            //   title: ref.read(recommendIndexProvider.notifier).state,
            //   icon: DropdownHelper().overlayEntry == null
            //       ? AppIcons.arrowBottom
            //       : AppIcons.arrowUp,
            //   active: mainFilterActiveIndex == 0,
            //   onTap: () {
            //     if (mainFilterActiveIndex == 0) {
            //       DropdownHelper().toggleDropdown(
            //           context: context,
            //           items: DesignAndRecommendListWidget(),
            //           onTapDown: (_) {
            //             setState(() {});
            //             DropdownHelper().overlayEntry!.remove();
            //             DropdownHelper().overlayEntry = null;
            //           });
            //     }
            //     ref.read(mainFilterActiveIndexProvider.notifier).state = 0;
            //     setState(() {
            //       highPrice = false;
            //     });
            //   },
            // ),
            //
            // /// Most Popular
            MainFilterDesignWidget(
              title: '          ',
              active: mainFilterActiveIndex == 1,
              icon: AppIcons.arrowBottom,
              color: Colors.transparent,
              onTap: () {
                setState(() {
                  highPrice = false;
                });
              },
            ),

            /// Price
            MainFilterDesignWidget(
              title: S.of(context).price,
              active: mainFilterActiveIndex == 2,
              priceIcon: true,
              highPrice: highPrice,
              onTap: () {
                ref.read(mainFilterActiveIndexProvider.notifier).state = 2;
                setState(() {
                  highPrice = !highPrice;
                  noFilterPrice = false;
                });
                ref
                    .read(selectedPriceProvider(widget.idCategory).notifier)
                    .selectPrice(noFilterPrice != null
                        ? highPrice == true
                            ? 'max'
                            : 'min'
                        : '');
                print(ref.read(selectedPriceProvider(widget.idCategory)));
                ref.read(filterProductProvider.notifier).getProductOfFilter(
                  nameSearch: widget.nameSearch,
                  idSize:
                          ref.read(selectedSizesProvider(widget.idCategory)),
                      idColor:
                          ref.read(selectedColorsProvider(widget.idCategory)),
                      idSubCategory:
                          ref.read(selectedCategoryProvider(widget.idCategory)),
                      price: ref.read(selectedPriceProvider(widget.idCategory)),
                      idCategory: widget.idCategory,
                  idUnit: ref.read(selectedUnitsProvider(widget.idCategory))
                    );
              },
            ),

            /// Filter
            Row(
              children: [
                Container(
                  height: 18.h,
                  color: AppColors.greySwatch.shade200,
                  width: 0.8.w,
                ),
                9.w.horizontalSpace,
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    MainFilterDesignWidget(
                      title: S.of(context).filter,
                      active:sumOfSelectedItemInFilter==0? false:true,
                      icon: AppIcons.filter,
                      onTap: widget.onTapFilter!,
                    ),
                    sumOfSelectedItemInFilter==0?const SizedBox(): Container(
                      width: 10.w,
                      height: 10.h,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: AutoSizeTextWidget(
                        text: sumOfSelectedItemInFilter.toString(),
                        colorText: Colors.white,
                        fontSize: 7.sp,
                        minFontSize: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
