import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jeeey/core/helpers/flash_bar_helper.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/features/category/presentation/widgets/app_bar_category_widget.dart';

import '../../../../core/widgets/online_images_widget.dart';
import '../../../home/presentation/widgets/sliver_appbar_home_widget.dart';
import '../widgets/circle_card_for_categories_widget.dart';
import '../widgets/filter_categories_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCategoryWidget(
        tabController: _tabController,
      ),
      body: DefaultTabController(
        length: categories.length,
        child: TabBarView(
          controller: _tabController,
          children: categories.map((category) {
            return Row(
              children: [
                /// Class Filter Categories Widget
                const FilterCategoriesWidget(),
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
                      return CircleCardForCategoriesWidget(
                        image:
                            'https://artic.fakera.com/wp-content/uploads/2020/06/IMG-20200615-WA0083.jpg',
                        name: items[index],
                        circularRadius: 32.sp,
                      );
                      // return Column(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     OnlineImagesWidget(
                      //       imageUrl:'https://artic.fakera.com/wp-content/uploads/2020/06/IMG-20200615-WA0083.jpg',
                      //       circularImage: true,
                      //       circularRadius:  32.sp,
                      //     ),
                      //     2.h.verticalSpace,
                      //     Flexible(
                      //       child: AutoSizeTextWidget(
                      //         text: items[index],
                      //         fontSize: 10.sp,
                      //         fontWeight: FontWeight.w500,
                      //         maxLines: 2,
                      //         minFontSize: 10,
                      //
                      //         textAlign: TextAlign.center,
                      //       ),
                      //     ),
                      //   ],
                      // );
                    },
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
