import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class ListTileSettingsWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? fontSize;

  const ListTileSettingsWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: AutoSizeTextWidget(
        text: title,
        fontSize:fontSize?? 11.sp,
        colorText: Colors.black87,
      ),
      trailing: Icon(
        Localizations.localeOf(context).languageCode == "ar"
            ? Icons.keyboard_arrow_left
            : Icons.keyboard_arrow_right,
        color: AppColors.primarySwatch.shade700,
        size: 18.r,
      ),
      titleAlignment: ListTileTitleAlignment.center,
      dense: true,
      tileColor: Colors.white,
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 18.w),
    );
  }
}
