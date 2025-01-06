import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../services/auth/auth.dart';
import '../../../../user/presentation/pages/log_in_page.dart';
import '../../../myOrders/presentation/pages/my_orders_page.dart';
import 'icon_and_title_design_widget.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({super.key});

  _navigateTo(BuildContext context,int tabIndex) {
    if (!Auth().loggedIn) {
      navigateTo(context, const LogInPage());
    } else {
      navigateTo(context, MyOrdersPage(tabIndex: tabIndex));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeTextWidget(
                  text: S.of(context).myOrder,
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w600,
                ),
                InkWell(
                  onTap: () {
                    _navigateTo(context,0);
                  },
                  child: Row(
                    children: [
                      AutoSizeTextWidget(
                        text: S.of(context).viewAll,
                        fontSize: 10.4.sp,
                        colorText: AppColors.fontColor,
                      ),
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: AppColors.fontColor,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconAndTitleDesignWidget(
                  title: S.of(context).unpaid,
                  icon: AppIcons.unpaid,
                  onPressed: () {
                    _navigateTo(context,1);
                  },
                ),
                IconAndTitleDesignWidget(
                  title: S.of(context).processing,
                  icon: AppIcons.processing,
                  onPressed: () {
                    _navigateTo(context,2);
                  },
                ),
                IconAndTitleDesignWidget(
                  title: S.of(context).review,
                  icon: AppIcons.review,
                  onPressed: () {
                    _navigateTo(context,5);
                  },
                ),
                IconAndTitleDesignWidget(
                  title: S.of(context).shipped,
                  icon: AppIcons.shipped,
                  onPressed: () {
                    _navigateTo(context,3);
                  },
                ),
                IconAndTitleDesignWidget(
                  title: S.of(context).returns,
                  icon: AppIcons.returns,
                  onPressed: () {
                    _navigateTo(context,4);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
