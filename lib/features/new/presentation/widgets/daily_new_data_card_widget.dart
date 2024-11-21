import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../pages/daily_new_page.dart';

class DailyNewDataCardWidget extends StatelessWidget {
  const DailyNewDataCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, const DailyNewPage());
      },
      child: Container(
        width: 81.w,
        height: 68.h,
        margin: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(.18),
          borderRadius: BorderRadius.circular(4.sp),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 1.h),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(.18),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  topRight: Radius.circular(4.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green.shade500,
                    radius: 2.sp,
                  ),
                  Flexible(
                    child: AutoSizeTextWidget(
                      text: "أكتوبر",
                      fontSize: 12.6.sp,
                      colorText: Colors.green.shade600,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green.shade500,
                    radius: 2.sp,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(4.sp),
                child: AutoSizeTextWidget(
                  text: "24",
                  fontSize: 25.sp,
                  colorText: Colors.green.shade600,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  maxFontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
