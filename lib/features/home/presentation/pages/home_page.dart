import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../core/widgets/online_images_widget.dart';
import '../../../category/presentation/widgets/list_to_display_categories_on_the_home_widget.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../widgets/carousel_slider_for_offers_widget.dart';
import '../widgets/filter_products_home_widget.dart';
import '../widgets/list_of_discount_widget.dart';
import '../widgets/list_of_major_offers_widget.dart';
import '../widgets/list_of_trends_widget.dart';
import '../widgets/sliver_appbar_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
   ScrollController _scrollController = ScrollController();

  Color iconColor = Colors.white;

  void _updateIconColor(double offset, double expandedHeight) {
    setState(() {
      iconColor = offset > expandedHeight - kToolbarHeight
          ? Colors.black
          : Colors.white;
    });
  }

  final List<String> images = [
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s',
    'https://letsenhance.io/static/03620c83508fc72c6d2b218c7e304ba5/11499/UpscalerAfter.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG1X1dlZuFdyXtSX3gXdycKtVeXGtGOzsfdw&s',
  ];
  int _currentImageIndex = 0;

  late TabController _tabController;
  Color appBarColor=Colors.transparent;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }
  void _onScroll() {
    if (_scrollController.offset > kToolbarHeight+20.h) {  // يمكنك تعديل الرقم لتحديد الموضع
      setState(() {
        iconColor = Colors.black;
      });
    } else {
      setState(() {
        iconColor = Colors.white;
      });
    }
    if(_scrollController.offset>kToolbarHeight+ 50.h){
      setState(() {
        appBarColor=Colors.white;
      });
    }else{
      setState(() {
        appBarColor=Colors.transparent;
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
    double expandedHeight=140.h;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
       // extendBodyBehindAppBar:appBarColor==Colors.white?false: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 6.w,
        leadingWidth: 62.w,
        backgroundColor: appBarColor,
        title: Container(
          height: 24.h,
          width: double.infinity,
          color: Colors.white54,
          child: Row(
            children: [
              4.w.horizontalSpace,
              Expanded(
                child: AutoSizeTextWidget(
                  text: "جاكيت",
                  colorText: iconColor == Colors.black
                      ? AppColors.greySwatch.shade600
                      : Colors.white,
                  fontSize: 12.sp,
                ),
              ),
              InkWellButtonWidget(
                icon: AppIcons.camera,
                height: 12.5.h,
                iconColor: iconColor == Colors.black
                    ? AppColors.greySwatch.shade600
                    : Colors.white,
                onPressed: () {},
              ),
              6.w.horizontalSpace,
              Container(
                height: 24.h,
                color: iconColor,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: InkWellButtonWidget(
                  icon: AppIcons.search,
                  iconColor:
                      iconColor == Colors.black ? Colors.white : Colors.black,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            14.w.horizontalSpace,
            Expanded(
              child: InkWellButtonWidget(
                icon: AppIcons.message,
                iconColor: iconColor,
                onPressed: () {},
              ),
            ),
            4.w.horizontalSpace,
            Expanded(
              child: InkWellButtonWidget(
                icon: AppIcons.calender,
                iconColor: iconColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWellButtonWidget(
                icon: AppIcons.wishlist,
                iconColor: iconColor,
                onPressed: () {},
              ),
              14.w.horizontalSpace,
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.h),
          child: Row(
            children: [
              Expanded(
                child: TabBar(
                  controller: _tabController,
                  unselectedLabelStyle: TextStyle(color: iconColor),
                  labelColor: iconColor,
                  dividerHeight: 0.001,
                  unselectedLabelColor: iconColor,
                  tabAlignment: TabAlignment.start,
                  // controller: _tabController,
                  isScrollable: true,
                  tabs: categories.map((category) {
                    return Tab(text: category);
                  }).toList(),
                ),
              ),
              Container(
                  width: 1.w,
                  height: 20.h,
                  color: AppColors.greySwatch.shade50.withOpacity(0.5)),
              8.w.horizontalSpace,
              InkWellButtonWidget(
                icon: AppIcons.menu,
                height: 21.h,
                iconColor:
                    iconColor == Colors.black ? Colors.black : Colors.white,
                onPressed: () {},
              ),
              14.w.horizontalSpace,
            ],
          ),
        ),
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
                      // fit: StackFit.expand,
                      alignment: Alignment.bottomCenter,
                      children: [

                        OnlineImagesWidget(
                          imageUrl: images[_currentImageIndex],
                          fit: BoxFit.fill,
                          // size: Size(double.infinity,double.infinity),
                        ),
                        CarouselSliderForOffersWidget(
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // backgroundColor: Colors.red,
                ),

                // SliverToBoxAdapter(
                //   child: Stack(
                //       // fit: StackFit.expand,
                //       alignment: Alignment.bottomCenter,
                //     children: [
                //       OnlineImagesWidget(
                //         imageUrl: images[_currentImageIndex],
                //         fit: BoxFit.fill,
                //         size: Size(double.infinity,220.h),
                //       ),
                //       CarouselSliderForOffersWidget(
                //             onPageChanged: (index, reason) {
                //               setState(() {
                //                 _currentImageIndex = index;
                //               });
                //             },
                //       ),
                //     ],
                //   ),
                // ),

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
                SliverToBoxAdapter(
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

// SliverPersistentHeader(
//   pinned: true,
//   floating: false,
//   delegate: SliverAppBarHomeWidget(
//     expandedHeight: expandedHeight,
//     iconColor: _iconColor,
//     image: images[_currentImageIndex],
//     onPageChanged: (index, reason) {
//       setState(() {
//         _currentImageIndex = index;
//       });
//     },
//   ),
// ),
