import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.fontColor.withOpacity(.35),
      thickness: 0.7,
      height: 0,
    );
  }
}
