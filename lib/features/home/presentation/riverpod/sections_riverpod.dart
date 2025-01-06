import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeeey/features/home/data/model/section_with_category_of_all_data.dart';
import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import '../../../home/data/model/section_with_product_data.dart';
import '../../../productManagement/detailsProducts/data/model/paginated_products_list_data.dart';
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
  Color iconColor = Colors.white;
  Color appBarColor = Colors.transparent;
  double offst = 0;
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

  colorIconOfAppBar(Color iconsColor) {
    iconColor = iconsColor;

    print(iconColor);
  }

  coloBackGroundOfAppBar(Color backGroundColor) {
    appBarColor = backGroundColor;
    print(appBarColor);
  }

  getOffsetNumberOfHomePage(double offset) {
    offst = offset;
  }
}

final subSectionProvider = StateNotifierProvider.family<
    SubSectionNotifier,
    DataState<SectionAndProductData>,
    int>((ref, idSection) => SubSectionNotifier(idSection));

class SubSectionNotifier
    extends StateNotifier<DataState<SectionAndProductData>> {
  SubSectionNotifier(this.idSection)
      : super(DataState<SectionAndProductData>.initial(
      SectionAndProductData.empty())) {
    getSubSectionData();
  }

  int idSection;
  final _controller = SectionReposaitory();

  Future<void> getSubSectionData({bool moreData = false,bool isRefresh = false}) async {
    if(moreData ==true){
      state = state.copyWith(state: States.loadingMore);
    }else{

      state = state.copyWith(state: States.loading);

    }

    int page =isRefresh==true?1 :state.data.product!.currentPage+1;
    final data = await _controller.getSectionData(idSection,page,isRefresh);
    data.fold((f) {
      state = state.copyWith(state: States.error, exception: f);
    }, (section) {
      var oldData = state.data;
      if (oldData.product!.data.isNotEmpty&&isRefresh==false) {

        PaginatedProductsList productData;
        productData=oldData.product!.copyWith(
          data: [...oldData.product!.data,...section.product!.data],
          currentPage: section.product!.currentPage,
        );
        oldData = oldData.copyWith(products: productData);
      }
      else{
        oldData =section;
      }
      state = state.copyWith(state: States.loaded, data: oldData);
    });
  }
}



class SectionIdNotifier extends StateNotifier<int?> {
  SectionIdNotifier() : super(null);

  void setSectionId(int id) {
    state = id; // تحديث قيمة الـ id
  }
}

final sectionIdProvider = StateNotifierProvider<SectionIdNotifier, int?>((ref) {
  return SectionIdNotifier();
});



class ColorIconAppBarNotifier extends StateNotifier<Color?> {
  ColorIconAppBarNotifier() : super(null);

  void setColorIcon(Color colorIcon) {
    state = colorIcon;
  }
}

final colorIconAppBarProvider = StateNotifierProvider<ColorIconAppBarNotifier, Color?>((ref) {
  return ColorIconAppBarNotifier();
});



class ColorBackAppBarNotifier extends StateNotifier<Color?> {
  ColorBackAppBarNotifier() : super(null);

  void setColorBackGround(Color colorBack) {
    state = colorBack;
  }
}

final colorBackAppBarProvider = StateNotifierProvider<ColorBackAppBarNotifier, Color?>((ref) {
  return ColorBackAppBarNotifier();
});