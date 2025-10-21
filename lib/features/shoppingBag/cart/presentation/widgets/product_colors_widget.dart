import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/extension/string.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../productManagement/detailsProducts/data/model/color_data.dart';

class ProductColorsWidget extends StatelessWidget {
  final List<ColorOfProductData> productsColors;
  final int colorId;
  String colorName;
  final Function(int, int, String) onSelect;

  ProductColorsWidget({
    super.key,
    required this.productsColors,
    required this.colorId,
    required this.onSelect,
    this.colorName = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: AutoSizeTextWidget(
            text: "${S.of(context).colors}: $colorName ",
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        8.h.verticalSpace,
        SizedBox(
          height: 24.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            itemCount: productsColors.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => onSelect(
                  productsColors[index].idColor!,
                  index,
                  productsColors[index].colorName!,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1.6.sp),
                      decoration: BoxDecoration(
                        border: productsColors[index].idColor == colorId
                            ? Border.all(
                                color: AppColors.primaryColor,
                                width: 0.8,
                              )
                            : Border.all(
                                color: AppColors.fontColor,
                                width: 0.3,
                              ),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: CircleAvatar(
                        backgroundColor:
                            productsColors[index].colorHex!.toColor(),
                        radius: 9.r,
                      ),
                    ),
                    10.w.horizontalSpace,
                  ],
                ),
              );
            },
          ),
        ),
        8.h.verticalSpace,
      ],
    );
  }
}
