import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/helpers/dropdown_helper.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../generated/l10n.dart';

class TitleAndIconForClosingTheDropDownMenuWidget extends StatelessWidget {
  const TitleAndIconForClosingTheDropDownMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: AutoSizeTextWidget(
            text: S.of(context).filter,
            fontSize: 12.5.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButtonWidget(
          icon: AppIcons.close,
          height: 14.h,
          onPressed: () {
            DropdownHelper().overlayEntry!.remove();
            DropdownHelper().overlayEntry = null;
          },
        ),
      ],
    );
  }
}
