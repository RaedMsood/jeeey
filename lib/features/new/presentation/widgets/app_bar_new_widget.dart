import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../generated/l10n.dart';

class AppBarNewWidget extends StatelessWidget implements PreferredSizeWidget {
   AppBarNewWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(48.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leadingWidth: 66.w,
      title: AutoSizeTextWidget(
        text: S.of(context).neww,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.w.horizontalSpace,
          Expanded(
            child: InkWellButtonWidget(
              icon: AppIcons.message,
              onPressed: () {},
            ),
          ),
          4.w.horizontalSpace,
          Expanded(
            child: InkWellButtonWidget(
              icon: AppIcons.search,
              height: 17.h,
              onPressed: () {},
            ),
          ),
        ],
      ),
      actions: [
        IconButtonWidget(
          icon: AppIcons.wishlist,
          onPressed: () {},
        ),
      ],
    );
  }
}
