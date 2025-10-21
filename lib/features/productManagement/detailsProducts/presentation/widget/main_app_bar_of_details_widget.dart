import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/widgets/bottomNavbar/bottom_navigation_bar_widget.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../../services/firebase/deep_link_services.dart';
import '../../../search_product/presntation/page/search_page.dart';
import 'icons_of_appbar_details_widget.dart';

class MainAppBarOfDetailsWidget extends StatelessWidget {
  final String nameForShare;
  final String descriptionForShare;
  final String imageForShare;
  final String price;
  final int idProductForShare;
  final bool hideShareButton;

  const MainAppBarOfDetailsWidget({
    super.key,
    required this.descriptionForShare,
    required this.idProductForShare,
    required this.imageForShare,
    required this.nameForShare,
    required this.price,
    this.hideShareButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: Container(
        margin: EdgeInsets.only(top: 8.h, left: 12.w, right: 12.w, bottom: 6.h),
        decoration: BoxDecoration(
            color: Colors.white60.withOpacity(0.7),
            borderRadius: BorderRadius.all(Radius.circular(30.sp))),
        child: IconButtonWidget(
          icon: AppIcons.arrowBack,
          height: 19.h,
        ),
      ),
      leadingWidth: 60.w,
      actions: [
        Row(
          children: [
            IconsOfAppbarDetailsWidget(
              icon: AppIcons.search,
              onPressed: () {
                navigateTo(
                    context,
                    SearchPage(
                      hintTextSearch: "",
                    ));
              },
            ),
            6.w.horizontalSpace,
            Visibility(
              visible: hideShareButton,
              child: IconsOfAppbarDetailsWidget(
                icon: AppIcons.sharing,
                onPressed: () {
                  DynamicLinkService.shareProduct(
                    context,
                    nameForShare,
                    descriptionForShare,
                    idProductForShare,
                    imageForShare,
                    price,
                  );
                },
              ),
            ),
            6.w.horizontalSpace,
            Consumer(
              builder: (context, ref, child) {
                return IconsOfAppbarDetailsWidget(
                  icon: AppIcons.cart,
                  onPressed: () {
                    ref.read(activeIndexProvider.notifier).state = 2;
                    navigateTo(context, const BottomNavigationBarWidget());
                  },
                );
              },
            ),
            8.horizontalSpace,
          ],
        ),
      ],
    );
  }
}
