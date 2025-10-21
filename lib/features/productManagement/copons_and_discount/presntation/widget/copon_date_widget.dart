import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import 'design_date_widget.dart';

class CoponDateWidget extends StatefulWidget {
  DateTime? expirationDate;
  bool isProductPage = false;

  CoponDateWidget(
      {super.key, required this.expirationDate, required this.isProductPage});

  @override
  State<CoponDateWidget> createState() => _CoponDateWidgetState();
}

class _CoponDateWidgetState extends State<CoponDateWidget> {
  late ValueNotifier<Duration> remainingTimeNotifier;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remainingTimeNotifier =
        ValueNotifier(widget.expirationDate!.difference(DateTime.now()));
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          final remaining = widget.expirationDate!.difference(DateTime.now());
          if (remaining.isNegative) {
            remainingTimeNotifier.value = Duration.zero;
            timer.cancel();
          } else {
            remainingTimeNotifier.value = remaining;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    remainingTimeNotifier.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<Duration>(
            valueListenable: remainingTimeNotifier,
            builder: (context, remainingTime, child) {
              int days = remainingTime.inDays;
              int hours = (remainingTime.inHours % 24);
              int minutes = (remainingTime.inMinutes % 60);
              int seconds = (remainingTime.inSeconds % 60);

              return Visibility(
                visible:
                    seconds != 0 || days != 0 || hours != 0 || minutes != 0,
                replacement: AutoSizeTextWidget(
                  text: 'انتهت صلاحية الكوبون',
                  fontSize: 9.sp,
                  colorText: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeTextWidget(
                      text: 'تنتهي في :',
                      fontSize: 9.sp,
                      colorText: Colors.black,
                    ),
                    Visibility(
                      visible: days != 0,
                      child: DesignDateWidget(
                        isProductPage: widget.isProductPage,
                        value: days.toString(),
                      ),
                    ),
                    Visibility(
                      visible: hours != 0,
                      child: DesignDateWidget(
                        value: hours.toString(),
                        isProductPage: widget.isProductPage,
                      ),
                    ),
                    Visibility(
                      visible: minutes != 0,
                      child: DesignDateWidget(
                        value: minutes.toString(),
                        isProductPage: widget.isProductPage,
                      ),
                    ),
                    Visibility(
                      visible: seconds != 0,
                      child: DesignDateWidget(
                        value: seconds.toString(),
                        isProductPage: widget.isProductPage,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
