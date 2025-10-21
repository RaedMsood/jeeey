import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_get_api_data_widget.dart';
import 'package:jeeey/core/state/state.dart';
import 'package:jeeey/core/widgets/skeletonizer_widget.dart';
import 'package:jeeey/features/productManagement/copons_and_discount/presntation/widget/list_of_used_copon_widget.dart';
import 'package:jeeey/features/productManagement/copons_and_discount/presntation/widget/skeletonizer_of_card_copon_widget.dart';

import '../../../../../core/theme/app_colors.dart';
import '../state_mangement/riverpod.dart';
import 'card_of_copon_widget.dart';
import 'list_of_not_used_card_widget.dart';

class NotUsedCoponWidget extends ConsumerStatefulWidget {
  const NotUsedCoponWidget({super.key});

  @override
  ConsumerState<NotUsedCoponWidget> createState() => _NotUsedCoponWidgetState();
}

class _NotUsedCoponWidgetState extends ConsumerState<NotUsedCoponWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(getCoponProvider(1).notifier).getCoponData(
            moreData: true,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getCoponProvider(1));
    return CheckStateInGetApiDataWidget(
      state: state,
      widgetOfLoading: const SkeletonizerOfCardCoponWidget(),
      widgetOfData: ListOfNotUsedCardWidget(
        copon: state.data.data,
        scrollController: _scrollController,
        isLoadingMore: state.stateData == States.loadingMore,
      ),
    );
  }
}
