import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/size_data.dart';

import '../../../../../core/widgets/auto_size_text_widget.dart';

class ListOfSizeProductWidget extends StatelessWidget {
  const ListOfSizeProductWidget({super.key,required this.sizeProduct});
  final List<SizeData> sizeProduct;

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing: 6.0.w,
      runSpacing: 6.0.h,
      children:sizeProduct.map((item)=>Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xffE1E1E1))
        ),
        child: AutoSizeTextWidget(
          text: item.sizeTypeName!,
          colorText: Colors.black,
          fontSize: 12,
        ) ,
      )).toList(),
    );
  }
}
