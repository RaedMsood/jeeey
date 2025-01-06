import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/home/data/model/section_data.dart';

import '../../../category/presentation/widgets/list_to_display_categories_on_the_home_widget.dart';

class TabBarSubSectionWidget extends StatelessWidget {
  const TabBarSubSectionWidget({super.key,required this.subTabController,required this.sections});
  final TabController subTabController;
  final List<SectionData> sections;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                vertical: 2.sp, horizontal: 8.w),
            child: TabBar(
              controller: subTabController,
              unselectedLabelColor: Colors.black,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                insets:
                EdgeInsets.symmetric(vertical: 10),
              ),
              dividerHeight: 0.001,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: [
                for (var subCategory
                in sections)
                  Tab(text: subCategory.name),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: subTabController,
              children:
              sections.map((subSection) {
                return ListToDisplayCategoriesOnTheHomeWidget(
                  category: subSection.category,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
