import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/helpers/flash_bar_helper.dart';

import '../view/main_filter_widget.dart';

class SliverPersistentHeaderMainFilterWidget
    extends SliverPersistentHeaderDelegate {
  final VoidCallback? onTapFilter;

  const SliverPersistentHeaderMainFilterWidget({this.onTapFilter});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return MainFilterWidget(
      onTapFilter: onTapFilter,
    );
  }

  @override
  double get maxExtent => 28.h;

  @override
  double get minExtent => 28.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
