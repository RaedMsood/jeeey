import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/list_to_sub_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/main_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/sub_filter_drawer_widget.dart';
import '../widgets/app_bar_to_filter_subcategory_products_widget.dart';
import '../widgets/list_for_colum_card_subcategories_widget.dart';
import '../widgets/list_for_row_card_subcategories_widget.dart';

class SubcategoryProductFilterPage extends StatefulWidget {
  const SubcategoryProductFilterPage({super.key});

  @override
  State<SubcategoryProductFilterPage> createState() =>
      _SubcategoryProductFilterPageState();
}

class _SubcategoryProductFilterPageState
    extends State<SubcategoryProductFilterPage> {
  ScrollController _scrollController = ScrollController();
  bool pinCategoriesToTop = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
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

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          appBarToFilterSubcategoryProductsWidget(
            viewType: 2,
            flexibleSpace: const ListForColumCardSubcategoriesWidget(
              viewType: 2,
            ),
            bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(pinCategoriesToTop == true ? 40.h : 0),
                child: pinCategoriesToTop == true
                    ? const ListForRowCardSubcategoriesWidget(
                        circularImage: false)
                    : SizedBox.shrink()),
            // bottom: ,
          ),
          SliverToBoxAdapter(
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 8.h),
                child: Column(
                  children: [
                    Builder(
                      builder: (context) {
                        return MainFilterWidget(
                          onTapFilter: () {
                            Scaffold.of(context).openEndDrawer();

                          },
                        );
                      },
                    ),
                    const ListToSubFilterWidget(),
                  ],
                )),
          ),
          const SliverToBoxAdapter(
            child: ProductListWidget(),
          ),
        ],
      ),
      endDrawer:
           SubFilterDrawerWidget(),
    );
  }
}
