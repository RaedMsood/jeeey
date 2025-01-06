import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';

class AppBarForMyOrdersWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarForMyOrdersWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(48.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0.0,
      titleSpacing: 0,
      centerTitle: true,
      title: const AutoSizeTextWidget(
        text: "الطلب",
        fontWeight: FontWeight.w600,

      ),
      leading: const IconButtonWidget(),
    );
  }
}
