import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/skeletonizer_widget.dart';

class SkeletonizerOfCardCoponWidget extends StatelessWidget {
  const SkeletonizerOfCardCoponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => SkeletonizerWidget(
              child: Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Container(
                  color: Colors.grey[100],
                  width: double.infinity,
                  height: 130.h,
                ),
              ))),
    );
  }
}
