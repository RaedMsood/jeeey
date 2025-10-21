import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/helpers/flash_bar_helper.dart';
import '../../../../core/network/errors/remote_exception.dart';
import '../../../../core/state/state.dart';
import '../../../../core/state/state_data.dart';
import '../../../category/presentation/widgets/list_to_display_categories_on_the_home_widget.dart';
import '../../data/model/section_with_product_data.dart';
import 'skeletonizer_section_widget.dart';
import 'tab_bar_sub_section_widget.dart';

class CheckSubSectionAndCategoryWidget  extends StatelessWidget {
  const CheckSubSectionAndCategoryWidget({super.key,required this.state});
 final DataState<SectionAndProductData> state ;
  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            if (state.stateData == States.loading) {
              return const SkeletonizerSectionWidget();
            } else if (state.stateData == States.loaded ||
                state.stateData == States.loadingMore) {
              return Column(
                children: [
                  if (state.data.sections?.isNotEmpty == true)
                    state.data.sections![0].hasSubSection == "true"
                        ? TabBarSubSectionWidget(
                      sections: state.data.sections!,
                    )
                        : ListToDisplayCategoriesOnTheHomeWidget(
                      category:
                      state.data.sections![0].category ?? [],
                    ),
                  // const ListOfMajorOffersWidget(),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  //   child: Row(
                  //     children: const [
                  //       Expanded(child: ListOfTrendWidget()),
                  //       SizedBox(width: 6),
                  //       Expanded(child: ListOfDiscountWidget()),
                  //     ],
                  //   ),
                  // ),
                ],
              );
            } else if (state.stateData == States.error) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                showFlashBarError(
                  context: context,
                  title: MessageOfErorrApi.getExeptionMessage(
                      state.exception!)
                      .first,
                  text: MessageOfErorrApi.getExeptionMessage(
                      state.exception!)
                      .last,
                );
                state.stateData = States.initial;
              });
            }
            return const SkeletonizerSectionWidget();
          }),
        ],
      ),
    );
  }
}
