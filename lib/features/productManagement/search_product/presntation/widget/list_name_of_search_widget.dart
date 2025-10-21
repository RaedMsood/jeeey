import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/features/productManagement/search_product/data/model/search_data.dart';

import '../../../../category/presentation/pages/subcategory_product_filter_page.dart';
import '../state_mangment/riverpod.dart';

class ListNameOfSearchWidget extends ConsumerWidget {
  const ListNameOfSearchWidget({super.key,required this.namesSearch});
 final List<SearchData> namesSearch;

  @override
  Widget build(BuildContext context,ref) {
    return ListView.separated(
      itemBuilder: (context, index) => InkWell(
        onTap: (){
          navigateTo(context, SubcategoryProductFilterPage(
            isSearchPage: true,
            nameCategoryForHintSearch:namesSearch[index].name! ,
            nameSearch:namesSearch[index].name! ,
          ));
          ref.read(searchHistoryProvider.notifier).addSearchHistory(namesSearch[index].name!);

        },
        child: Padding(
          padding:  EdgeInsets.all(2.0.sp),
          child: Row(
            children: [
             const Icon(Icons.search),
              4.horizontalSpace,
              AutoSizeTextWidget(text: namesSearch[index].name!)
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(color: Colors.black,thickness: 0.1,),
      itemCount: namesSearch.length,

    );
  }
}
