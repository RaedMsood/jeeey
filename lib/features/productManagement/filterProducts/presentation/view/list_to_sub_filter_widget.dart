import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/constants/app_icons.dart';

import '../widgets/sub_filter_design_widget.dart';

final List<String> subFilter = [
  'تصاميم',
  'لون',
  'مقاس',
  'اصناف',
  'نوع',
  'حجم كبير',
  'اصناف',
  'نوع',
  'حجم',
  'الخ'
];

class ListToSubFilterWidget extends StatelessWidget {
  const ListToSubFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: subFilter.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SubFilterDesignWidget(
                title: subFilter[index],
                icon: AppIcons.arrowBottom,
              ),
              6.w.horizontalSpace,
            ],
          );
        },
      ),
    );
  }
}
