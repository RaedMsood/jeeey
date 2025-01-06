import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jeeey/core/widgets/skeletonizer_widget.dart';
import '../../features/productManagement/detailsProducts/data/model/product_data.dart';
import '../theme/app_colors.dart';
import 'product_card.dart';

class ProductListWidget extends StatelessWidget {
  final bool? gradient;
  final List<ProductData> product;
  bool isLoadingMore = false;

  ProductListWidget(
      {super.key,
      this.gradient = false,
      required this.product,
      this.isLoadingMore = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: gradient == false
                ? [
                    AppColors.whiteColor,
                    AppColors.scaffoldColor,
                    AppColors.scaffoldColor,
                  ]
                : [
                    AppColors.scaffoldColor,
                    AppColors.scaffoldColor,
                  ],
            begin: Alignment.topCenter,
            end: Alignment.center),
      ),
      child: MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 8.0,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          if (index < product.length) {
            return ProductCard(
              id: product[index].id!,
              image: product[index].mainImage??[],
              name: product[index].name!,
              rates: 4,
              price: product[index].price!,
              isFavorite: true,
              // colorId: product[index].colorsProduct.,
            );
          } else {
            return SkeletonizerWidget(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(
                  id: 0,
                  image: const [],
                  name: "",
                  rates: 4,
                  price: "",
                  isFavorite: true,
                ),
              ),
            );
          }
        },
        itemCount: isLoadingMore
            ? product.length + 6 // زيادة المؤشر عند التحميل
            : product.length,
      ),
    );
  }
}


