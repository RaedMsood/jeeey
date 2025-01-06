import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class ListTileSettingsWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ListTileSettingsWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: AutoSizeTextWidget(
        text: title,
        fontSize: 12.8.sp,
        colorText: Colors.black87,
      ),
      trailing: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: SvgPicture.asset(AppIcons.arrowLeft),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      dense: true,
      tileColor: Colors.white,
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 18.w),
    );
  }
}
