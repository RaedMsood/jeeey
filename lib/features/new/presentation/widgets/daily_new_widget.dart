import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../generated/l10n.dart';
import '../pages/daily_new_page.dart';
import 'daily_new_data_card_widget.dart';
import 'daily_new_list_widget.dart';

class DailyNewWidget extends StatelessWidget {
  const DailyNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        8.w.horizontalSpace,
        Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.sp),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeTextWidget(
                        text: S.of(context).dailyNew,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(context, const DailyNewPage());
                        },
                        child: Row(
                          children: [
                            AutoSizeTextWidget(
                              text: S.of(context).viewMore,
                              fontSize: 10.4.sp,
                              colorText: AppColors.fontColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.5.h),
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: AppColors.fontColor,
                                size: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                8.h.verticalSpace,
                const Row(
                  children: [
                    /// Class Daily New Data Card Widget

                    DailyNewDataCardWidget(),

                    /// Class Daily New List Widget
                    DailyNewListWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
