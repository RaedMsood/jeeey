import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'icons_of_appbar_details_widget.dart';

class MainAppBarOfDetailsWidget extends StatelessWidget {
  const MainAppBarOfDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,

      centerTitle: true,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.sp),
        child: IconsOfAppbarDetailsWidget(
          onPressed: (){
            Navigator.pop(context);
          },
            icon: Icons.arrow_back_ios),
      ),
      //leadingWidth: 40.w,

      actions: const [
        Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            IconsOfAppbarDetailsWidget(icon: Icons.search),
            IconsOfAppbarDetailsWidget(
                icon: Icons.shopping_basket_outlined),
            IconsOfAppbarDetailsWidget(icon: Icons.share),
            IconsOfAppbarDetailsWidget(
                icon: Icons.density_medium_sharp),
          ],
        ),
      ],
    );
  }
}
