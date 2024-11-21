import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/dropdown_helper.dart';
import 'horizontal_list_of_new_categories_widget.dart';
import 'new_categories_card_widget.dart';
import 'title_and_icon_for_closing_the_drop_down_menu_widget.dart';

class DropDownMenuForNewCategoriesWidget extends StatefulWidget {
  const DropDownMenuForNewCategoriesWidget({super.key});

  @override
  State<DropDownMenuForNewCategoriesWidget> createState() =>
      _DropDownMenuForNewCategoriesWidgetState();
}

class _DropDownMenuForNewCategoriesWidgetState
    extends State<DropDownMenuForNewCategoriesWidget> {
  String tempCategoriesName = newCategories[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Class title and icon for closing the drop-down menu for new categories widget
        const TitleAndIconForClosingTheDropDownMenuWidget(),
        Flexible(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 14.h),
            child: Wrap(
              spacing: 8.w,
              runSpacing: 10.h,
              children: newCategories.map((item) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      tempCategoriesName = item;
                    });
                    DropdownHelper().overlayEntry!.remove();
                    DropdownHelper().overlayEntry = null;
                  },
                  child: NewCategoriesCardWidget(
                    categoriesName: item,
                    tempCategoriesName: tempCategoriesName,
                    alignment: null,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
