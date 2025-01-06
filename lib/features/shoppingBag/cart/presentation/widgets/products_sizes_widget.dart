import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/shoppingBag/cart/data/model/product_details_for_cart_model.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class ProductsSizesWidget extends StatelessWidget {
  final List<SizeTypeDetailModel> sizeTypeDetails;
  final int sizeId;

  final Function(int) onSelect;

  const ProductsSizesWidget({
    super.key,
    required this.sizeTypeDetails,
    required this.sizeId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          6.h.verticalSpace,
          AutoSizeTextWidget(
            text: "مقاس",
            fontSize: 13.5.sp,
            fontWeight: FontWeight.w700,
          ),
          6.h.verticalSpace,
          Wrap(
            spacing: 12.w,
            runSpacing: 8.h,
            children: sizeTypeDetails.map((items) {
              return InkWell(
                onTap: () => onSelect(items.sizeTypeId!),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.sp),
                    border: items.sizeTypeId == sizeId
                        ? Border.all(
                            color: Colors.black,
                            width: 0.7,
                          )
                        : Border.all(
                            color: AppColors.fontColor,
                            width: 0.2,
                          ),
                  ),
                  child: AutoSizeTextWidget(
                    text: items.sizeTypeName.toString(),
                    fontSize: 12.sp,
                    fontWeight: items.sizeTypeId == sizeId
                        ? FontWeight.bold
                        : FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
