import 'package:dio/dio.dart';
import 'package:jeeey/core/state/state.dart';
import 'package:jeeey/features/profile/myOrders/data/model/order_model.dart';

class DataState<T> {
  States stateData;
  final DioException? exception;
  final T data;

  DataState({
    required  this.stateData,
    this.exception,
    required this.data,
  });

  factory DataState.initial(T data) {
    return DataState(
      stateData: States.initial,
      data: data,
    );
  }

  DataState<T> copyWith({
    required States state,
    DioException? exception,
    T? data,
  }) {
    return DataState(
      stateData: state,
      exception: exception,
      data: data ?? this.data,
    );
  }
}

// class PaginatedData<T> {
//   States stateData;
//   final DioException? exception;
//   final OrdersModel<T> data;
//
//   PaginatedData({
//     required this.stateData,
//     this.exception,
//     required this.data,
//   });
//
//   factory PaginatedData.initial(OrdersModel<T> data) {
//     return PaginatedData<T>(
//       stateData: States.initial,
//       data: data,
//     );
//   }
//   PaginatedData<T> success(OrdersModel<T> data) {
//     return PaginatedData<T>(
//       stateData: States.loaded,
//       // add data to the existing data
//       data: this.data.copyWith(
//         data: [...this.data.orders, ...data.orders],
//         currentPage: data.currentPage,
//         lastPage: data.lastPage,
//       ),
//       // errorModel: errorModel,
//     );
//   }
//   PaginatedData<T> loading() {
//     return PaginatedData<T>(
//       stateData: States.loading,
//       data: data,
//       exception: exception,
//     );
//   }
//
//   PaginatedData<T> loadingMore() {
//     return PaginatedData<T>(
//       stateData: States.loadingMore,
//       data: data,
//       exception: exception,
//     );
//   }
//   // PaginatedData<T> copyWith(
//   //     {ViewState? viewState,
//   //       PaginationModel<T>? data,
//   //       ErrorModel? errorModel}) {
//   //   return PaginatedData<T>(
//   //     viewState: viewState ?? this.viewState,
//   //     // add data to the existing data
//   //     data: data ?? this.data,
//   //     errorModel: errorModel ?? this.errorModel,
//   //   );
//   // }
//   PaginatedData<T> copyWith({
//     required States state,
//     DioException? exception,
//     OrdersModel<T>? data,
//   }) {
//     return PaginatedData<T>(
//       stateData: state,
//       exception: exception,
//       data: data ?? this.data,
//     );
//   }
// }
