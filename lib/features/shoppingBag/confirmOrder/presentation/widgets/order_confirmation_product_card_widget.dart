import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeeey/core/extension/string.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/online_images_widget.dart';
import '../../../cart/data/model/cart_model.dart';
import '../../../cart/presentation/widgets/price_and_currency_design_widget.dart';

class OrderConfirmationProductCardWidget extends StatelessWidget {
  final CartModel data;

  const OrderConfirmationProductCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.02),
            blurRadius: 1.r,
          ),
        ],
      ),
      child: Row(
        children: [
          OnlineImagesWidget(
            imageUrl: data.images.toString(),
            size: Size(82.w, 84.h),
            fit: BoxFit.cover,
            borderRadius: 2.r,
          ),
          8.w.horizontalSpace,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeTextWidget(
                  text: data.productName.toString(),
                  maxLines: 2,
                  fontSize: 12.2.sp,
                  minFontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
                8.h.verticalSpace,
                Container(
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
                        backgroundColor: data.colorHex!.toColor(),
                        radius: 5.r,
                      ),
                      2.w.horizontalSpace,
                      Flexible(
                        child: AutoSizeTextWidget(
                          text:
                              "${data.sizeName.toString()} / ${data.colorName.toString()}",
                          colorText: AppColors.fontColor,
                          fontSize: 10.5.sp,
                          maxLines: 2,
                        ),
                      ),
                      2.w.horizontalSpace,
                    ],
                  ),
                ),
                8.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: PriceAndCurrencyDesignWidget(
                        price:
                            (int.parse(data.price.toString()) * data.quantity!)
                                .toString(),
                        currency: data.currency.toString(),
                      ),
                    ),
                    4.w.horizontalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.cartMinus,
                          height: 15.h,
                        ),
                        6.w.horizontalSpace,
                        AutoSizeTextWidget(
                          text: data.quantity.toString(),
                          fontSize: 9.8.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        6.w.horizontalSpace,
                        SvgPicture.asset(
                          AppIcons.cartPlus,
                          height: 15.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
