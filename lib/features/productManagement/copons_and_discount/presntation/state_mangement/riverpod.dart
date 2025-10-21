import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/state/state.dart';
import '../../../../../core/state/state_data.dart';
import '../../../detailsProducts/data/model/paginated_products_list_data.dart';
import '../../data/model/paginatied_copon_data.dart';
import '../../data/reposaitory/reposaitory.dart';

class CoponNotifier extends StateNotifier<DataState<PaginatedCoponList>> {
  CoponNotifier(this.idFilter)
      : super(
            DataState<PaginatedCoponList>.initial(PaginatedCoponList.empty())) {
    getCoponData();
  }

  //final int idSection;
  int idFilter;
  final _controller = CoponReposaitory();

  // خريطة لتخزين البيانات الخاصة بكل فلتر
  Map<int, PaginatedCoponList> filterProductMap = {};

  Future<void> getCoponData(
      {bool moreData = false, bool isRefresh = false}) async {
    // إذا كان هناك طلب لبيانات إضافية، نعرض حالة تحميل إضافي
    if (moreData) {
      state = state.copyWith(state: States.loadingMore);
    } else {
      state = state.copyWith(state: States.loading);
    }

    int page =
        moreData == false ? 0 : filterProductMap[idFilter]?.currentPage ?? 0;
    page++;
    final data = await _controller.getCoponsData(page, idFilter);
    print(idFilter);
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (order) {
      var oldData = state.data;

      // إذا كانت البيانات الخاصة بالـ `idFilter` غير موجودة، نقوم بإنشاء قائمة جديدة
      if (!filterProductMap.containsKey(idFilter)) {
        filterProductMap[idFilter] = order;
      } else {
        // إذا كانت البيانات موجودة بالفعل، نقوم بإضافة المنتجات الجديدة
        var existingData = filterProductMap[idFilter]!;
        var updatedData = existingData.copyWith(
          data: [...existingData.data, ...order.data],
          currentPage: order.currentPage,
        );
        filterProductMap[idFilter] = updatedData;
      }

      // إذا لم يكن هناك بيانات سابقة، نقوم بتخزين البيانات القادمة في الـ `filterProductMap`
      if (oldData.data.isNotEmpty && !isRefresh) {
        PaginatedCoponList productData;
        productData = oldData.copyWith(
          data: [...oldData.data, ...order.data],
          currentPage: order.currentPage,
        );
        oldData = oldData.copyWith(data: productData.data);
      } else {
        oldData = order;
      }

      state = state.copyWith(state: States.loaded, data: oldData);
    });
  }


}

final getCoponProvider = StateNotifierProvider.family<CoponNotifier,
    DataState<PaginatedCoponList>, int>(
  (ref, numFilter) => CoponNotifier(numFilter),
);

final productCoponProvider = StateNotifierProvider.family<
    ProductCoponNotifier,
    DataState<PaginatedProductsList>,
    int>((ref, idCopon) => ProductCoponNotifier(idCopon));

class ProductCoponNotifier
    extends StateNotifier<DataState<PaginatedProductsList>> {
  ProductCoponNotifier(this.idCopon)
      : super(DataState<PaginatedProductsList>.initial(
            PaginatedProductsList.empty())) {
    getProductOfFilter();
  }

  final _controller = CoponReposaitory();
  final int idCopon;

  Future<void> getProductOfFilter({bool moreData = false}) async {
    if (moreData) {
      state = state.copyWith(state: States.loadingMore);
    } else {
      state = state.copyWith(state: States.loading);
    }

    final int page = moreData ? state.data.currentPage + 1 : 1;

    final data =
        await _controller.productsOfCopon(idCopon: idCopon, page: page);
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
