import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/skeletonizer_widget.dart';
import 'package:jeeey/features/category/data/model/category_data.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/product_data.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../category/presentation/widgets/list_to_display_categories_on_the_home_widget.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../../../category/presentation/widgets/shimmer_widget.dart';
import '../../data/model/section_data.dart';
import '../widgets/carousel_slider_for_offers_widget.dart';
import '../widgets/filter_products_home_widget.dart';
import '../widgets/list_of_discount_widget.dart';
import '../widgets/list_of_major_offers_widget.dart';
import '../widgets/list_of_trends_widget.dart';
import '../widgets/app_bar_home_widget.dart';
import '../widgets/smooth_page_indicator_widget.dart';

class SkeletonizerOfHomePage extends StatefulWidget {
  const SkeletonizerOfHomePage({super.key});

  @override
  State<SkeletonizerOfHomePage> createState() => _SkeletonizerOfHomePageState();
}

class _SkeletonizerOfHomePageState extends State<SkeletonizerOfHomePage> with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  Color iconColor = Colors.white;
  int pageController = 0;
  //late TabController _tabController;
  Color appBarColor = Colors.transparent;
  final List<String> images = [
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s',
    'https://letsenhance.io/static/03620c83508fc72c6d2b218c7e304ba5/11499/UpscalerAfter.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG1X1dlZuFdyXtSX3gXdycKtVeXGtGOzsfdw&s'
  ];

  @override
  void initState() {
    super.initState();

  }



  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double expandedHeight = 120.h;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      extendBodyBehindAppBar: true,
      // appBar: appBarHomeWidget(
      //   tabController: TabController(length: 5, vsync: this),
      //   iconColor: iconColor,
      //   appBarColor: appBarColor,
      //   section: SectionData.fakeSharesData
      // ),
      body: DefaultTabController(
        length: categories.length,
        child: TabBarView(
         // controller: _tabController,
          children: categories.map((category) {
            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: expandedHeight,
                  pinned: false,
                  stretch: true,
                  backgroundColor: Colors.white,

                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SkeletonizerWidget(
                          child: CarouselSliderForOffersWidget(
                            heightImage: double.infinity,
                            images: images,
                            onPageChanged: (index, reason) {
                              setState(() {
                                pageController = index;
                              });
                            },
                          ),
                        ),
                        SkeletonizerWidget(
                          child: SmoothPageIndicatorWidget(
                            pageController: pageController,
                            count: images.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // backgroundColor: Colors.red,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SkeletonizerWidget(
                         child: ListToDisplayCategoriesOnTheHomeWidget(
                           category: CategoryData.fakeCategoriesData,
                         ),
                       ),

                      /// Class ListOf Major Offers
                      SkeletonizerWidget(child: const ListOfMajorOffersWidget()),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 5.h),
                        child: Row(
                          children: [
                            /// Class List Of Trend
                            const Expanded(
                              child: SkeletonizerWidget(
                                child: ListOfTrendWidget(),
                              ),
                            ),
                            6.w.horizontalSpace,
                            const Expanded(
                              child: SkeletonizerWidget(
                                child: ListOfDiscountWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                 SliverToBoxAdapter(
                  child: SkeletonizerWidget(child: ProductListWidget(product: ProductData.fakeProductData,)),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
