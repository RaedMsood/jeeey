import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'auto_size_text_widget.dart';
import 'buttons/icon_button_widget.dart';

class SecondaryAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool? centerTitle;
  final FontWeight? fontWeight;
  final double? fontSize;

  const SecondaryAppBarWidget({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Size get preferredSize => Size.fromHeight(48.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0.0,
      titleSpacing: 0,
      centerTitle: centerTitle,
      title: AutoSizeTextWidget(
        text: title,
        fontSize: fontSize ?? 13.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
      leading: const IconButtonWidget(),
    );
  }
}
