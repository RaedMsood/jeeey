import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_get_api_data_widget.dart';
import 'package:jeeey/features/category/presentation/riverpod/category_riverpod.dart';
import '../../../../core/state/state.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/list_to_sub_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/main_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/sub_filter_drawer_widget.dart';
import '../widgets/app_bar_to_filter_subcategory_products_widget.dart';
import '../widgets/list_for_colum_card_subcategories_widget.dart';
import '../widgets/list_for_row_card_subcategories_widget.dart';
import '../widgets/skeletonizer_sub_category_widget.dart';

class SubcategoryProductFilterPage extends ConsumerStatefulWidget {
  const SubcategoryProductFilterPage({super.key, required this.idCategory});
  final int idCategory;

  @override
  ConsumerState<SubcategoryProductFilterPage> createState() =>
      _SubcategoryProductFilterPageState();
}

class _SubcategoryProductFilterPageState
    extends ConsumerState<SubcategoryProductFilterPage> {
  ScrollController _scrollController = ScrollController();
  bool pinCategoriesToTop = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _scrollController.addListener(paginationScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > kToolbarHeight + 40.h) {
      setState(() {
        pinCategoriesToTop = true;
      });
    } else {
      setState(() {
        pinCategoriesToTop = false;
      });
    }
  }

  void paginationScroll() async {
    if (!mounted) return;

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        ref.read(categoryProvider(widget.idCategory ?? 1).notifier)
            .getMainCategoryAndAllProduct(moreData: true);
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
    final state = ref.watch(categoryProvider(widget.idCategory));

    return Scaffold(
       body: state.stateData ==States.loading?const SkeletonizerSubCategoryWidget() :
      CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildSliverAppBar(state),
          _buildMainFilterWidget(state),
          _buildProductList(state),
        ],
      ),
      endDrawer: SubFilterDrawerWidget(),
    );
  }

  SliverAppBar _buildSliverAppBar(state) {
    return appBarToFilterSubcategoryProductsWidget(
      viewType: _getViewType(state),
      flexibleSpace:
         CheckStateInGetApiDataWidget(
           state: state,
           widgetOfData: ListForColumCardSubcategoriesWidget(
            category: state.data.category ?? [],
                   ),
         ),

      bottom: _buildSliverBottom(state),
    );
  }
  int _getViewType(state) {
    if (state.data.category?.isNotEmpty ?? false) {
      return state.data.category![0].hasChildren == true ? 1 : 2;
    }
    return 0;
  }

  PreferredSize _buildSliverBottom(state) {
    return  PreferredSize(
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
      child:  Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 8.h),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  return MainFilterWidget(
                    onTapFilter: () {
                      Scaffold.of(context).openEndDrawer();
                      print(widget.idCategory);
                    },
                  );
                },
              ),
              const ListToSubFilterWidget(),
            ],
          ),
        ),
      );
  }

  SliverToBoxAdapter _buildProductList(state) {
    return SliverToBoxAdapter(
      child: ProductListWidget(
        product: state.data.product!.data,
        isLoadingMore: state.stateData == States.loadingMore,
      ),
    );
  }
}
