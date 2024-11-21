import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../helpers/flash_bar_helper.dart';
import '../network/remote_exception.dart';
import '../state/state.dart';
import '../state/state_data.dart';


class CheckStateInPostApiDataWidget extends StatelessWidget {
  final Widget? bottonWidget;

  final DataState state;
  final Function? functionSuccess;
  final String? messageSuccess;
  final bool hasMessageSuccess;
  const CheckStateInPostApiDataWidget(
      {super.key,
      required this.bottonWidget,
      required this.state,
        this.messageSuccess,
        this.hasMessageSuccess = true,
      this.functionSuccess});

  @override
  Widget build(BuildContext context) {
    print(state.stateData.toString());
    if (state.stateData == States.loaded) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        functionSuccess!();

       hasMessageSuccess? showFlashBarSuccess(
          message: messageSuccess??"شكرا تم اكمال العملية بنجاح",
              context: context,
            ):const SizedBox();
        state.stateData = States.initial;

      });

    } else if (state.stateData == States.error) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) {
          showFlashBarError(
            context: context,
            title: MessageOfErorrApi.getExeptionMessage(state.exception!).first,
            text: MessageOfErorrApi.getExeptionMessage(state.exception!).last,
          );
          state.stateData = States.initial;
        },
      );
    } else if (state.stateData == States.loading) {
      return const Text("");
    }
    return bottonWidget!;
  }
}
