import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/productManagement/trends/presentation/widgets/list_of_trend_products_widget.dart';
import 'package:jeeey/features/productManagement/trends/presentation/widgets/sliver_app_bar_trend_widget.dart';

class TrendPage extends StatelessWidget {
  final String image;
  final String name;
  final String description;

  const TrendPage({
    super.key,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarTrendWidget(
              title: name,
              image: image,
              description: description,
              expandedHeight: 330.h,
            ),
          ),
          SliverToBoxAdapter(
            child: ListOfTrendProductsWidget(gradientTopTrends: false),
          ),
        ],
      ),
    );
  }
}
