import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import 'package:jeeey/features/productManagement/detailsProducts/presentation/page/details_page.dart';
import '../../features/shoppingBag/cart/presentation/pages/add_to_cart_page.dart';
import '../constants/app_icons.dart';
import '../theme/app_colors.dart';
import 'auto_size_text_widget.dart';
import 'online_images_widget.dart';
import 'price_and_currency_widget.dart';
import 'rating_bar_widget.dart';
import 'show_modal_bottom_sheet_widget.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final List<String> image;
  final String name;
  final double rates;
  final dynamic price;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.rates,
    required this.price,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(id.toString() + "-------------------");
        navigateTo(
            context,
            DetailsPage(
              idProduct: id,
              image: image,
              name: name,
              price: price,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.0),
              blurRadius: 1.r,
            ),
          ],
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 200.h,
                  child: PageView.builder(
                    itemCount: image.length,
                    itemBuilder: (context, imageIndex) {
                      return OnlineImagesWidget(
                        imageUrl: image[imageIndex],
                        size: Size(180.w, 200.h),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeTextWidget(
                    text: name,
                    maxLines: 2,
                    fontSize: 11.sp,
                    minFontSize: 8,
                  ),
                  2.h.verticalSpace,
                  RatingBarWidget(
                    evaluation: 2,
                    itemSize: 12.sp,
                  ),
                  2.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: PriceAndCurrencyWidget(
                          price: price.toString(),
                          fontSize1: 12.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheetWidget(
                            backgroundColor: Colors.transparent,
                            context: context,
                            page: AddToCartPage(
                              productId: id,
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          AppIcons.cartActive,
                          height: 24.h,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
