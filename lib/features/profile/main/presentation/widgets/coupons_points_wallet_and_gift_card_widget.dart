import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../generated/l10n.dart';
import 'icon_and_title_design_widget.dart';

class CouponsPointsWalletAndGiftCardWidget extends StatelessWidget {
  const CouponsPointsWalletAndGiftCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(14.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              AutoSizeTextWidget(
                text: "0",
                fontSize: 11.sp,
              ),
              3.h.verticalSpace,
              AutoSizeTextWidget(
                text: S.of(context).coupons,
                fontSize: 11.sp,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              AutoSizeTextWidget(
                text: "0",
                fontSize: 11.sp,
              ),
              3.h.verticalSpace,
              AutoSizeTextWidget(
                text: S.of(context).points,
                fontSize: 11.sp,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          IconAndTitleDesignWidget(
            title: S.of(context).wallet,
            icon: AppIcons.wallet,
            onPressed: () {},
          ),
          IconAndTitleDesignWidget(
            title: S.of(context).giftCard,
            icon: AppIcons.giftCard,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
