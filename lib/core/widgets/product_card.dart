import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';

import '../../features/home/presentation/pages/recommend_page.dart';
import '../constants/app_icons.dart';
import '../theme/app_colors.dart';
import 'auto_size_text_widget.dart';
import 'online_images_widget.dart';
import 'rating_bar_widget.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final double rates;
  final String price;
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
        navigateTo(context, RecommendPage());
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
                OnlineImagesWidget(
                  imageUrl: image,
                  size: Size(double.infinity, 200.h),
                ),
                PositionedDirectional(
                  top: -4.h,
                  start: -4.w,
                  child: IconButton(
                    splashColor:
                        AppColors.primarySwatch.shade800.withOpacity(.1),
                    highlightColor:
                        AppColors.primarySwatch.shade800.withOpacity(.1),
                    onPressed: () {
                      // var companiesFavorites = CompaniesFavoritesModel(
                      //   id: id,
                      //   image: image,
                      //   name: name,
                      //   address: address,
                      //   rates: rates,
                      // );
                      // ref
                      //     .read(favoriteCompaniesProvider.notifier)
                      //     .toggleFavourite(companiesFavorites);
                      // ref
                      //     .read(favoriteCompaniesProvider.notifier)
                      //     .getAllFavourites();
                    },
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
                        onTap: () {},
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
