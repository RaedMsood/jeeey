import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'main_filter_widget.dart';

class SliverPersistentHeaderMainFilterWidget
    extends SliverPersistentHeaderDelegate {
  final VoidCallback? onTapFilter;

  const SliverPersistentHeaderMainFilterWidget({this.onTapFilter});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return MainFilterWidget(
      onTapFilter: onTapFilter,
      idCategory: 0,
      nameSearch: '',
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
