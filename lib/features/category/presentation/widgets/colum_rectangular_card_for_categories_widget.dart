import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/theme/app_colors.dart';

import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/state/state.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/online_images_widget.dart';
import '../../../productManagement/filterProducts/presentation/state_mangment/riverpod.dart';
import '../pages/subcategory_product_filter_page.dart';

class RectangularCardForCategoriesWidget extends ConsumerWidget {
  final String name;
  final int idCategory;
  final String image;
  final int parentIdCategory;
  final String nameSearch;

  const RectangularCardForCategoriesWidget(
      {super.key,
      required this.name,
      required this.idCategory,
      required this.image,
      required this.nameSearch,
      required this.parentIdCategory});

  @override
  Widget build(BuildContext context, ref) {
    final selectedCategory =
        ref.watch(selectedCategoryProvider(parentIdCategory));
    final isSelected = selectedCategory == idCategory;
    final stateFilter = ref.watch(filterProductProvider);

    return InkWell(
      onTap: () {
        if (stateFilter.stateData != States.loading) {
          ref
              .read(selectedCategoryProvider(parentIdCategory).notifier)
              .selectCategory(idCategory);
          ref.read(filterProductProvider.notifier).getProductOfFilter(
                idSize: ref.read(selectedSizesProvider(parentIdCategory)),
                idColor: ref.read(selectedColorsProvider(parentIdCategory)),
                idSubCategory:
                    ref.read(selectedCategoryProvider(parentIdCategory)),
                price: ref.read(selectedPriceProvider(parentIdCategory)),
                idCategory: parentIdCategory,
                nameSearch: nameSearch,
                idUnit: ref.read(selectedUnitsProvider(idCategory)),
              );
        }
      },
      child: Container(
        width: 70.w,
        padding: EdgeInsets.all(2.sp),
        margin: EdgeInsets.only(bottom: 1.h),
        decoration: BoxDecoration(
          color: AppColors.greySwatch.shade100.withOpacity(.6),
          border: isSelected == true
              ? Border.all(color: Colors.black, width: 0.8)
              : Border.all(color: Colors.transparent),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OnlineImagesWidget(
              imageUrl: image,
              size: Size(double.infinity, 63.h),
            ),
            2.h.verticalSpace,
            Flexible(
              child: SizedBox(
                height: 30.h,
                child: AutoSizeTextWidget(
                  text: name,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  minFontSize: 9,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
