import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/helpers/dropdown_helper.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';
import 'drop_down_menu_for_new_categories_widget.dart';

class ShowDropDownMenuButtonForNewCategoriesWidget extends StatelessWidget {
  final ScrollController scrollController;
  final double shrinkOffset;

  const ShowDropDownMenuButtonForNewCategoriesWidget({
    super.key,
    required this.scrollController,
    required this.shrinkOffset,
  });

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.offset + 160.h,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWellButtonWidget(
      icon: AppIcons.menu,
      height: 21.h,
      onPressed: shrinkOffset == 0.0
          ? () async {
              _scrollDown();
              Future.delayed(
                const Duration(milliseconds: 400),
              ).then((value) async {
                DropdownHelper().toggleDropdown(
                  context: context,
                  items: const DropDownMenuForNewCategoriesWidget(),
                  top: 38,
                );
              });
            }
          : () {
              DropdownHelper().toggleDropdown(
                context: context,
                items: const DropDownMenuForNewCategoriesWidget(),
                top: 38,
              );
            },
    );
  }
}
