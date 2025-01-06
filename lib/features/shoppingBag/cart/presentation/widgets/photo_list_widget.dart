import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/online_images_widget.dart';
import '../../../../../core/widgets/photo_view_dialog_widget.dart';
import '../../data/model/product_color_model.dart';
import '../riverpod/cart_riverpod.dart';

class PhotoListWidget extends ConsumerWidget {
  final List<ImagesModel> image;

  const PhotoListWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context, ref) {
    // var state = ref.watch(getProductDetailsForCartProvider(productId));
    // int mainIndex =
    //     state.data.productColors!.indexWhere((color) => color.isMain == 1);
    return SizedBox(
      height: 230.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10.sp),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              PhotoViewDialogWidget.show(
                context,
                image[index].image,
                // state.data.productColors![mainIndex].images![index].image
                //     .toString(),
              );
            },
            child: OnlineImagesWidget(
              imageUrl: image[index].image,
              // imageUrl: state
              //     .data.productColors![mainIndex].images![index].image
              //     .toString(),
              size: Size(150.w, double.infinity),
              borderRadius: 0,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 6.w),
        itemCount: image.length,
        // itemCount: state.data.productColors![mainIndex].images!.length,
      ),
    );
  }
}
