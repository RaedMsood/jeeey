import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/product_data.dart';
import 'package:jeeey/features/productManagement/detailsProducts/presentation/widget/price_with_discount_price_widget.dart';
import 'package:jeeey/features/productManagement/detailsProducts/presentation/widget/show_copon_in_details_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../state_mangment/riverpod_details.dart';
import 'best_copon_widget.dart';
import 'description_in_model_sheet_widget.dart';
import 'image_slider_widget.dart';
import 'list_of_colors_product_widget.dart';
import 'list_of_size_product_widget.dart';
import 'more_details_widget.dart';
import 'number_of_image_widget.dart';

class WaresPartInDetailsWidget extends ConsumerWidget {
  const WaresPartInDetailsWidget({super.key, required this.productData});

  final ProductData productData;

  @override
  Widget build(BuildContext context,ref) {
    var indexColorImage = ref.watch(changeIndexOfColorImageProvider);
    var indexImage = ref.watch(showNumberOfScrollImageProvider);
    dynamic price = ref.watch(changePriceProvider(productData));

    String formattedDescription =
    productData.description!.replaceAll('\n', ' ');
    return Column(
      children: [
        ImageSliderWidget(
          productData: productData,
          indexColorImage: indexColorImage,
        ),
        if (productData.colorsProduct!.isNotEmpty ||
            productData.allImage!.isNotEmpty)
          productData.colorHasImage == false
              ? NumberOfImageWidget(
            numImageAndIndex:
            "${productData.allImage!.length} / ${indexImage ?? 1}",
          )
              : productData.colorsProduct!.isNotEmpty
              ? NumberOfImageWidget(
            numImageAndIndex:
            "${productData.colorsProduct![indexColorImage ?? 0].image!.length} / ${indexImage ?? 1}",
          )
              : const SizedBox(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              left: 14.sp, right: 14.sp, bottom: 14.sp, top: 8.sp),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.verticalSpace,
              Row(
                children: [
                  PriceWithDiscountPriceWidget(
                    price: price,
                    discountModel: productData.discountModel,
                  ),
                  Visibility(
                    visible: productData.coponData!.isNotEmpty,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0.sp),
                      child: BestCoponWidget(
                          copon: productData.coponData ?? [],
                          basePrice: price,
                          discount: productData.discountModel == null
                              ? 0
                              : productData.discountModel!.discountType !=
                              'percent'
                              ? productData.discountModel!.discount
                              : price! *
                              (productData
                                  .discountModel!.discount! /
                                  100)),
                    ),
                  ),
                ],
              ),
              6.verticalSpace,
              Visibility(
                visible: productData.coponData!.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0.sp),
                  child: ShowDetailsOfCoponWidget(
                    discount: productData.discountModel == null
                        ? 0
                        : productData.discountModel!.discountType !=
                        'percent'
                        ? productData.discountModel!.discount
                        : price! *
                        (productData.discountModel!.discount! /
                            100),
                    coponData: productData.coponData ?? [],
                    inOrder: false,
                    basePrice: price,
                  ),
                ),
              ),
              4.verticalSpace,
              AutoSizeTextWidget(
                text: productData.name!,
                fontWeight: FontWeight.bold,
                fontSize: 13.6.sp,
              ),
              6.verticalSpace,
              Visibility(
                visible: productData.description != '',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeTextWidget(
                      text: formattedDescription,
                      fontSize: 12.sp,
                      maxLines: 15,
                    ),
                    8.h.verticalSpace,
                  ],
                ),
              ),
              Visibility(
                visible: productData.colorsProduct?.isNotEmpty == true,
                child: Column(
                  children: [
                    AutoSizeTextWidget(
                      text:
                      "${S.of(context).colors} : ${ref.read(changePriceProvider(productData).notifier).getNameColor()}",
                      colorText: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.5.sp,
                    ),
                    12.verticalSpace,
                  ],
                ),
              ),
              ListOfColorsProductWidget(
                colorsProduct: productData,
              ),
              14.verticalSpace,
              productData.sizeProduct!.isNotEmpty
                  ? Column(
                children: [
                  AutoSizeTextWidget(
                    text:
                    "${S.of(context).size} : ${ref.watch(changePriceProvider(productData).notifier).getNameSize()}",
                    colorText: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5.sp,
                  ),
                  12.verticalSpace,
                ],
              )
                  : const SizedBox(),
              ListOfSizeProductWidget(
                sizeProduct: productData,
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
                  detailsProduct: productData.detailsProduct ?? [],
                ),
                describe: "الوصف",
              ),
              const Divider(color: Color(0xffF6F6F6)),
              MoreDetailsWidget(
                page: DescriptionInModelSheetWidget(
                  detailsProduct: productData.detailsProduct ?? [],
                ),
                describe: "سياسة الخصوصية",
              ),
              const Divider(color: Color(0xffF6F6F6)),
              MoreDetailsWidget(
                page: DescriptionInModelSheetWidget(
                  detailsProduct: productData.detailsProduct ?? [],
                ),
                describe: "مرجع القياس",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
