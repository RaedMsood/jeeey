import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeeey/features/category/presentation/widgets/app_bar_category_widget.dart';
import '../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../home/presentation/riverpod/sections_riverpod.dart';
import '../widgets/filter_categories_widget.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key});

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage>
    with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool _isTabControllerInitialized = false;

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(sectionProvider);
    try {
      if (!_isTabControllerInitialized) {
        _tabController = TabController(
          length: state.data.section!.length,
          vsync: this,
        );
        _isTabControllerInitialized = true;
      }
    } catch (e) {
      if (kReleaseMode) {
        print("Error initializing TabController in Release mode: $e");
      }
      return const Center(child: CircularProgressIndicator());
    }

    return CheckStateInGetApiDataWidget(
      state: state,
      widgetOfData: Scaffold(
        appBar: appBarCategoryWidget(
          tabController: _tabController,
          sections: state.data.section!,
        ),
        body: TabBarView(
          controller: _tabController,
          children: state.data.section!.map(
            (category) {
               return Row(
                   children: [
                 FilterCategoriesWidget(idSectionsCategory: category.id??1,),
               ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
