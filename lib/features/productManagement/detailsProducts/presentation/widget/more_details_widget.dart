import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/show_modal_bottom_sheet_widget.dart';

class MoreDetailsWidget extends StatelessWidget {
  const MoreDetailsWidget({super.key,required this.page,required this.describe});
  final Widget page;
  final String describe;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        showModalBottomSheetWidget(
            context: context,
            page: page
            //page:DescriptionInModelSheetWidget(detailsProduct:detailsProduct,)
        );

      },
      child: Row(
        children: [
           AutoSizeTextWidget(
            text:describe ,
            colorText: Colors.black,
             fontSize: 14.sp,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: 15.sp,
            color: const Color(0xff707070),
          )
        ],
      ),
    );
  }
}
