import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/state/state_data.dart';

abstract class HomeProductsFilter {
  static String all = "all";
  static String famous = "most_famous";
  static String rated = "most_rated";
}

final filterProductsProvider =
    StateNotifierProvider<FilterProductsRiverpodController, dynamic>(
  (ref) => FilterProductsRiverpodController(ref),
);

class FilterProductsRiverpodController
    extends StateNotifier<dynamic> {
  var filter = HomeProductsFilter.all;

  FilterProductsRiverpodController(super.state);


  // FilterProductsRiverpodController(super.state);

  changeFilter(String filter) async {
    this.filter = filter;
     state =state;
    // state = state.copyWith(
    //   data: state.data.copyWith(
    //     data: [],
    //     currentPage: 0,
    //     lastPage: 0,
    //   ),
    // );
    // await getData();
  }
}
// final changeWalletProviders = StateNotifierProvider<ChangeWalletNotifier, dynamic>(
//         (ref) => ChangeWalletNotifier(ref));
//
// class ChangeWalletNotifier extends StateNotifier<DataState> {
//
//   int numWallet=0;
//   ChangeWalletNotifier(super._state);
//
//   getWalletNumber(int num){
//     numWallet = num;
//     state =state.copyWith(state: States.changeWallet, data: numWallet);
//   }

//}