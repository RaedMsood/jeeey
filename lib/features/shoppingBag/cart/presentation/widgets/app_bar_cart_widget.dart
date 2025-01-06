import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../../generated/l10n.dart';



class AppBarCartWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCartWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(48.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0.0,
      title:  AutoSizeTextWidget(
        text: S.of(context).shoppingBag,
        fontWeight: FontWeight.w600,
      ),
      actions: [
        8.w.horizontalSpace,
        InkWellButtonWidget(
          icon: AppIcons.sharing,
          onPressed: () {},
        ),
        IconButtonWidget(
          icon: AppIcons.wishlist,
          onPressed: () {},
        ),
      ],
    );
  }
}
