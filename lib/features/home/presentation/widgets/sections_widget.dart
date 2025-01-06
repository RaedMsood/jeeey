import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/home/presentation/widgets/skeletonizer_section_widget.dart';
import 'package:jeeey/features/home/presentation/widgets/tab_bar_sub_section_widget.dart';
import '../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../core/state/state.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../../../category/presentation/widgets/list_to_display_categories_on_the_home_widget.dart';
import '../riverpod/sections_riverpod.dart';
import 'carousel_slider_for_offers_widget.dart';
import 'filter_products_home_widget.dart';
import 'list_of_discount_widget.dart';
import 'list_of_major_offers_widget.dart';
import 'list_of_trends_widget.dart';
import 'smooth_page_indicator_widget.dart';

class SectionOfCategoryInHomePage extends ConsumerStatefulWidget {
  SectionOfCategoryInHomePage({
    required this.scrollController,
    required this.idSection,
    super.key,
  });

  ScrollController scrollController;
  int idSection;

  @override
  ConsumerState<SectionOfCategoryInHomePage> createState() =>
      _SectionOfCategoryInHomePageState();
}

class _SectionOfCategoryInHomePageState
    extends ConsumerState<SectionOfCategoryInHomePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    widget.scrollController.addListener(() {
      return paginationScroll();
    });
    super.initState();
  }

  Timer? _debounceTimer;

  void paginationScroll() async {
    if (!mounted) return;
    final sectionId = ref.read(sectionIdProvider);
    if ( widget.scrollController.position.pixels ==
        widget.scrollController.position.maxScrollExtent) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        ref.read(subSectionProvider(widget.idSection).notifier).getSubSectionData(moreData: true);
      });
    }
  }


  late TabController _subTabController;
  final List<String> images = [
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s',
    'https://letsenhance.io/static/03620c83508fc72c6d2b218c7e304ba5/11499/UpscalerAfter.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG1X1dlZuFdyXtSX3gXdycKtVeXGtGOzsfdw&s'
  ];
  int pageController = 0;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _subTabController.dispose();
    super.dispose();
  }

  bool _isTabControllerInitialized = false;

  @override
  Widget build(BuildContext context) {
    double expandedHeight = 120.h;
    //final sectionId = ref.watch(sectionIdProvider);
    var state = ref.watch(subSectionProvider(widget.idSection));
    if (!_isTabControllerInitialized ||
        _subTabController.length != state.data.sections!.length) {
      _subTabController = TabController(
        length: state.data.sections!.length,
        vsync: this,
      );
      _isTabControllerInitialized = true;
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref
              .read(subSectionProvider(widget.idSection).notifier)
              .getSubSectionData(isRefresh: true, moreData: false);
        },
        child: CustomScrollView(
          controller: widget.scrollController,
          physics: state.stateData == States.loading
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
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
            ),
            SliverToBoxAdapter(
              child: CheckStateInGetApiDataWidget(
                state: state,
                widgetOfLoading: const SkeletonizerSectionWidget(),
                widgetOfData: Column(
                  children: [
                    if (state.data.sections!.isEmpty == false)
                      state.data.sections![0].hasSubSection == "true"
                          ? TabBarSubSectionWidget(
                              sections: state.data.sections!,
                              subTabController: _subTabController,
                            )
                          : ListToDisplayCategoriesOnTheHomeWidget(
                              category: state.data.sections![0].category ?? [],
                            ),

                    /// Class ListOf Major Offers
                    const ListOfMajorOffersWidget(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
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
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: FilterProductsHomeWidget(),
            ),
            SliverToBoxAdapter(
              child: ProductListWidget(
                isLoadingMore:
                    state.stateData == States.loadingMore ? true : false,
                product: state.data.product!.data,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
