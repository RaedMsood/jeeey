import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../generated/l10n.dart';

class ContinueWithGoogleOrFacebookWidget extends StatelessWidget {
  const ContinueWithGoogleOrFacebookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0.8.h,
              width: 120.w,
              color: AppColors.greySwatch.shade300,
            ),
            14.w.horizontalSpace,
            AutoSizeTextWidget(
              text: S.of(context).or,
              fontSize: 15.sp,
              colorText: AppColors.fontColor,
            ),
            14.w.horizontalSpace,
            Container(
              height: 0.8.h,
              width: 120.w,
              color: AppColors.greySwatch.shade300,
            ),
          ],
        ),
        18.h.verticalSpace,
        ContinueWidget(
          title: S.of(context).continueWithGoogle,
          icon: AppIcons.continueToGoogle,
          padding: 7.sp,
          onTap: () {},
        ),
        8.h.verticalSpace,
        ContinueWidget(
          title: S.of(context).continueWithFacebook,
          icon: AppIcons.continueToFacebook,
          onTap: () {},
        ),
      ],
    );
  }
}

class ContinueWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final double? padding;

  const ContinueWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding ?? 4.sp),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Expanded(
              child: AutoSizeTextWidget(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
