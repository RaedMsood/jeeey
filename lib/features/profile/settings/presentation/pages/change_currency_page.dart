import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_get_api_data_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/logo_shimmer_widget.dart';
import '../../../../../core/widgets/secondary_app_bar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../riverpod/currency_riverpod.dart';
import '../widgets/currency_card_widget.dart';

class ChangeCurrencyPage extends ConsumerWidget {
  const ChangeCurrencyPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(getAllCurrencies);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SecondaryAppBarWidget(
        title: S.of(context).changeCurrency,
        fontSize: 12.5.sp,
        centerTitle: false,
      ),
      body: RefreshIndicator(
        color: AppColors.primaryColor,
        onRefresh: () async {
          ref.refresh(getAllCurrencies);
        },
        child: CheckStateInGetApiDataWidget(
          state: state,
          widgetOfLoading:  LogoShimmerWidget(width: 200.w),
          widgetOfData: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: false,
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return CurrencyCardWidget(
                code: state.data[index].code,
                symbol: state.data[index].symbol,
              );
            },
          ),
        ),
      ),
    );
  }
}
