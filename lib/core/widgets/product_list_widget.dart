import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../features/productManagement/detailsProducts/data/model/product_data.dart';
import '../theme/app_colors.dart';
import 'product_card.dart';

class ProductListWidget extends StatelessWidget {
  final bool? gradient;
  final List<ProductData> product;
  final bool isLoadingMore;

  const ProductListWidget({
    super.key,
    this.gradient = false,
    required this.product,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
              end: Alignment.center,
            ),
          ),
          child: MasonryGridView.builder(
            key: ValueKey(product.length),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            mainAxisSpacing: 6.0,
            crossAxisSpacing: 8.0,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: product.length,
            itemBuilder: (context, index) {
              return RepaintBoundary(
                child: ProductCard(
                  id: product[index].id!,
                  image: product[index].mainImage ?? [],
                  name: product[index].name!,
                  rates: 4,
                  price: product[index].price!,
                  isFavorite: true,
                ),
              );
            },
          ),
        ),
        if (isLoadingMore)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                strokeWidth: 2.0,
              ),
            ),
          ),
      ],
    );
  }
}
