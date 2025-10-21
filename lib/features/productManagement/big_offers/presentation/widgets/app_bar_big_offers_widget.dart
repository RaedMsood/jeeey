import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../generated/l10n.dart';

class AppBarBigOffersWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBigOffersWidget({super.key});
  @override
  Size get preferredSize => Size.fromHeight(60.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      titleSpacing: 0,
      leadingWidth: 40.w,
      toolbarHeight: 68.h,

      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      title: Padding(
        padding:  EdgeInsets.only(top: 18.h),
        child: AutoSizeTextWidget(
          text: S.of(context).bigOffers,
          fontSize: 13.5.sp,
          colorText: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Padding(
        padding:  EdgeInsets.only(top: 18.h),
        child: IconButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Localizations.localeOf(context).languageCode == "ar"
                ? Icons.arrow_back_ios_rounded
                : Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 18.r,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          AppImages.bigOffers,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
