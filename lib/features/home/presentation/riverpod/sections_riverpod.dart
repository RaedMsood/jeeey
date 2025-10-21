import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeeey/features/home/data/model/section_with_category_of_all_data.dart';
import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import '../../../home/data/model/section_with_product_data.dart';
import '../../../productManagement/detailsProducts/data/model/paginated_products_list_data.dart';
import '../../../productManagement/detailsProducts/presentation/state_mangment/riverpod_details.dart';
import '../../data/reposaitory/reposaitories.dart';

final sectionProvider = StateNotifierProvider<SectionNotifier,
    DataState<SectionWithCategoryOfAllData>>((ref) => SectionNotifier());

class SectionNotifier
    extends StateNotifier<DataState<SectionWithCategoryOfAllData>> {
  SectionNotifier()
      : super(DataState<SectionWithCategoryOfAllData>.initial(
            SectionWithCategoryOfAllData.empty())) {
    getMainSectionAndAllProduct();
  }

  int idSection = 1;

  final _controller = SectionReposaitory();

  Future<void> getMainSectionAndAllProduct() async {
    state = state.copyWith(state: States.loading);
    final data = await _controller.getAllSectionAndAllProductData();
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (section) {
      state = state.copyWith(state: States.loaded, data: section);
    });
  }

  getSectionId(int num) {
    idSection = num;
  }
}

final subSectionProvider = StateNotifierProvider.family<SubSectionNotifier,
    DataState<SectionAndProductData>, Tuple2<int, int>>(
  (ref, params) => SubSectionNotifier(
    ref ,
    params.value1,
    params.value2,
  ),
);
//
// class SubSectionNotifier
//     extends StateNotifier<DataState<SectionAndProductData>> {
//   SubSectionNotifier(this.idSection,this.idFilter)
//       : super(DataState<SectionAndProductData>.initial(
//       SectionAndProductData.empty())) {
//     getSubSectionData();
//   }
//
//   int idSection;
//   int idFilter;
//   //int filterType;
//   final _controller = SectionReposaitory();
//
//
//   Future<void> getSubSectionData({bool moreData = false,bool isRefresh = false,}) async {
//
//
//     // int totalPages = (state.data.product!.totalProduct! / state.data.product!.perPage!).ceil();
//     // if (state.data.product!.currentPage >= totalPages) {
//     //   return;
//     // }
//     // if (state.data.product!.currentPage >= state.data.product!.lastPage!) {
//     //     return; // نخرج مباشرة من الدالة
//     //   }
//
//     if(moreData ==true){
//       state = state.copyWith(state: States.loadingMore);
//     }else{
//
//       state = state.copyWith(state: States.loading);
//
//     }
//
//     int page =isRefresh==true?1 :state.data.product!.currentPage+1;
//     final data = await _controller.getSectionData(idSection,page,isRefresh,idFilter);
//
//     data.fold((f) {
//       state = state.copyWith(state: States.error, exception: f);
//     }, (section) {
//       print(idFilter.toString()+"------------------");
//
//         var oldData = state.data;
//         if (oldData.product!.data.isNotEmpty&&isRefresh==false) {
//
//           PaginatedProductsList productData;
//           productData=oldData.product!.copyWith(
//             data: [...oldData.product!.data,...section.product!.data],
//             currentPage: section.product!.currentPage,
//           );
//           oldData = oldData.copyWith(products: productData);
//         }
//         else{
//           oldData =section;
//         }
//         state = state.copyWith(state: States.loaded, data: oldData);
//
//
//     });
//   }
// }

class SubSectionNotifier
    extends StateNotifier<DataState<SectionAndProductData>> {
  SubSectionNotifier(this.ref,this.idSection, this.idFilter)
      : super(DataState<SectionAndProductData>.initial(
            SectionAndProductData.empty())) {
    getSubSectionData();
  }

  Ref ref;
  final int idSection;
  int idFilter;
  final _controller = SectionReposaitory();

  // خريطة لتخزين البيانات الخاصة بكل فلتر
  Map<int, PaginatedProductsList> filterProductMap = {};

  Future<void> getSubSectionData(
      {bool moreData = false, bool isRefresh = false}) async {
    // إذا كان هناك طلب لبيانات إضافية، نعرض حالة تحميل إضافي
    if (moreData) {
      state = state.copyWith(state: States.loadingMore);
    } else {
      state = state.copyWith(state: States.loading);
    }

    // نحدد الصفحة بناءً على ما إذا كانت العملية هي تحديث أم لا
    int page = isRefresh ? 1 : state.data.product!.currentPage + 1;

    // نحصل على البيانات من الـ API بناءً على `idSection` و `idFilter`
    final data =
        await _controller.getSectionData(idSection, page, isRefresh, idFilter);
    print(idFilter);
    // معالجة البيانات القادمة من الـ API
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (section) {
      var oldData = state.data;

      // إذا كانت البيانات الخاصة بالـ `idFilter` غير موجودة، نقوم بإنشاء قائمة جديدة
      if (!filterProductMap.containsKey(idFilter)) {
        filterProductMap[idFilter] = section.product!;
      } else {
        // إذا كانت البيانات موجودة بالفعل، نقوم بإضافة المنتجات الجديدة
        var existingData = filterProductMap[idFilter]!;
        var updatedData = existingData.copyWith(
          data: [...existingData.data, ...section.product!.data],
          currentPage: section.product!.currentPage,
        );
        filterProductMap[idFilter] = updatedData;
      }

      // إذا لم يكن هناك بيانات سابقة، نقوم بتخزين البيانات القادمة في الـ `filterProductMap`
      if (oldData.product!.data.isNotEmpty && !isRefresh) {
        PaginatedProductsList productData;
        productData = oldData.product!.copyWith(
          data: [...oldData.product!.data, ...section.product!.data],
          currentPage: section.product!.currentPage,
        );
        oldData = oldData.copyWith(products: productData);
      } else {
        oldData = section;
      }

      state = state.copyWith(state: States.loaded, data: oldData);
    });
  }
  Future<void> clearCacheAndRefresh() async {
    filterProductMap.clear();
    state = DataState<SectionAndProductData>.initial(SectionAndProductData.empty());
  }
  // عندما يتغير الـ `idFilter`، نقوم بتحديث البيانات
  void updateFilter(int newFilter) {
    idFilter = newFilter;
    // نقوم بتحديث البيانات باستخدام الـ `idFilter` الجديد
    getSubSectionData(isRefresh: true);
  }
}

class ColorIconAppBarNotifier extends StateNotifier<Color?> {
  ColorIconAppBarNotifier() : super(null);

  void setColorIcon(Color colorIcon) {
    state = colorIcon;
  }
}

final colorIconAppBarProvider =
    StateNotifierProvider<ColorIconAppBarNotifier, Color?>((ref) {
  return ColorIconAppBarNotifier();
});

class ColorBackAppBarNotifier extends StateNotifier<Color?> {
  ColorBackAppBarNotifier() : super(null);

  void setColorBackGround(Color colorBack) {
    state = colorBack;
  }
}

final colorBackAppBarProvider =
    StateNotifierProvider<ColorBackAppBarNotifier, Color?>((ref) {
  return ColorBackAppBarNotifier();
});

final getSectionFilterTypeProvider =
    StateNotifierProvider.family<GetSectionFilterTypeNotifier, int?, int?>(
        (ref, idSection) {
 return GetSectionFilterTypeNotifier();
});

class GetSectionFilterTypeNotifier extends StateNotifier<int?> {
  GetSectionFilterTypeNotifier() : super(null);

  void setSectionFilterNumber(int numberFillter) {
    state = numberFillter;
  }
}
