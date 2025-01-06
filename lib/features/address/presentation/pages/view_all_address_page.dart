import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_get_api_data_widget.dart';
import 'package:jeeey/core/state/state.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/buttons/default_button.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/address_model.dart';
import '../riverpod/address_riverpod.dart';
import '../widgets/address_card_widget.dart';
import '../widgets/app_bar_address_widget.dart';
import '../../../../core/widgets/bottomNavbar/button_bottom_navigation_bar_design_widget.dart';
import '../widgets/shimmer_address_card_widget.dart';
import 'add_or_update_an_address_page.dart';

class ViewAllAddressPage extends ConsumerWidget {
  const ViewAllAddressPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var controller = ref.watch(getAllAddressesProvider);
    return Scaffold(
      appBar: AppBarAddressWidget(
        title: S.of(context).address,
      ),
      body: RefreshIndicator(
        color: AppColors.primaryColor,
        onRefresh: () async {
          ref.refresh(getAllAddressesProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(14.sp),
          child: CheckStateInGetApiDataWidget(
            state: controller,
            widgetOfLoading: const ShimmerAddressCardWidget(),
            // errorState: Center(
            //   child: ErrorState.container(
            //     error: controller.errorModel,
            //   ),
            // ),
            widgetOfData: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.data.isEmpty)
                  const Column(
                    children: [
                      AutoSizeTextWidget(text: "Your addresses are empty."),
                      AutoSizeTextWidget(text: "Please add address."),
                    ],
                  ),
                Column(
                  children: controller.data.map((e) {
                    return AddressCardWidget(address: e);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: controller.stateData == States.loaded
          ? ButtonBottomNavigationBarDesignWidget(
              child: DefaultButtonWidget(
                text: S.of(context).addANewAddress,
                onPressed: () {
                  navigateTo(
                    context,
                    AddANewAddressPage(
                      address: AddressModel.empty(),
                      onSuccess: () {
                        ref.refresh(getAllAddressesProvider);
                        Navigator.of(context).pop();
                      },
                      locationIsEmpty: true,
                    ),
                  );
                },
              ),
            )
          : null,
    );
  }
}
