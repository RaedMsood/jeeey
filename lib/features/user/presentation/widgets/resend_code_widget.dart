import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../generated/l10n.dart';

class ResendCodeWidget extends ConsumerStatefulWidget {
  const ResendCodeWidget({
    super.key,
  });

  @override
  ConsumerState<ResendCodeWidget> createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends ConsumerState<ResendCodeWidget> {
  Timer? _timer;
  int countDown = 60;
  bool canResend = false;

  nn() {}

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();

    _timer!.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countDown > 0) {
          countDown--;
        } else {
          canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void resend() {
    if (canResend) {
      setState(() {
        countDown = 60;
        canResend = false;
      });
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    // var controller = ref.watch(resendOtpProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeTextWidget(
          text: S.of(context).resendCodeIN,
          fontSize: 12.5.sp,
          colorText: Colors.black,
          textAlign: TextAlign.center,
        ),
        canResend ? 6.w.horizontalSpace : 3.w.horizontalSpace,
        canResend
            ?
            // controller.viewState == ViewState.loading
            //         ? SpinKitThreeBounce(
            //             color: AppColors.secondaryColor,
            //             size: 17.sp,
            //           )
            //         :
            InkWell(
                onTap: () {
                  // ref.read(resendOtpProvider.notifier).resendOtp(context,
                  //     onSuccess: () {
                  //   resend();
                  // });
                  resend();
                },
                child: Text(
                  S.of(context).resend,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : AutoSizeTextWidget(
                text:
                    "00:${countDown < 10 ? "0${countDown.toString()}" : countDown.toString()}",
                colorText: AppColors.primaryColor,
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w700,
              ),
      ],
    );
  }
}
