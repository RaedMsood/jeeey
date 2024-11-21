import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/a_menu_to_display_the_sub_filter_content_widget.dart';
import '../widgets/card_of_sub_filter_drawer_widget.dart';
import '../widgets/clear_button_and_done.dart';

class SubFilterDrawerWidget extends StatefulWidget {
  const SubFilterDrawerWidget({super.key});

  @override
  State<SubFilterDrawerWidget> createState() => _SubFilterDrawerWidgetState();
}

class _SubFilterDrawerWidgetState extends State<SubFilterDrawerWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 694);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          28.h.verticalSpace,
          AutoSizeTextWidget(
            text: S.of(context).filter,
            fontSize: 16.5.sp,
            fontWeight: FontWeight.w600,
          ),
          6.h.verticalSpace,
          Divider(
            color: AppColors.fontColor,
            thickness: 0.2.sp,
            height: 0,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardOfSubFilterDrawerWidget(
                    title: "نوع المنتج",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  CardOfSubFilterDrawerWidget(
                    title: "مقاس",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  CardOfSubFilterDrawerWidget(
                    title: "تصاميم",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  CardOfSubFilterDrawerWidget(
                    title: "لون",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  const CardOfSubFilterDrawerWidget(
                    title: "طول الاكمام",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  const CardOfSubFilterDrawerWidget(
                    title: "نوع",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  const CardOfSubFilterDrawerWidget(
                    title: "نوع",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  const CardOfSubFilterDrawerWidget(
                    title: "نوع المنتج",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  const CardOfSubFilterDrawerWidget(
                    title: "مقاس",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  const CardOfSubFilterDrawerWidget(
                    title: "الحجم",
                    child: AMenuToDisplayTheSubFilterContentWidget(),
                  ),
                  AutoSizeTextWidget(
                    text: "نطاق السعر",
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  8.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeTextWidget(
                        text: '\$${_currentRangeValues.start.toInt()}',
                        fontSize: 11.sp,
                        colorText: Colors.black87,
                      ),
                      AutoSizeTextWidget(
                        text: '\$${_currentRangeValues.end.toInt()}',
                        fontSize: 11.sp,
                        colorText: Colors.black87,
                      ),
                    ],
                  ),
                  2.5.h.verticalSpace,
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.grey[200],
                      activeTrackColor: Colors.black,
                      inactiveTrackColor: Colors.grey,
                      trackHeight: 0.6.h,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 0.r),
                      valueIndicatorColor:
                          AppColors.primaryColor.withOpacity(.8),
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                    child: RangeSlider(
                      values: _currentRangeValues,
                      min: 0,
                      max: 694,
                      divisions: 694,
                      labels: RangeLabels(
                        '\$${_currentRangeValues.start.toInt()}',
                        '\$${_currentRangeValues.end.toInt()}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: AppColors.fontColor,
            thickness: 0.2.sp,
            height: 0,
          ),
          ClearButtonAndDone(
            height: 29.h,
            doneOnTap: () {},
            clearOnTap: () {},
          ),
        ],
      ),
    );
  }
}
