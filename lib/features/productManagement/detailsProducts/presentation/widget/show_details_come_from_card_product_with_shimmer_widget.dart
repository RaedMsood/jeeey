import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/price_and_currency_widget.dart';
import '../../../../../core/widgets/shimmer_widget.dart';
import '../state_mangment/riverpod_details.dart';
import 'image_show_in_details_come_from_card_widget.dart';
import 'image_slider_widget.dart';
import 'number_of_image_widget.dart';

class ShowDetailsComeFromCardProductWithShimmerWidget extends StatelessWidget {
  const ShowDetailsComeFromCardProductWithShimmerWidget({
    super.key,
    required this.image,
    required this.price,
    required this.name,
  });

  final List<String> image;
  final String name;
  final dynamic price;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(
        builder: (context, ref, child) {
          var indexColorImage = ref.watch(changeIndexOfColorImageProvider);
          var indexImage = ref.watch(showNumberOfScrollImageProvider);

          return Column(
            children: [
              ImageShowInDetailsComeFromCardWidget(
                productData: image,
                indexColorImage: indexColorImage,
              ),
              NumberOfImageWidget(
                numImageAndIndex: "${image.length} / ${indexImage ?? 1}",
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: 14.sp, right: 14.sp, bottom: 14.sp, top: 4.sp),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    4.verticalSpace,
                    PriceAndCurrencyWidget(
                      price: price.toString(),
                      fontSize1: 14.sp,
                      fontSize2: 10.sp,
                    ),
                    16.verticalSpace,
                    AutoSizeTextWidget(
                      text: name,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.5.sp,
                    ),
                    14.verticalSpace,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerWidget(
                          child: Container(
                            width: 100.w,
                            color: Colors.grey.withOpacity(0.5),
                            child: const AutoSizeTextWidget(text: ''),
                          ),
                        ),
                        4.verticalSpace,
                        ShimmerWidget(
                          child: Container(
                            width: double.infinity,
                            height: 20,
                            child: AutoSizeTextWidget(
                              text: '',
                            ),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    14.verticalSpace,
                    Column(
                      children: [
                        ShimmerWidget(
                          child: Container(
                            width: 100.w,
                            color: Colors.grey.withOpacity(0.5),
                            child: const AutoSizeTextWidget(text: ''),
                          ),
                        ),
                        12.verticalSpace,
                      ],
                    ),
                    Wrap(
                      spacing: 6.0.w,
                      runSpacing: 6.0.h,
                      children: [
                        Container(
                          width: 20.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 20.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 20.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 20.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    14.verticalSpace,
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
