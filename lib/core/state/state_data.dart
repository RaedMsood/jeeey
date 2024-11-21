import 'package:dio/dio.dart';
import 'package:risk/core/state/state.dart';
import 'package:risk/features/wallet/data/model/wallet_model.dart';

class DataState {
  States stateData;
  final DioException? exception;
   dynamic data;

  DataState({
    required this.stateData,
    this.exception,
    this.data,
  });

  factory DataState.initial() {
    return DataState(stateData: States.initial);
  }

  DataState copyWith({
    required States state,
    DioException? exception,
    dynamic data,
  }) {
    return DataState(stateData: state, exception: exception, data: data);
  }
}

