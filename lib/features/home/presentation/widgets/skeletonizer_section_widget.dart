import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/skeletonizer_widget.dart';
import '../../../category/data/model/category_data.dart';
import '../../../category/presentation/widgets/list_to_display_categories_on_the_home_widget.dart';
import 'list_of_major_offers_widget.dart';

class SkeletonizerSectionWidget extends StatelessWidget {
  const SkeletonizerSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SkeletonizerWidget(
      child: Column(
        children: [
          ListToDisplayCategoriesOnTheHomeWidget(
            category: CategoryData.fakeCategoriesData,
          ),
          const ListOfMajorOffersWidget(),
        ],
      ),
    );
  }
}
