import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../category/presentation/widgets/list_to_display_categories_on_the_home_widget.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../widgets/carousel_slider_for_offers_widget.dart';
import '../widgets/filter_products_home_widget.dart';
import '../widgets/list_of_discount_widget.dart';
import '../widgets/list_of_major_offers_widget.dart';
import '../widgets/list_of_trends_widget.dart';
import '../widgets/app_bar_home_widget.dart';
import '../widgets/smooth_page_indicator_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  Color iconColor = Colors.white;
  int pageController = 0;
  late TabController _tabController;
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
    _tabController = TabController(length: categories.length, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > kToolbarHeight + 20.h) {
      setState(() {
        iconColor = Colors.black;
      });
    } else {
      setState(() {
        iconColor = Colors.white;
      });
    }
    if (_scrollController.offset > kToolbarHeight + 50.h) {
      setState(() {
        appBarColor = Colors.white;
      });
    } else {
      setState(() {
        appBarColor = Colors.transparent;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double expandedHeight = 120.h;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      extendBodyBehindAppBar: true,
      appBar: appBarHomeWidget(
        tabController: _tabController,
        iconColor: iconColor,
        appBarColor: appBarColor,
      ),
      body: DefaultTabController(
        length: categories.length,
        child: TabBarView(
          controller: _tabController,
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
                        CarouselSliderForOffersWidget(
                          images: images,
                          onPageChanged: (index, reason) {
                            setState(() {
                              pageController = index;
                            });
                          },
                        ),
                        SmoothPageIndicatorWidget(
                          pageController: pageController,
                          count: images.length,
                        ),
                      ],
                    ),
                  ),
                  // backgroundColor: Colors.red,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      /// Class List To Display Categories On The Home
                      const ListToDisplayCategoriesOnTheHomeWidget(),

                      /// Class ListOf Major Offers
                      const ListOfMajorOffersWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 5.h),
                        child: Row(
                          children: [
                            /// Class List Of Trend
                            const Expanded(child: ListOfTrendWidget()),
                            6.w.horizontalSpace,

                            /// Class List Of Discount
                            const Expanded(child: ListOfDiscountWidget()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: FilterProductsHomeWidget(),
                ),
                const SliverToBoxAdapter(
                  child: ProductListWidget(),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
