import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/state/state.dart';
import '../../../../../core/state/state_data.dart';
import '../../../detailsProducts/data/model/paginated_products_list_data.dart';
import '../../data/reposaitory/reposaitory.dart';

final selectedColorsProvider =
    StateNotifierProvider.family<SelectedColorsNotifier, List<int>, int>(
  (ref, pageId) => SelectedColorsNotifier(),
);

class SelectedColorsNotifier extends StateNotifier<List<int>> {
  SelectedColorsNotifier() : super([]);

  void toggleColor(int idColor) {
    // التأكد من وجود اللون في القائمة أو إزالته
    if (state.contains(idColor)) {
      state = List.from(state)..remove(idColor);
    } else {
      state = List.from(state)..add(idColor);
    }
  }
}

final selectedCategoryProvider =
    StateNotifierProvider.family<SelectedCategoryNotifier, int?, int>(
  (ref, idCategory) => SelectedCategoryNotifier(),
);

class SelectedCategoryNotifier extends StateNotifier<int?> {
  SelectedCategoryNotifier() : super(null);

  void selectCategory(int idCategory) {
    if (state == idCategory) {
      state = null;
    } else {
      state = idCategory;
    }
  }
}

final selectedPriceProvider =
    StateNotifierProvider.family<SelectedPriceNotifier, String?, int>(
  (ref, idCategory) => SelectedPriceNotifier(),
);

class SelectedPriceNotifier extends StateNotifier<String?> {
  SelectedPriceNotifier() : super(null);

  void selectPrice(String price) {
    if (state == price) {
      state = null;
    } else {
      state = price;
    }
  }
}

final selectedSizesProvider =
    StateNotifierProvider.family<SelectedSizesNotifier, List<int>, int>(
  (ref, pageId) => SelectedSizesNotifier(),
);

class SelectedSizesNotifier extends StateNotifier<List<int>> {
  SelectedSizesNotifier() : super([]);

  void toggleSize(int idSize) {
    if (state.contains(idSize)) {
      state = List.from(state)..remove(idSize);
    } else {
      state = List.from(state)..add(idSize);
    }
  }
}

final selectedUnitsProvider =
    StateNotifierProvider.family<SelectedUnitNotifier, List<int>, int>(
  (ref, pageId) => SelectedUnitNotifier(),
);

class SelectedUnitNotifier extends StateNotifier<List<int>> {
  SelectedUnitNotifier() : super([]);

  void toggleUnit(int idUnit) {
    if (state.contains(idUnit)) {
      state = List.from(state)..remove(idUnit);
    } else {
      state = List.from(state)..add(idUnit);
    }
  }
}

final filterProductProvider = StateNotifierProvider<FilterProductNotifier,
    DataState<PaginatedProductsList>>((ref) => FilterProductNotifier());

class FilterProductNotifier
    extends StateNotifier<DataState<PaginatedProductsList>> {
  FilterProductNotifier()
      : super(DataState<PaginatedProductsList>.initial(
            PaginatedProductsList.empty()));

  final _controller = FilterReposaitory();

  Future<void> getProductOfFilter(
      {List<int>? idSize,
      List<int>? idUnit,
      var idColor,
      int? idCategory,
      bool moreData = false,
      int? idSubCategory,
      String? price,
      String? nameSearch}) async {
    if (moreData) {
      state = state.copyWith(state: States.loadingMore);
    } else {
      state = state.copyWith(state: States.loading);
    }

    final int page = moreData ? state.data.currentPage + 1 : 1;

    final data = await _controller.getProductOfFilter(
        idSize: idSize ?? [],
        idUnit: idUnit ?? [],
        idColor: idColor,
        idCategory: idCategory ?? 1,
        page: page,
        idSubCategory: idSubCategory,
        nameSearch: nameSearch,
        price: price);

    data.fold(
      (f) {
        state = state.copyWith(state: States.error, exception: f);
      },
      (product) {
        if (moreData) {
          final updatedData = state.data.copyWith(
            data: [...state.data.data, ...product.data],
            currentPage: product.currentPage,
          );
          state = state.copyWith(state: States.loaded, data: updatedData);
        } else {
          state = state.copyWith(state: States.loaded, data: product);
        }
      },
    );
  }
}
