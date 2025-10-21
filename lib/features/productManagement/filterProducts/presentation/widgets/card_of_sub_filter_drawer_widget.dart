import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class CardOfSubFilterDrawerWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final bool isOpenToRead;
  const CardOfSubFilterDrawerWidget(
      {super.key, required this.child, required this.title,required this.isOpenToRead});

  @override
  State<CardOfSubFilterDrawerWidget> createState() =>
      _CardOfSubFilterDrawerWidgetState();
}

class _CardOfSubFilterDrawerWidgetState
    extends State<CardOfSubFilterDrawerWidget> {
  bool readAll = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        setState(() {

          readAll = !readAll;
        });
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 14.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeTextWidget(
                  text: widget.title,
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w600,
                ),
                SvgPicture.asset(
                  readAll||widget.isOpenToRead ? AppIcons.arrowUp : AppIcons.arrowBottom,
                ),
              ],
            ),
            readAll||widget.isOpenToRead
                ? Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: widget.child,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
