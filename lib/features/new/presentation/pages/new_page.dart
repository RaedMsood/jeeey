import 'package:flutter/material.dart';
import '../../../../core/widgets/product_list_widget.dart';
import '../widgets/app_bar_new_widget.dart';
import '../widgets/daily_new_widget.dart';
import '../widgets/new_categories_widget.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarNewWidget(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: DailyNewWidget(),
          ),

          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: NewCategoriesWidget(

              scrollController: _scrollController,
            ),
          ),
          // SliverToBoxAdapter(
          //   child: ProductListWidget(
          //     gradient: true,
          //   ),
          // ),
        ],
      ),
    );
  }
}
