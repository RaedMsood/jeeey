import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/state/check_state_in_get_api_data_widget.dart';
import 'package:jeeey/core/state/state.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/product_list_widget.dart';
import '../../../../../core/widgets/skeletonizer_widget.dart';
import '../../../detailsProducts/data/model/product_data.dart';
import '../state_mangement/riverpod.dart';
import 'copon_date_widget.dart';

class ProductCoponWidget extends ConsumerStatefulWidget {
  const ProductCoponWidget(
      {super.key,
      required this.idCopon,
      required this.coponDiscount,
      required this.expirationDate});

  final int idCopon;
  final String coponDiscount;
  final String expirationDate;

  @override
  ConsumerState<ProductCoponWidget> createState() => _ProductCoponWidgetState();
}

class _ProductCoponWidgetState extends ConsumerState<ProductCoponWidget> {
  late ScrollController scrollController;
  Timer? _debounceTimer;
  bool isLoadingMore = false;

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (!mounted) return;

    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!isLoadingMore) {
        setState(() {
          isLoadingMore = true;
        });

        _debounceTimer?.cancel();
        _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
          try {
            await ref
                .read(productCoponProvider(widget.idCopon).notifier)
                .getProductOfFilter(moreData: true);
          } finally {
            setState(() {
              isLoadingMore = false;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productCoponProvider(widget.idCopon));
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 70.h,
            color: Colors.deepOrange,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeTextWidget(
                    colorText: Colors.white,
                    text:
                        'اضف منتجات لاستخدام كوبون بخصم ${widget.coponDiscount}'),
                Visibility(
                  visible: widget.expirationDate != '',
                  child: CoponDateWidget(
                    isProductPage: true,
                    expirationDate: DateTime.tryParse(widget.expirationDate),
                  ),
                ),
              ],
            ),
          ),
          CheckStateInGetApiDataWidget(
            state: state,
            widgetOfData: ProductListWidget(
              product: state.data.data,
              isLoadingMore: state.stateData == States.loadingMore,
            ),
            widgetOfLoading: SkeletonizerWidget(
                child: ProductListWidget(
              product: ProductData.fakeProductData,
            )),
          ),
        ],
      ),
    );
  }
}
