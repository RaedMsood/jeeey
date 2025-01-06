import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_post_api_data_widget.dart';
import 'package:jeeey/core/state/state.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../core/widgets/buttons/default_button.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/address_model.dart';
import '../pages/view_all_address_page.dart';
import '../riverpod/address_riverpod.dart';

class DeleteAddressDialogWidget extends ConsumerWidget {
  final AddressModel address;

  const DeleteAddressDialogWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(addressProvider(address));

    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeTextWidget(
            text: S.of(context).doYouWantToDeleteThisAddress,
            colorText: AppColors.primarySwatch.shade700,
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          6.h.verticalSpace,
          AutoSizeTextWidget(
            text: S.of(context).theAddressWillBePermanentlyDeleted,
            fontSize: 13.sp,
            colorText: AppColors.fontColor,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          14.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CheckStateInPostApiDataWidget(
                  state: state,
                  messageSuccess: S.of(context).deletedAddressSuccessfully,
                  functionSuccess: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          child: const ViewAllAddressPage(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                        ), (route) {
                      return route.isFirst;
                    });
                  },
                  bottonWidget: DefaultButtonWidget(
                    text: S.of(context).yes,
                    background: AppColors.primarySwatch.shade700,
                    height: 38.h,
                    isLoading: state.stateData == States.loading,
                    onPressed: () {
                      ref
                          .read(addressProvider(address).notifier)
                          .deleteAddress();
                    },
                  ),
                ),
              ),
              16.w.horizontalSpace,
              Expanded(
                child: DefaultButtonWidget(
                  text: S.of(context).no,
                  background: AppColors.greySwatch.shade50,
                  textColor: AppColors.greySwatch.shade800,
                  height: 38.h,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
