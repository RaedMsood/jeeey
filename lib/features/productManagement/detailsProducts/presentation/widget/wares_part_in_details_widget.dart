import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/product_data.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/online_images_widget.dart';
import '../state_mangment/riverpod_details.dart';
import 'description_in_model_sheet_widget.dart';
import 'image_slider_widget.dart';
import 'line_through_price_widget.dart';
import 'list_of_colors_product_widget.dart';
import 'list_of_size_product_widget.dart';
import 'more_details_widget.dart';
import 'number_of_image_widget.dart';

class WaresPartInDetailsWidget extends StatelessWidget {
  const WaresPartInDetailsWidget({super.key, required this.productData});

  final ProductData productData;

  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder:(context, ref, child) {
        var indexColorImage = ref.watch(changeIndexOfColorImageProvider);
        var indexImage = ref.watch(showNumberOfScrollImageProvider);

        return Column(
        children: [
          ImageSliderWidget(
              productData: productData,
              indexColorImage: indexColorImage,

            ),
          productData.colorsProduct!.isNotEmpty? NumberOfImageWidget(
            numImageAndIndex:"${productData
                .colorsProduct![indexColorImage??0].image!.length} / ${indexImage??1}" ,
          ):const SizedBox(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 14.sp,right: 14.sp,bottom: 14.sp,top: 4.sp),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AutoSizeTextWidget(
                      text: num.tryParse(productData.discount!) == 0
                          ? "${(num.tryParse(productData.price!)! - num.tryParse(productData.discount!)!)}"
                              " ${productData.currency!}"
                          : "${productData.price}  ${productData.currency}",
                      colorText: AppColors.primarySwatch,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                    16.horizontalSpace,
                    num.tryParse(productData.discount!) == 0
                        ? const SizedBox()
                        : CustomPaint(
                            painter: LineThroughPainter(),
                            child: AutoSizeTextWidget(
                              text:
                                  "${productData.price}  ${productData.currency}",
                              fontSize: 12.sp,
                            ),
                          ),
                  ],
                ),
                8.verticalSpace,
                Container(
                  height: 25.h,
                  width: 210.w,
                  alignment: Alignment.center,
                  color: const Color(0xffF0DA97),
                  child: const AutoSizeTextWidget(
                    text: 'اشتري واحدة وأحصل على الاخرى بتخفيض 20%',
                    colorText: Color(0xffB26722),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                8.verticalSpace,
                AutoSizeTextWidget(
                  text: productData.name!,
                  fontWeight: FontWeight.bold,
                  //   fontSize: 17,
                ),
                8.verticalSpace,
                AutoSizeTextWidget(
                  text: productData.description!,

                  fontWeight: FontWeight.bold,
                  // fontSize: 15,
                ),
                8.verticalSpace,
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0.sp),
                      child: Container(
                        height: 21.h,
                        width: 175.w,
                        alignment: Alignment.center,
                        color: const Color(0x32F0DA97),
                        child: const AutoSizeTextWidget(
                          text: '# مجموعات مخططة',
                          colorText: Color(0xffF0DA97),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Container(
                      height: 21.h,
                      width: 58.w,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(50)),
                        color: Color(0xffF0DA97),
                      ),
                      child: const AutoSizeTextWidget(
                        text: 'ترندات',
                        colorText: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                 AutoSizeTextWidget(
                  text: 'الالوان :',

                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
                12.verticalSpace,
                ListOfColorsProductWidget(
                  colorsProduct: productData.colorsProduct!,
                ),
                8.verticalSpace,
                 AutoSizeTextWidget(
                  text: 'المقاس :',

                  fontWeight: FontWeight.bold,
                   fontSize: 14.sp,
                ),
                12.verticalSpace,
                ListOfSizeProductWidget(
                  sizeProduct: productData.sizeProduct!,
                ),
              ],
            ),
          ),
          2.verticalSpace,
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(14.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MoreDetailsWidget(
                  page: DescriptionInModelSheetWidget(
                    detailsProduct: productData.detailsProduct!,
                  ),
                  describe: "الوصف",
                ),
                const Divider(color: Color(0xffF6F6F6)),
                MoreDetailsWidget(
                  page: DescriptionInModelSheetWidget(
                    detailsProduct: productData.detailsProduct!,
                  ),
                  describe: "سياسة الخصوصية",
                ),
                const Divider(color: Color(0xffF6F6F6)),
                MoreDetailsWidget(
                  page: DescriptionInModelSheetWidget(
                    detailsProduct: productData.detailsProduct!,
                  ),
                  describe: "مرجع القياس",
                ),
              ],
            ),
          ),
        ],
      );
      },
    );
  }
}
