import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/app_colors.dart';
import '../auto_size_text_widget.dart';

class DesignForBottomNavigationBarWidget extends StatelessWidget {
  final String icon;
  final bool active;

  final String? activeIcon;
  final String label;
  final Function()? onTap;

  const DesignForBottomNavigationBarWidget({
    super.key,
    required this.icon,
    this.activeIcon,
    required this.label,
    this.active = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(left: 8.w, right: 8.h, top: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: SvgPicture.asset(
                  active ? activeIcon ?? icon : icon,
                  key: ValueKey<String>(active ? activeIcon ?? icon : icon),
                  height: active ? 24.h : 22.h,
                ),
              ),
              2.h.verticalSpace,
              AutoSizeTextWidget(
                text: label,
                colorText:
                    active ? Colors.black87 : AppColors.greySwatch.shade400,
                fontSize: 11.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
