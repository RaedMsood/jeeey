import 'package:flutter/material.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';

AppBar appBarCoponsWidget({
  TabController? tabController,
}) {
  return AppBar(
    leading: const IconButtonWidget(
      icon: AppIcons.arrowBack,
    ),
    title: const TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      dividerHeight: 0,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      tabs: [
        Tab(
          text: 'غير مستخدم',
        ),
        Tab(
          text: 'المستعملة',
        ),
        Tab(
          text: 'انتهت الصلاحية',
        ),
      ],
    ),
  );
}
