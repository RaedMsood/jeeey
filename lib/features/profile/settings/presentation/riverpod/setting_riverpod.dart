import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/state/state_data.dart';
import '../../data/repos/settings_repo.dart';

final logoutProvider =
    StateNotifierProvider.autoDispose<LogoutController, DataState<Unit>>(
  (ref) {
    return LogoutController();
  },
);

class LogoutController extends StateNotifier<DataState<Unit>> {
  LogoutController() : super(DataState<Unit>.initial(unit));
  final _controller = SettingsReposaitory();

  Future<void> logout() async {
    state = state.copyWith(state: States.loading);

    final data = await _controller.logout();
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {
      state = state.copyWith(state: States.loaded);
    });
  }
}
