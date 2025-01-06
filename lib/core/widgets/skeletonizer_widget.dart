import 'package:flutter/material.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerWidget extends StatelessWidget {
  const SkeletonizerWidget({super.key,required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect.raw(
        colors: [

          Colors.grey[100]!,
          Colors.grey[300]!,

        ],
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        duration:const Duration(seconds: 2),
         tileMode: TileMode.mirror,
      ),


        child: child
    );
  }
}
