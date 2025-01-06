import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeeey/core/extension/string.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/show_modal_bottom_sheet_widget.dart';
import '../pages/update_cart_page.dart';

class ColorAndSizeDesignForCartCardWidget extends StatelessWidget {
  final int id;
  final int productId;
  final int? sizeId;
  final int? colorId;
  final String colorHex;
  final String colorName;
  final String sizeName;
  final int quantity;
  final Function onSuccess;

  const ColorAndSizeDesignForCartCardWidget({
    super.key,
    required this.productId,
    this.sizeId,
    this.colorId,
    required this.colorHex,
    required this.colorName,
    required this.sizeName,
    required this.id,
    required this.quantity,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheetWidget(
          backgroundColor: Colors.transparent,
          context: context,
          page: UpdateCartPage(
            id: id,
            productId: productId,
            quantity: quantity,
            onSuccess: onSuccess,
            sizeId: sizeId,
            colorId: colorId,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 1.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: colorHex.toColor(),
              radius: 5.r,
            ),
            2.w.horizontalSpace,
            Flexible(
              child: AutoSizeTextWidget(
                text: "${sizeName.toString()} / ${colorName.toString()}",
                colorText: AppColors.fontColor,
                fontSize: 10.5.sp,
                maxLines: 2,
              ),
            ),
            2.w.horizontalSpace,
            SvgPicture.asset(
              AppIcons.arrowBottom,
              color: AppColors.fontColor,
            ),
          ],
        ),
      ),
    );
  }
}
