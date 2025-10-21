import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../core/widgets/skeletonizer_widget.dart';
import '../../data/model/category_data.dart';
import '../riverpod/category_riverpod.dart';
import 'circle_card_for_categories_widget.dart';
import 'skeletonizer_sub_category_in_main_pages.dart';

class ListOfSubcategoryInMainPages extends ConsumerWidget {
  final int idCategory;

  const ListOfSubcategoryInMainPages({super.key, required this.idCategory});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(categoryProvider(idCategory));

    return CheckStateInGetApiDataWidget(
      state: state,
      widgetOfLoading:const SkeletonizerSubCategoryInMainPages(),
      widgetOfData: Container(
        width: MediaQuery.of(context).size.width / 1.42,
        color: Colors.white,
        child: GridView.builder(
            padding: EdgeInsets.all(12.sp),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.75),
            itemCount: state.data.category!.length,
            itemBuilder: (context, index) {
              return CircleCardForCategoriesWidget(
                idCategory: state.data.category![index].id!,
                image: state.data.category![index].image ??
                    'https://artic.fakera.com/wp-content/uploads/2020/06/IMG-20200615-WA0083.jpg',
                name: state.data.category![index].name!,
                circularRadius: 32.sp,
              );
            }),
      ),
    );
  }
}
