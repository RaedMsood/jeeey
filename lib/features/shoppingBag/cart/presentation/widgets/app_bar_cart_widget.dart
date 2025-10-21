import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../../core/widgets/buttons/ink_well_button_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../services/auth/auth.dart';
import '../../../../productManagement/wishlist/presentation/pages/wishlist_page.dart';
import '../../../../productManagement/wishlist/presentation/riverpod/wishlist_riverpod.dart';
import '../../../../user/presentation/pages/log_in_page.dart';
import '../../data/model/cart_model.dart';
import '../pages/share_my_cart.dart';

class AppBarCartWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<CartModel> data;

  const AppBarCartWidget({super.key, required this.data});

  @override
  Size get preferredSize => Size.fromHeight(48.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0.0,
      title: AutoSizeTextWidget(
        text: S.of(context).shoppingBag,
        fontSize: 13.5.sp,
        fontWeight: FontWeight.w600,
      ),
      actions: [
        // InkWellButtonWidget(
        //   icon: AppIcons.sharing,
        //   onPressed: () {
        //     navigateTo(
        //       context,
        //       ShareMyCart(
        //         data: data,
        //       ),
        //     );
        //   },
        // ),
        Consumer(
          builder: (context, ref, child) {
            return IconButtonWidget(
              icon: AppIcons.wishlist,
              onPressed: () {
                if (!Auth().loggedIn) {
                  navigateTo(context, const LogInPage());
                } else {
                  ref.refresh(getAllWishesProductsProvider);
                  ref.refresh(getAllListProvider);
                  navigateTo(context, const WishlistPage());
                }
              },
            );
          },
        ),
      ],
    );
  }
}
