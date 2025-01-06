import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jeeey/core/helpers/flash_bar_helper.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/features/category/presentation/widgets/app_bar_category_widget.dart';

import '../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../core/widgets/online_images_widget.dart';
import '../../../home/presentation/widgets/app_bar_home_widget.dart';
import '../riverpod/category_riverpod.dart';
import '../widgets/circle_card_for_categories_widget.dart';
import '../widgets/filter_categories_widget.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key});

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController=TabController(length:1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<String> items = [
    "Item 1",
    "Longer Item 2 with more text to make it taller",
    "Item 3",
    "Item 5",
    "Short 6",
    "Item 8",
    "Item 9",
    "Item 1",
    "Longer Item 2 with more text to make it taller",
    "Item 3",
    "Item 5",
    "Short 6",
    "Item 8",
    "Item 9",
    "Item 1",
    "Longer Item 2 with more text to make it taller",
    "Item 3",
    "Item 5",
    "Short 6",
    "Item 8",
    "Item 9",
  ];
  final int idCategory=0;
  List<String> name=[];
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryProvider(idCategory));
   // setState(() {
    //  _tabController=TabController(length:state.data.category!.length , vsync: this);
    //});
    return CheckStateInGetApiDataWidget(
      state: state,
      widgetOfData: Scaffold(
        appBar: appBarCategoryWidget(
          tabController: _tabController,
          category: state.data.category!,
        ),
        body: DefaultTabController(
          length: state.data.category!.length,
          child: TabBarView(
            controller: _tabController,
            children: state.data.category!.map(
              (category) {
                 return Row(children: [
                  /// Class Filter Categories Widget
                   FilterCategoriesWidget(),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.42,
                    color: Colors.white,
                    child: GridView.builder(
                        padding: EdgeInsets.all(12.sp),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // عدد الأعمدة
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                childAspectRatio: 0.75),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                            },
                            child: CircleCardForCategoriesWidget(
                              idCategory: 3,
                              image:
                                  'https://artic.fakera.com/wp-content/uploads/2020/06/IMG-20200615-WA0083.jpg',
                              name: items[index],
                              circularRadius: 32.sp,
                            ),
                          );
                        }),
                  ),
                ]);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
