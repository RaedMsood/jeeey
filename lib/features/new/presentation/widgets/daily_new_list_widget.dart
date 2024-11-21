import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/online_images_widget.dart';

class DailyNewListWidget extends StatelessWidget {
  const DailyNewListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 68.h,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: OnlineImagesWidget(
                imageUrl:
                    'https://artic.fakera.com/wp-content/uploads/2020/06/IMG-20200615-WA0083.jpg',
                size: Size(60.w, double.infinity),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 6.w,
          ),
          itemCount: 8,
        ),
      ),
    );
  }
}
