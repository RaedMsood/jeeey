import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/state/app_restart_controller.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../riverpod/currency_riverpod.dart';

class CurrencyCardWidget extends ConsumerWidget {
  final String code;
  final String symbol;

  const CurrencyCardWidget({
    super.key,
    required this.code,
    required this.symbol,
  });

  @override
  Widget build(BuildContext context, ref) {
    var currencyState = ref.watch(currencyProvider);
    var currencyStateNotifier = ref.watch(currencyProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: AppColors.greySwatch.shade100.withOpacity(.8),
          height: 1,
        ),
        InkWell(
          onTap: () async {
            await currencyStateNotifier.changeCurrency(code);
            AppRestartController.restartApp(context);
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                14.w.horizontalSpace,
                Expanded(
                  child: Row(
                    children: [
                      AutoSizeTextWidget(
                        text: code,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        colorText: AppColors.greySwatch.shade600,
                      ),
                      14.w.horizontalSpace,
                      Flexible(
                        child: AutoSizeTextWidget(
                          text: symbol,
                          fontSize: 12.sp,
                          colorText: AppColors.greySwatch.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: currencyState == code,
                  child: Icon(
                    Icons.check,
                    color: AppColors.primaryColor,
                    size: 17.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
