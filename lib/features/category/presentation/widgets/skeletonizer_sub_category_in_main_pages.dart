import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/skeletonizer_widget.dart';
import '../../data/model/category_data.dart';
import 'circle_card_for_categories_widget.dart';

class SkeletonizerSubCategoryInMainPages extends StatelessWidget {
  const SkeletonizerSubCategoryInMainPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width / 1.42,
      color: Colors.white,
      child: SkeletonizerWidget(
        child: Wrap(
          spacing: 8.0.w,
          runSpacing: 10.0.h,
          children: CategoryData.fakeCategoriesData.map((item) {
            return CircleCardForCategoriesWidget(
              idCategory: item.id!,
              name: item.name!,
              image:
              'https://eyess.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F07%2F2138-1.jpg&n=Flq38TbBQfHfEB8rSZ0XQ',
            );
          }).toList(),
        ),
      ),
    );
  }
}
