// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:jeeey/features/category/data/model/category_data.dart';
// import 'package:jeeey/features/category/presentation/riverpod/section_riverpod.dart';
// import 'package:jeeey/features/home/presentation/widgets/smooth_page_indicator_widget.dart';
// import '../../../../core/widgets/product_list_widget.dart';
// import '../../../category/presentation/widgets/list_to_display_categories_on_the_home_widget.dart';
// import '../../../productManagement/detailsProducts/data/model/product_data.dart';
// import '../riverpod/sections_riverpod.dart';
// import 'carousel_slider_for_offers_widget.dart';
// import 'filter_products_home_widget.dart';
// import 'list_of_discount_widget.dart';
// import 'list_of_major_offers_widget.dart';
// import 'list_of_trends_widget.dart';
//
// class AllSectionInHomePage extends ConsumerStatefulWidget {
//   const AllSectionInHomePage({super.key,required this.categoryOfAll,required this.productsOfAll,required this.scrollController});
//   final List<CategoryData> categoryOfAll;
//   final List<ProductData> productsOfAll;
//   final ScrollController scrollController;
//   @override
//   ConsumerState<AllSectionInHomePage> createState() => _AllSectionInHomePageState();
// }
//
// class _AllSectionInHomePageState extends ConsumerState<AllSectionInHomePage>with TickerProviderStateMixin  {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    // _scrollController = ScrollController();
//     //_scrollController.addListener(_onScroll);
//   }
//   // void _onScroll() {
//   //   if (_scrollController.offset > kToolbarHeight + 20.h) {
//   //     setState(() {
//   //       print(_scrollController.offset);
//   //       ref.read(sectionProvider.notifier).colorIconOfAppBar(Colors.black);
//   //
//   //     });
//   //   } else {
//   //     setState(() {
//   //       ref.read(sectionProvider.notifier).colorIconOfAppBar(Colors.white);
//   //     });
//   //   }
//   //   if (_scrollController.offset > kToolbarHeight + 50.h) {
//   //     setState(() {
//   //       ref.read(sectionProvider.notifier).coloBackGroundOfAppBar(Colors.white);
//   //     });
//   //   } else {
//   //     setState(() {
//   //       ref.read(sectionProvider.notifier).coloBackGroundOfAppBar(Colors.transparent);
//   //     });
//   //   }
//   // }
//
//
//   //ScrollController _scrollController = ScrollController();
//   final List<String> images = [
//     'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s',
//     'https://letsenhance.io/static/03620c83508fc72c6d2b218c7e304ba5/11499/UpscalerAfter.jpg',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG1X1dlZuFdyXtSX3gXdycKtVeXGtGOzsfdw&s'
//   ];
//   int pageController = 0;
//   @override
//   void dispose() {
//     //_tabController.dispose();
//     //  _scrollController.removeListener(_onScroll);
//     // _scrollController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     double expandedHeight = 120.h;
//
//
//     return  NotificationListener<ScrollNotification>(
//         onNotification: (
//         ScrollNotification scrollNotification,
//     ) {
//       setState(() {
//         ref.read(sectionProvider.notifier).getOffsetNumberOfHomePage(scrollNotification.metrics.pixels);
//
//       });
//       return true;
//     },
//       child: CustomScrollView(
//           physics: const AlwaysScrollableScrollPhysics(),
//           controller: widget.scrollController,
//           slivers: [
//             SliverAppBar(
//               expandedHeight: expandedHeight,
//               pinned: false,
//               stretch: true,
//               backgroundColor: Colors.white,
//
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     CarouselSliderForOffersWidget(
//                       images: images,
//                       onPageChanged: (index, reason) {
//                         setState(() {
//                           pageController = index;
//                         });
//                       },
//                     ),
//                     SmoothPageIndicatorWidget(
//                       pageController: pageController,
//                       count: images.length,
//                     ),
//                   ],
//                 ),
//               ),
//               // backgroundColor: Colors.red,
//             ),
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   /// Class List To Display Categories On The Home
//                    ListToDisplayCategoriesOnTheHomeWidget(category: widget.categoryOfAll,),
//
//                   /// Class ListOf Major Offers
//                   const ListOfMajorOffersWidget(),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: 8.w, vertical: 5.h),
//                     child: Row(
//                       children: [
//                         /// Class List Of Trend
//                         const Expanded(child: ListOfTrendWidget()),
//                         6.w.horizontalSpace,
//
//                         /// Class List Of Discount
//                         const Expanded(child: ListOfDiscountWidget()),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SliverPersistentHeader(
//               pinned: true,
//               floating: false,
//               delegate: FilterProductsHomeWidget(),
//             ),
//              SliverToBoxAdapter(
//               child: ProductListWidget(product: widget.productsOfAll,),
//             ),
//           ],
//         ),
//     );
//   }
// }
