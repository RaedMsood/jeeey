import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import 'package:jeeey/features/productManagement/detailsProducts/presentation/page/details_page.dart';
import 'package:jeeey/features/user/presentation/pages/log_in_page.dart';

import '../../features/shoppingBag/cart/presentation/pages/add_to_cart_page.dart';
import '../../services/auth/auth.dart';
import '../constants/app_icons.dart';
import '../theme/app_colors.dart';
import 'auto_size_text_widget.dart';
import 'online_images_widget.dart';
import 'rating_bar_widget.dart';
import 'show_modal_bottom_sheet_widget.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final List<String> image;
  final String name;
  final double rates;
  final String price;
  final bool isFavorite;

  // final int colorId;
  // final int sizeId;

  ProductCard({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.rates,
    required this.price,
    required this.isFavorite,
    // required this.colorId,
    // required this.sizeId,
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
                PositionedDirectional(
                  top: -4.h,
                  start: -4.w,
                  child: IconButton(
                    splashColor:
                        AppColors.primarySwatch.shade800.withOpacity(.1),
                    highlightColor:
                        AppColors.primarySwatch.shade800.withOpacity(.1),
                    onPressed: () {},
                    // style: WingsButtons.circleStyle,
                    icon: SvgPicture.asset(
                      isFavorite ? AppIcons.favorite : AppIcons.favorite,
                      allowDrawingOutsideViewBox: true,
                    ),
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
                    fontSize: 11.8.sp,
                    minFontSize: 11,
                  ),
                  1.5.h.verticalSpace,
                  RatingBarWidget(
                    evaluation: 2,
                    itemSize: 14.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AutoSizeTextWidget(
                          text: price,
                          colorText: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                          fontSize: 9.5.sp,
                          minFontSize: 8,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (!Auth().loggedIn) {
                            navigateTo(context, const LogInPage());
                          } else {
                            showModalBottomSheetWidget(
                              backgroundColor: Colors.transparent,
                              context: context,
                              page: AddToCartPage(
                                productId: id,
                              ),
                            );
                          }
                        },
                        child: SvgPicture.asset(
                          AppIcons.cartActive,
                          height: 24.h,
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
