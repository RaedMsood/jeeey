import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/bottomNavbar/button_bottom_navigation_bar_design_widget.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../core/widgets/secondary_app_bar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../data/model/cart_model.dart';
import '../riverpod/share_my_cart_riverpod.dart';
import '../widgets/check_box_for_cart_products_widget.dart';
import '../widgets/shopping_cart_sharing_card_widget.dart';

class ShareMyCart extends ConsumerWidget {
  final List<CartModel> data;

  const ShareMyCart({super.key, required this.data});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(shareMyCartProvider);
    var shareStateNotifier = ref.watch(shareMyCartProvider.notifier);

    return Scaffold(
      appBar: SecondaryAppBarWidget(
        title: S.of(context).shareMyCart,
        centerTitle: false,
        fontSize: 13.3.sp,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ShoppingCartSharingCardWidget(
            data: data[index],
          );
        },
      ),
      bottomNavigationBar: ButtonBottomNavigationBarDesignWidget(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: DefaultButtonWidget(
                text: "${S.of(context).sharing} (${data.length})",
                width: 98.w,
                height: 33.h,
                borderRadius: 0.0,
                onPressed: () {},
              ),
            ),
            Row(
              children: [
                AutoSizeTextWidget(
                  text: S.of(context).all,
                  colorText: Colors.black87,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                ),
                // 4.w.horizontalSpace,
                CheckBoxForCartProductsWidget(
                  value: shareStateNotifier.isAllProductsSelected(data),
                  onChanged: (isChecked) {
                    shareStateNotifier.toggleAllProductsSelection(
                      isChecked ?? false,
                      data,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
