import 'package:flutter/material.dart';
import '../../../../core/widgets/app_bar_for_recommendations_and_daily_news_widget.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../productManagement/filterProducts/presentation/view/list_to_sub_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/sliver_persistent_header_main_filter_widget.dart';
import '../../../productManagement/filterProducts/presentation/view/sub_filter_drawer_widget.dart';

class DailyNewPage extends StatelessWidget {
  const DailyNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarForRecommendationsAndDailyNews(
        title: S.of(context).dailyNew,
      ),
      body: CustomScrollView(
        slivers: [
          Builder(
            builder: (context) {
              return SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverPersistentHeaderMainFilterWidget(
                  onTapFilter: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: ListToSubFilterWidget(),
          ),
          // const SliverToBoxAdapter(
          //   child: ProductListWidget(
          //
          //   ),
          // ),
        ],
      ),
      endDrawer: const SubFilterDrawerWidget(),
    );
  }
}
