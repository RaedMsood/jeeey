import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/state/state_data.dart';
import '../../../../../services/auth/auth.dart';
import '../../data/repos/settings_repo.dart';

final languageProvider =
    StateNotifierProvider<LanguageController, Locale>((ref) {
  return LanguageController();
});

class LanguageController extends StateNotifier<Locale> {
  LanguageController() : super(const Locale('ar')) {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    try {
      final savedLanguage = await Auth().getLanguage();
      state = Locale(savedLanguage);
    } catch (e) {
      state = const Locale('ar');
      debugPrint("Error loading language: $e");
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    try {
      await Auth().setLanguage(languageCode);
      state = Locale(languageCode);
    } catch (e) {
      debugPrint("Error changing language: $e");
    }
  }
}

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

final manageMyAccountProvider = StateNotifierProvider.autoDispose<
    ManageMyAccountController, DataState<Unit>>(
  (ref) {
    return ManageMyAccountController();
  },
);

class ManageMyAccountController extends StateNotifier<DataState<Unit>> {
  ManageMyAccountController() : super(DataState<Unit>.initial(unit));
  final _controller = SettingsReposaitory();

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    state = state.copyWith(state: States.loading);

    final data = await _controller.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (data) {
      state = state.copyWith(state: States.loaded);
    });
  }
}

