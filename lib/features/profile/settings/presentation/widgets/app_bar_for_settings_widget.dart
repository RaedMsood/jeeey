import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';

class AppBarForSettingsWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const AppBarForSettingsWidget({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(46.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0.0,
      titleSpacing: 0,
      title: AutoSizeTextWidget(
        text: title,
        fontWeight: FontWeight.w600,
      ),
      leading: const IconButtonWidget(),
    );
  }
}
