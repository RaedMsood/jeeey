import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeeey/core/extension/string.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/online_images_widget.dart';
import '../../../../../core/widgets/price_and_currency_widget.dart';
import '../../../../productManagement/detailsProducts/presentation/widget/details_of_copon_widget.dart';
import '../../../../productManagement/detailsProducts/presentation/widget/show_copon_in_details_widget.dart';
import '../../../cart/data/model/cart_model.dart';
import '../../../cart/presentation/widgets/price_and_currency_design_widget.dart';

class OrderConfirmationProductCardWidget extends StatelessWidget {
  final CartModel data;
  final bool isCheckCopon;
  final bool productInCopon;

  const OrderConfirmationProductCardWidget(
      {super.key,
      required this.data,
      required this.isCheckCopon,
      required this.productInCopon});

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
                      data.colorHex!.isNotEmpty
                          ? CircleAvatar(
                              backgroundColor: data.colorHex!.toColor(),
                              radius: 5.r,
                            )
                          : const SizedBox.shrink(),
                      2.w.horizontalSpace,
                      Flexible(
                        child: AutoSizeTextWidget(
                          text: data.colorName!.isNotEmpty
                              ? "${data.colorName.toString()}  /  ${data.sizeName.toString()}"
                              : data.sizeName.toString(),
                          colorText: AppColors.fontColor,
                          fontSize: 10.5.sp,
                          maxLines: 2,
                        ),
                      ),
                      2.w.horizontalSpace,
                    ],
                  ),
                ),
                Visibility(
                  visible: isCheckCopon && productInCopon,
                  child: Column(
                    children: [
                      8.h.verticalSpace,
                      Container(
                        padding: EdgeInsets.all(3.sp),
                        decoration: BoxDecoration(
                          // color: AppColors.primaryColor.withOpacity(0.1),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: AutoSizeTextWidget(
                          text: 'كوبون خاص',
                          fontSize: 8.sp,
                          minFontSize: 3,
                          colorText: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                8.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Visibility(
                        visible: !isCheckCopon && !productInCopon,
                        replacement: PriceAndCurrencyWidget(
                          price: (num.tryParse(data.originalPrice.toString()) ??
                                  1 * data.quantity!)
                              .toString(),
                        ),
                        child: PriceAndCurrencyWidget(
                          price: (num.tryParse(data.price.toString()) ??
                                  1 * data.quantity!)
                              .toString(),
                        ),
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
                Visibility(
                  visible: isCheckCopon && productInCopon,
                  child: GestureDetector(
                    onTap: () {
                      //  ShowDetailsOfCoponWidget(inOrder: true,coponData: ,);
                    },
                    child: Column(
                      children: [
                        8.verticalSpace,
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  builder: (context) => DetailsOfCoponWidget(
                                    discount: 0,
                                      inOrder: true,
                                      discountCopon:data.totalDiscount! ,
                                      basePrice: num.parse(data.originalPrice!)*num.parse(data.quantity.toString())),
                                );

                              },
                              child: Container(
                                padding: EdgeInsets.all(3.sp),
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1),
                                  // border: Border.all(color: AppColors.primaryColor),
                                ),
                                child: Row(
                                  children: [
                                    PriceAndCurrencyWidget(
                                      price: data.finalPrice.toString(),
                                      fontSize1: 8.5.sp,
                                      fontSize2: 8.5.sp,
                                      textWeight1: FontWeight.normal,
                                      textWeight2: FontWeight.normal,
                                    ),
                                    AutoSizeTextWidget(
                                      text: ' | ',
                                      fontSize: 8.sp,
                                      minFontSize: 3,
                                      colorText: AppColors.primaryColor,
                                    ),
                                    AutoSizeTextWidget(
                                      text: 'بعد الكوبون ',
                                      fontSize: 8.sp,
                                      minFontSize: 3,
                                      colorText: AppColors.primaryColor,
                                    ),
                                    1.horizontalSpace,
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.primaryColor,
                                      size: 10.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
