import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/dropdown_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import 'list_of_size_in_filter_widget.dart';
import 'clear_button_and_done.dart';

class SubFilterDropdownMenuWidget extends StatelessWidget {
  const SubFilterDropdownMenuWidget({super.key,required this.aMenuToDisplayTheSubFilterContentWidget});
  final Widget aMenuToDisplayTheSubFilterContentWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        6.h.verticalSpace,
        Divider(
          color: AppColors.fontColor,
          thickness: 0.1.sp,
          height: 0,
        ),
        Flexible(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8.sp),
            child:  aMenuToDisplayTheSubFilterContentWidget,
          ),
        ),
        Divider(
          color: AppColors.fontColor,
          thickness: 0.1.sp,
          height: 0,
        ),

        ClearButtonAndDone(
          doneOnTap:(){
            DropdownHelper().overlayEntry!.remove();
            DropdownHelper().overlayEntry = null;
          },
          clearOnTap: (){
            DropdownHelper().overlayEntry!.remove();
            DropdownHelper().overlayEntry = null;
          },
        ),
      ],
    );
  }
}


