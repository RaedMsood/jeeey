import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';

class AppBarAddressWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool action;
  final VoidCallback? onTapAction;

  const AppBarAddressWidget({
    super.key,
    required this.title,
    this.action = false,
    this.onTapAction,
  });

  @override
  Size get preferredSize => Size.fromHeight(48.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      title: AutoSizeTextWidget(
        text: title,
        fontWeight: FontWeight.w600,
      ),
      leading: IconButtonWidget(
        icon: AppIcons.arrowBack,
        height: 22.h,
      ),
      actions: [
        Visibility(
          visible: action,
          child: IconButtonWidget(
            icon: AppIcons.trash,
            onPressed: onTapAction,
          ),
        ),
      ],
    );
  }
}
