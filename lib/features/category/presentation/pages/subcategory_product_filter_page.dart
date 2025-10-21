import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_get_api_data_widget.dart';
import 'package:jeeey/core/widgets/skeletonizer_widget.dart';
import 'package:jeeey/features/category/presentation/riverpod/category_riverpod.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/product_data.dart';
import '../../../../core/state/state.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../../../productManagement/filterProducts/presentation/state_mangment/riverpod.dart';
import '../../../productManagement/filterProducts/presentation/view/list_to_sub_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/main_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/sub_filter_drawer_widget.dart';
import '../../../productManagement/search_product/presntation/state_mangment/riverpod.dart';
import '../widgets/app_bar_to_filter_subcategory_products_widget.dart';
import '../widgets/list_for_colum_card_subcategories_widget.dart';
import '../widgets/list_for_row_card_subcategories_widget.dart';
import '../widgets/skeletonizer_sub_category_widget.dart';

class SubcategoryProductFilterPage extends ConsumerStatefulWidget {
  SubcategoryProductFilterPage({super.key,
    this.idCategory,
    this.nameSearch,
    required this.nameCategoryForHintSearch,
    required this.isSearchPage});

  int? idCategory;
  String? nameSearch;
  final String nameCategoryForHintSearch;
  final bool isSearchPage;

  @override
  ConsumerState<SubcategoryProductFilterPage> createState() =>
      _SubcategoryProductFilterPageState();
}

class _SubcategoryProductFilterPageState
    extends ConsumerState<SubcategoryProductFilterPage> {
  ScrollController _scrollController = ScrollController();
  bool pinCategoriesToTop = false;

  // late PaginationHelper paginationHelper;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final shouldPin = _scrollController.offset > kToolbarHeight + 40.h;

    if (shouldPin != pinCategoriesToTop) {
      setState(() {
        pinCategoriesToTop = shouldPin;
      });
    }

    paginationScroll();
  }

  void paginationScroll() async {
    if (!mounted) return;
    final selectedSizes =
    ref.watch(selectedSizesProvider(widget.idCategory ?? 1));
    final selectedUnit =
    ref.watch(selectedUnitsProvider(widget.idCategory ?? 1));
    final selectedColors =
    ref.watch(selectedColorsProvider(widget.idCategory ?? 1));
    final selectedCategory =
    ref.watch(selectedCategoryProvider(widget.idCategory ?? 1));
    final selectedPrice =
    ref.watch(selectedPriceProvider(widget.idCategory ?? 1));
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        if (selectedColors.isNotEmpty ||
            selectedSizes.isNotEmpty ||
            selectedUnit.isNotEmpty ||
            selectedCategory != null ||
            selectedPrice != null) {
          ref.read(filterProductProvider.notifier).getProductOfFilter(
              price: selectedPrice,
              idCategory: widget.idCategory ?? 1,
              idColor: selectedColors,
              idUnit: selectedUnit,
              idSize: selectedSizes,
              idSubCategory: selectedCategory,
              nameSearch:
              widget.isSearchPage ? widget.nameCategoryForHintSearch : '',
              moreData: true);
        } else {
          widget.isSearchPage == false
              ? ref
              .read(categoryProvider(widget.idCategory!).notifier)
              .getMainCategoryAndAllProduct(moreData: true)
              : ref
              .read(informationSearchProvider(widget.nameSearch ?? '')
              .notifier)
              .getInformationSearch(moreData: true);
        }

        print(widget.nameSearch);
        print(widget.idCategory);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.isSearchPage == false
        ? ref.watch(categoryProvider(widget.idCategory ?? 0))
        : ref.watch(informationSearchProvider(widget.nameSearch ?? ''));
    final stateFilter = ref.watch(filterProductProvider);

    return Scaffold(
      body: state.stateData == States.loading
          ? const SkeletonizerSubCategoryWidget()
          : CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildSliverAppBar(state, widget.nameCategoryForHintSearch),
          widget.isSearchPage == true
              ? _buildMainFilterWidget(state)
              : _buildMainFilterWidget(state),
          _buildProductList(state, stateFilter),
        ],
      ),
      endDrawer: SubFilterDrawerWidget(
        sizeFilterList: state.data.sizeFilter ?? [],
        colorFilterList: state.data.colorFilter ?? [],
        categoryFilterList: state.data.category ?? [],
        idCategory: widget.idCategory ?? 1,
        nameSearch: widget.nameSearch ?? '',
        isSearchFilter: widget.isSearchPage,
        unitFilterList: state.data.unitFilter ?? [],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(state, String hintTextSearch) {
    return appBarToFilterSubcategoryProductsWidget(
      idCategory: widget.idCategory ?? 0,
      viewType: _getViewType(state),
      context: context,
      hintTextSearch: hintTextSearch,
      flexibleSpace: CheckStateInGetApiDataWidget(
        state: state,
        widgetOfData: ListForColumCardSubcategoriesWidget(
          category: state.data.category ?? [],
          parentIdCategory: widget.idCategory ?? 1,
          nameSearch: widget.isSearchPage == false
              ? ''
              : widget.nameCategoryForHintSearch,
        ),
      ),
      bottom: state.data.category.isNotEmpty
          ? _buildSliverBottom(state)
          : const PreferredSize(
        preferredSize: Size(0, 0),
        child: SizedBox(),
      ),
    );
  }

  int _getViewType(state) {
    if (state.data.category?.isNotEmpty ?? false) {
      return state.data.category![0].hasChildren == true ? 1 : 2;
    }
    return 0;
  }

  PreferredSize _buildSliverBottom(state) {
    return PreferredSize(
      preferredSize: Size.fromHeight(pinCategoriesToTop ? 40.h : 0),
      child: pinCategoriesToTop
          ? CheckStateInGetApiDataWidget(
        state: state,
        widgetOfData: ListForRowCardSubcategoriesWidget(
          category: state.data.category!,
        ),
      )
          : const SizedBox.shrink(),
    );
  }

  SliverToBoxAdapter _buildMainFilterWidget(state) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 8.h),
        child: Column(
          children: [
            Builder(
              builder: (context) {
                return MainFilterWidget(
                  nameSearch: widget.isSearchPage == false
                      ? ''
                      : widget.nameCategoryForHintSearch,
                  idCategory: widget.idCategory ?? 1,
                  onTapFilter: () {
                    Scaffold.of(context).openEndDrawer();
                    print(widget.idCategory);
                  },
                );
              },
            ),
            ListToSubFilterWidget(
              unitFilterList: state.data.unitFilter ?? [],
              categoryFilterList: state.data.category ?? [],
              sizeFilterList: state.data.sizeFilter ?? [],
              colorFilterList: state.data.colorFilter ?? [],
              idCategory: widget.idCategory ?? 1,
              nameSearch: widget.nameCategoryForHintSearch,
              isSearchFilter: widget.isSearchPage,
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildProductList(state, stateFilter) {
    return SliverToBoxAdapter(
      child: Consumer(
        builder: (context, ref, child) {
          print(widget.isSearchPage);
          final selectedSizes =
          ref.watch(selectedSizesProvider(widget.idCategory ?? 1));
          final selectedUnit =
          ref.watch(selectedUnitsProvider(widget.idCategory ?? 1));
          final selectedColors =
          ref.watch(selectedColorsProvider(widget.idCategory ?? 1));
          final selectedCategory =
          ref.watch(selectedCategoryProvider(widget.idCategory ?? 1));
          final selectedPrice =
          ref.watch(selectedPriceProvider(widget.idCategory ?? 1));
          if (selectedColors.isEmpty &&
              selectedSizes.isEmpty &&
              selectedUnit.isEmpty &&
              selectedCategory == null &&
              selectedPrice == null) {
            return stateFilter.stateData == States.loading
                ? SkeletonizerWidget(
              child: ProductListWidget(
                product: ProductData.fakeProductData,
                isLoadingMore:
                stateFilter.stateData == States.loadingMore,
              ),
            )
                : ProductListWidget(
              product: state.data.product!.data,
              isLoadingMore: state.stateData == States.loadingMore,
            );
          } else {
            return stateFilter.stateData == States.loading
                ? SkeletonizerWidget(
              child: ProductListWidget(
                product: ProductData.fakeProductData,
                isLoadingMore:
                stateFilter.stateData == States.loadingMore,
              ),
            )
                : ProductListWidget(
              product: stateFilter.data.data,
              isLoadingMore: stateFilter.stateData == States.loadingMore,
            );
          }
        },
      ),
    );
  }
}

