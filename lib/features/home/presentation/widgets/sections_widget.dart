import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/skeletonizer_widget.dart';
import '../../../../core/state/state.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../../../productManagement/detailsProducts/data/model/product_data.dart';
import '../riverpod/sections_riverpod.dart';
import 'carousel_slider_for_offers_widget.dart';
import 'check_sub_section_and_category_widget.dart';
import 'filter_products_home_widget.dart';

class SectionOfCategoryInHomePage extends ConsumerStatefulWidget {
  const SectionOfCategoryInHomePage({
    required this.idSection,
    required this.scrollController,
    super.key,
  });

  final int idSection;
  final ScrollController scrollController;

  @override
  ConsumerState<SectionOfCategoryInHomePage> createState() =>
      _SectionOfCategoryInHomePageState();
}

class _SectionOfCategoryInHomePageState
    extends ConsumerState<SectionOfCategoryInHomePage>
    with AutomaticKeepAliveClientMixin<SectionOfCategoryInHomePage> {
  Timer? _debounceTimer;
  bool isLoadingMore = false;
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    var numberFilter =
        ref.watch(getSectionFilterTypeProvider(widget.idSection));
    if (!mounted) return;

    if (widget.scrollController.position.pixels ==
        widget.scrollController.position.maxScrollExtent) {
      if (!isLoadingMore) {
        setState(() {
          isLoadingMore = true;
        });

        _debounceTimer?.cancel();
        _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
          try {
            await ref
                .read(subSectionProvider(
                        Tuple2(widget.idSection, numberFilter ?? 1))
                    .notifier)
                .getSubSectionData(moreData: true);
          } finally {
            setState(() {
              isLoadingMore = false;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    double expandedHeight = 120.h;
    var numberFilter =
        ref.watch(getSectionFilterTypeProvider(widget.idSection));
    var state = ref.watch(subSectionProvider(Tuple2(widget.idSection, 1)));

    return RefreshIndicator(
      onRefresh: () async {
        await ref
            .read(
                subSectionProvider(Tuple2(widget.idSection, numberFilter ?? 1))
                    .notifier)
            .getSubSectionData(isRefresh: true, moreData: false);
      },
      child: CustomScrollView(
        controller: widget.scrollController,
        physics: state.stateData == States.loading
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.white,
            expandedHeight: expandedHeight,
            pinned: false,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  state.stateData == States.loading
                      ? SkeletonizerWidget(
                          child: CarouselSliderForOffersWidget(
                            onPageChanged: (index, y) {},
                            heightImage: double.infinity,
                            images: const [
                              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                            ],
                          ),
                        )
                      : CarouselSliderForOffersWidget(
                          onPageChanged: (index, y) {},
                          heightImage: double.infinity,
                          images: state.data.imageBanner ?? [],
                        ),
                ],
              ),
            ),
          ),
          CheckSubSectionAndCategoryWidget(
            state: state,
          ),
          SliverToBoxAdapter(
            child: FilterProductsHomeWidget(
              idSection: widget.idSection,
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer(
              builder: (context, ref, child) {
                if (numberFilter != 1) {
                  state = ref.watch(subSectionProvider(
                      Tuple2(widget.idSection, numberFilter ?? 1)));
                }
                return state.stateData == States.loading
                    ? SkeletonizerWidget(
                        child: ProductListWidget(
                        product: ProductData.fakeProductData,
                      ))
                    : FadeIn(
                        child: ProductListWidget(
                          isLoadingMore: isLoadingMore,
                          product: state.data.product?.data ?? [],
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
