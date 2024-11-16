import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import '../../../../../core/helpers/dropdown_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../generated/l10n.dart';

var recommendIndexProvider =
    StateProvider<String>((ref) => S.current.recommend);

class DesignAndRecommendListWidget extends ConsumerWidget {
  DesignAndRecommendListWidget({super.key});

  final List<String> titleFilter = [
    S.current.recommend,
    S.current.newArrivals,
    S.current.topRated,
  ];

  @override
  Widget build(BuildContext context, ref) {
    var recommendIndexController = ref.watch(recommendIndexProvider);

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(8.sp),
      itemCount: titleFilter.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              ref.read(recommendIndexProvider.notifier).state =
                  titleFilter[index];
              DropdownHelper().overlayEntry!.remove();
              DropdownHelper().overlayEntry = null;
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeTextWidget(
                      text: titleFilter[index],
                      colorText: recommendIndexController == titleFilter[index]
                          ? Colors.black
                          : AppColors.fontColor,
                      fontSize: 11.7.sp,
                      fontWeight: recommendIndexController == titleFilter[index]
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                    Icon(
                      Icons.check_sharp,
                      color: recommendIndexController == titleFilter[index]
                          ? Colors.black
                          : Colors.transparent,
                      size: 16.sp,
                    ),
                  ],
                ),
                titleFilter[index] == titleFilter.last
                    ? const SizedBox.shrink()
                    : Divider(
                        color: AppColors.fontColor,
                        thickness: 0.14.sp,
                        height: 14.h,
                      ),
              ],
            ));
      },
    );
  }
}
