import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/extension/string.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/online_images_widget.dart';
import '../../data/model/order_data_model.dart';

class OrderCardWidget extends StatelessWidget {
  final OrderDataModel data;

  const OrderCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 6.h),
      margin: EdgeInsets.only(top: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: data.status!.color!.toColor(),
                      radius: 6.r,
                    ),
                    6.w.horizontalSpace,
                    AutoSizeTextWidget(
                      text: data.status!.name.toString(),
                      fontSize: 12.5.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                6.h.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AutoSizeTextWidget(
                      text: "${data.status!.id}طلب",
                      fontSize: 12.5.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    6.w.horizontalSpace,
                    AutoSizeTextWidget(
                      text: data.trxId.toString(),
                      colorText: AppColors.fontColor,
                      fontSize: 10.5.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
          8.h.verticalSpace,
          SizedBox(
            height: 120.h,
            child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: data.orderProducts!.map((item) {
                  return Row(
                    children: [
                      OnlineImagesWidget(
                        imageUrl: item.image.toString(),
                        size: Size(120.w, double.infinity),
                      ),
                      8.w.horizontalSpace,
                    ],
                  );
                }).toList()),
          ),
          6.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AutoSizeTextWidget(
                  text: "${data.totalProducts} بضائع الأجمالي:",
                  colorText: AppColors.fontColor,
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.w600,
                ),
                4.w.horizontalSpace,
                AutoSizeTextWidget(
                  text: "${data.total} ر.ي",
                  colorText: AppColors.primaryColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
