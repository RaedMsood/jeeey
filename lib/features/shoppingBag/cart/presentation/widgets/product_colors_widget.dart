import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/extension/string.dart';

import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../data/model/product_color_model.dart';

class ProductColorsWidget extends StatelessWidget {
  final List<ProductColorModel> productsColors;
  final int colorId;

  final Function(int,int) onSelect;

  const ProductColorsWidget({
    super.key,
    required this.productsColors,
    required this.colorId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: AutoSizeTextWidget(
            text: "الون",
            fontSize: 13.5.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        4.h.verticalSpace,
        SizedBox(
          height: 24.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            itemCount:productsColors.length ,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => onSelect(productsColors[index].colorId!,index),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1.4.sp),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: productsColors[index].colorId == colorId
                              ? Colors.black
                              : Colors.transparent,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: CircleAvatar(
                        backgroundColor: productsColors[index].colorHex!.toColor(),
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
        // SizedBox(
        //   height: 24.h,
        //   child: ListView(
        //       shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       padding: EdgeInsets.symmetric(horizontal: 10.w),
        //       children: productsColors.map((items) {
        //         return
        //       }).toList()),
        // ),
      ],
    );
  }
}
