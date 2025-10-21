import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../productManagement/detailsProducts/data/model/product_data.dart';

class ProductsSizesWidget extends StatefulWidget {
  final ProductData data;
  final int sizeId;
  final Function(int, String) onSelect;
  final ValueChanged<int> onCounterChanged;
  dynamic sizeTypeName;

  ProductsSizesWidget({
    super.key,
    required this.data,
    required this.sizeId,
    required this.onSelect,
    required this.onCounterChanged,
    this.sizeTypeName = '',
  });

  @override
  State<ProductsSizesWidget> createState() => _ProductsSizesWidgetState();
}

class _ProductsSizesWidgetState extends State<ProductsSizesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeTextWidget(
            text: widget.data.measuringType!.isNotEmpty &&
                    widget.data.measuringType![0] == "unit"
                ? "${S.of(context).unity}: ${widget.sizeTypeName.toString()}"
                : "${S.of(context).size}: ${widget.sizeTypeName.toString()}",
            fontSize: 12.2.sp,
            fontWeight: FontWeight.w600,
          ),
          8.h.verticalSpace,
          // widget.data.measuringType!.isNotEmpty &&
          //         widget.data.measuringType![0] == "unit"
          //     ? CounterOfUnitProductWidget(
          //         onCounterChanged: (int value) =>
          //             widget.onCounterChanged(value))
          //     : const SizedBox.shrink(),
          Wrap(
            spacing: 12.w,
            runSpacing: 8.h,
            children: widget.data.sizeProduct!.map((items) {
              return InkWell(
                onTap: () => widget.onSelect(items.id!, items.sizeTypeName),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 3.h),
                  margin: EdgeInsets.only(bottom: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.sp),
                    border: items.id == widget.sizeId
                        ? Border.all(
                            color: AppColors.primaryColor,
                            width: 0.8,
                          )
                        : Border.all(
                            color: AppColors.fontColor,
                            width: 0.2,
                          ),
                  ),
                  child: AutoSizeTextWidget(
                    text: items.sizeTypeName.toString(),
                    fontSize: 12.sp,
                    fontWeight: items.id == widget.sizeId
                        ? FontWeight.w600
                        : FontWeight.w500,
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
