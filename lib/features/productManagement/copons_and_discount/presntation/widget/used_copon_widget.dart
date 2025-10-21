import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeeey/core/state/check_state_in_get_api_data_widget.dart';
import 'package:jeeey/core/state/state.dart';
import 'package:jeeey/features/productManagement/copons_and_discount/presntation/widget/skeletonizer_of_card_copon_widget.dart';
import '../state_mangement/riverpod.dart';
import 'list_of_used_copon_widget.dart';

class UsedCoponWidget extends ConsumerStatefulWidget {
  const UsedCoponWidget({super.key});

  @override
  ConsumerState<UsedCoponWidget> createState() => _UsedCoponWidgetState();
}

class _UsedCoponWidgetState extends ConsumerState<UsedCoponWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(getCoponProvider(2).notifier).getCoponData(
            moreData: true,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getCoponProvider(2));
    return Column(
      children: [
        CheckStateInGetApiDataWidget(
          state: state,
          widgetOfLoading: const SkeletonizerOfCardCoponWidget(),
          widgetOfData: Expanded(
              child: ListOfUsedCoponWidget(
            isLoadingMore: state.stateData==States.loadingMore,
            scrollController: _scrollController,
            coponUsed: state.data.data,
          )),
        ),
      ],
    );
  }
}
