import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/constants/app_icons.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import '../../../../../core/helpers/dropdown_helper.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/design_and_recommend_list_widget.dart';
import '../widgets/main_filter_design_widget.dart';

var mainFilterActiveIndexProvider = StateProvider<int>((ref) => 0);

class MainFilterWidget extends ConsumerStatefulWidget {
  final VoidCallback? onTapFilter;

  const MainFilterWidget({
    super.key,
    this.onTapFilter,
  });

  @override
  ConsumerState<MainFilterWidget> createState() => _MainFilterWidgetState();
}

class _MainFilterWidgetState extends ConsumerState<MainFilterWidget> {
  bool highPrice = false;
  bool active = false;

  @override
  Widget build(BuildContext context) {
    var mainFilterActiveIndex = ref.watch(mainFilterActiveIndexProvider);
    ref.watch(recommendIndexProvider);

    return WillPopScope(
      onWillPop: () async {
        if (DropdownHelper().overlayEntry == null) {
          return true;
        } else {
          setState(() {});
          DropdownHelper().overlayEntry!.remove();
          DropdownHelper().overlayEntry = null;
          return false;
        }
      },
      child: Container(
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Recommend
            MainFilterDesignWidget(
              title: ref.read(recommendIndexProvider.notifier).state,
              icon: DropdownHelper().overlayEntry == null
                  ? AppIcons.arrowBottom
                  : AppIcons.arrowUp,
              active: mainFilterActiveIndex == 0,
              onTap: () {
                if (mainFilterActiveIndex == 0) {
                  DropdownHelper().toggleDropdown(
                      context: context,
                      items: DesignAndRecommendListWidget(),
                      onTapDown: (_) {
                        setState(() {});
                        DropdownHelper().overlayEntry!.remove();
                        DropdownHelper().overlayEntry = null;
                      });
                }
                ref.read(mainFilterActiveIndexProvider.notifier).state = 0;
                setState(() {
                  highPrice = false;
                });
              },
            ),

            /// Most Popular
            MainFilterDesignWidget(
              title: S.of(context).mostPopular,
              active: mainFilterActiveIndex == 1,
              icon: AppIcons.arrowBottom,
              color: Colors.transparent,
              onTap: () {
                ref.read(mainFilterActiveIndexProvider.notifier).state = 1;
                setState(() {
                  highPrice = false;
                });
              },
            ),

            /// Price
            MainFilterDesignWidget(
              title: S.of(context).price,
              active: mainFilterActiveIndex == 2,
              priceIcon: true,
              highPrice: highPrice,
              onTap: () {
                ref.read(mainFilterActiveIndexProvider.notifier).state = 2;
                setState(() {
                  highPrice = !highPrice;
                });
              },
            ),

            /// Filter
            Row(
              children: [
                Container(
                  height: 18.h,
                  color: AppColors.greySwatch.shade200,
                  width: 0.8.w,
                ),
                9.w.horizontalSpace,
                MainFilterDesignWidget(
                  title: S.of(context).filter,
                  active: false,
                  icon: AppIcons.filter,
                  onTap: widget.onTapFilter!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
