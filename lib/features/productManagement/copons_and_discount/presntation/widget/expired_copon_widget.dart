import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeeey/core/state/state.dart';
import '../../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../state_mangement/riverpod.dart';
import 'list_of_expired_copon_widget.dart';
import 'list_of_used_copon_widget.dart';
import 'skeletonizer_of_card_copon_widget.dart';

class ExpiredCoponWidget extends ConsumerStatefulWidget {
  const ExpiredCoponWidget({super.key});

  @override
  ConsumerState<ExpiredCoponWidget> createState() => _ExpiredCoponWidgetState();
}

class _ExpiredCoponWidgetState extends ConsumerState<ExpiredCoponWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(getCoponProvider(3).notifier).getCoponData(
            moreData: true,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getCoponProvider(3));
    return Column(
      children: [
        CheckStateInGetApiDataWidget(
          state: state,
          widgetOfLoading: const SkeletonizerOfCardCoponWidget(),
          widgetOfData: Expanded(
              child: ListOfExpiredCoponWidget(
            copon: state.data.data,
            isLoadingMore: state.stateData == States.loadingMore,
            scrollController: _scrollController,
          )),
        ),
      ],
    );
  }
}
