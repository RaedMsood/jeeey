import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class DividerWidget extends StatelessWidget {
  final Color? color;
  final double? height;
  const DividerWidget({super.key,this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color:color?? AppColors.greySwatch.shade100,
      thickness: 0.7,
      height:height?? 0,
    );
  }
}
