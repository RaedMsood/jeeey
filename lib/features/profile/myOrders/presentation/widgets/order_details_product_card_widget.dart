import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/extension/string.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/online_images_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../productManagement/reviews/presentation/pages/reviews_page.dart';
import '../../data/model/product_order_details_model.dart';
import 'order_details_card_data_design_widget.dart';

class OrderDetailsProductCardWidget extends StatelessWidget {
  final ProductOrderDetailsModel orderProducts;
  final int orderId;
  final int status;

  const OrderDetailsProductCardWidget({
    super.key,
    required this.orderProducts,
    required this.orderId,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 11.h),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OnlineImagesWidget(
            imageUrl: orderProducts.image.toString(),
            size: Size(90.w, 90.h),
            fit: BoxFit.cover,
            borderRadius: 2.r,
          ),
          12.w.horizontalSpace,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: AutoSizeTextWidget(
                        text: orderProducts.name.toString(),
                        maxLines: 2,
                        fontSize: 11.4.sp,
                        minFontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    10.w.horizontalSpace,
                    InkWell(
                      onTap: () {
                        navigateTo(
                          context,
                          ReviewsPage(
                            products: orderProducts,
                            orderId: orderId,
                            status: status,
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AutoSizeTextWidget(
                            text: S.of(context).opinions,
                            fontSize: 10.sp,
                            colorText: AppColors.primaryColor,
                          ),
                          Icon(
                            Localizations.localeOf(context).languageCode == "ar"
                                ? Icons.keyboard_arrow_left
                                : Icons.keyboard_arrow_right,
                            color: AppColors.primaryColor,
                            size: 15.5.r,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                6.h.verticalSpace,
                orderProducts.colorHex!.isNotEmpty
                    ? OrderDetailsCardDataDesignWidget(
                        title: "${S.of(context).color}:",
                        subTitle: orderProducts.colorName.toString(),
                        color: orderProducts.colorHex.toString().toColor(),
                        isColor: true,
                      )
                    : const SizedBox.shrink(),
                orderProducts.colorHex!.isNotEmpty
                    ? 4.h.verticalSpace
                    : 0.verticalSpace,
                OrderDetailsCardDataDesignWidget(
                  title: "${S.of(context).size}:",
                  subTitle: orderProducts.sizeValue.toString(),
                ),
                4.h.verticalSpace,
                OrderDetailsCardDataDesignWidget(
                  title: "${S.of(context).quantity}:",
                  subTitle: orderProducts.quantity.toString(),
                ),
                4.h.verticalSpace,
                OrderDetailsCardDataDesignWidget(
                  title: "سعر الوحدة:",
                  subTitle: orderProducts.price.toString(),
                  isPrice: true,
                ),
                4.h.verticalSpace,
                Visibility(
                  visible: orderProducts.hasCopon == 1,
                  child: Column(
                    children: [
                      OrderDetailsCardDataDesignWidget(
                        title: "اجمالي خصم الكوبون:",
                        subTitle: orderProducts.totalDiscountCopon.toString(),
                        isPrice: true,
                        colorTitleAndPrice: AppColors.primaryColor,
                      ),
                      4.h.verticalSpace,
                    ],
                  ),
                ),
                OrderDetailsCardDataDesignWidget(
                  title: "الاجمالي:",
                  subTitle: orderProducts.totalAfterCoupon.toString(),
                  isPrice: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
