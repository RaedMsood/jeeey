import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';

class AppBarMapWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMapWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(68.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 68.h,
      backgroundColor: AppColors.scaffoldColor,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      title: Image.asset(
        AppImages.logo,
        height: 60.h,
      ),
      leading: IconButtonWidget(
        icon: AppIcons.arrowBack,
        height: 22.h,
      ),
    );
  }
}
