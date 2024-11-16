import 'package:flutter/material.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/list_to_sub_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/widgets/sliver_persistent_header_main_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/sub_filter_drawer_widget.dart';
import '../widgets/app_bar_recommend_widget.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRecommendWidget(context: context),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverPersistentHeaderMainFilterWidget(
                  onTapFilter: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: ListToSubFilterWidget(),
              ),
              const SliverToBoxAdapter(
                child: ProductListWidget(),
              ),
            ],
          );
        },
      ),
      endDrawer: SubFilterDrawerWidget(),
    );
  }
}
