import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import 'package:jeeey/features/productManagement/detailsProducts/data/model/product_data.dart';

import '../../data/model/color_data.dart';
import '../state_mangment/riverpod_details.dart';

class ListOfColorsProductWidget extends ConsumerStatefulWidget {
  const ListOfColorsProductWidget({super.key, required this.colorsProduct});

  final ProductData colorsProduct;

  @override
  ConsumerState<ListOfColorsProductWidget> createState() =>
      _ListOfColorsProductWidgetState();
}

class _ListOfColorsProductWidgetState
    extends ConsumerState<ListOfColorsProductWidget> {
  @override
  void initState() {
    ref.read(changePriceProvider(widget.colorsProduct).notifier).setIdColor(
        widget.colorsProduct.colorsProduct!.isEmpty
            ? 0
            : widget.colorsProduct.colorsProduct![0].idColor!);
    ref.read(changePriceProvider(widget.colorsProduct).notifier).setNameColor(
        widget.colorsProduct.colorsProduct!.isEmpty
            ? ''
            : widget.colorsProduct.colorsProduct![0].colorName!);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Wrap(
        spacing: 6.0.w,
        runSpacing: 6.0.h,
        children: widget.colorsProduct.colorsProduct!
            .asMap()
            .map((index, item) {
              return MapEntry(
                index,
                Consumer(
                  builder: (context, ref, child) {
                    final selectedIndex =
                        ref.watch(changeIndexOfColorImageProvider);
                    return GestureDetector(
                      onTap: () {
                        ref
                            .read(changeIndexOfColorImageProvider.notifier)
                            .setIndexColorImage(index);
                        ref
                            .read(changePriceProvider(widget.colorsProduct)
                                .notifier)
                            .setIdColor(item.idColor!);
                        ref
                            .read(changePriceProvider(widget.colorsProduct)
                                .notifier)
                            .setNameColor(item.colorName!);
                        ref
                            .read(showNumberOfScrollImageProvider.notifier)
                            .setIndexColorImage(1);
                      },
                      child: Container(
                        height: 20.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hexToColor(item.colorHex!),
                          boxShadow: selectedIndex == index
                              ? const [
                                  BoxShadow(
                                    color: AppColors.primaryColor,
                                    spreadRadius: 2.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 1.0,
                                  ),
                                ]
                              : [],
                          border: selectedIndex == index
                              ? null
                              : Border.all(
                                  color: Color(0xffE1E1E1),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              );
            })
            .values
            .toList());
  }
}

Color hexToColor(String hex) {
  hex = hex.replaceAll('#', '');
  if (hex.length == 6) {
    hex = 'FF$hex';
  }
  return Color(int.parse('0x$hex'));
}
