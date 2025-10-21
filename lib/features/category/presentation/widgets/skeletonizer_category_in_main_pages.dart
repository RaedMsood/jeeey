import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/skeletonizer_widget.dart';

class SkeletonizerCategoryInMainPages extends StatelessWidget {
  const SkeletonizerCategoryInMainPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkeletonizerWidget(
          child: SizedBox(
            width:  MediaQuery.of(context).size.width / 2.5,
            height:MediaQuery.of(context).size.height/2 ,
            child: ListView.builder(
              itemCount: 7,
              itemBuilder:(context, index) =>  Container(

                color:Colors.white,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 18.h,
                      width: 4.5.w,
                      color: Colors.black87,
                    ),
                    2.w.horizontalSpace,
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: AutoSizeTextWidget(
                          text: 'هذا الكتابة في التحميل ',
                          fontSize: 12.sp,
                          colorText:
                          Colors.black,
                          maxLines: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
