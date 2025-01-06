import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/color_data.dart';
import '../state_mangment/riverpod_details.dart';

class ListOfColorsProductWidget extends StatefulWidget {
  const ListOfColorsProductWidget({super.key, required this.colorsProduct});

  final List<ColorOfProductData> colorsProduct;

  @override
  State<ListOfColorsProductWidget> createState() =>
      _ListOfColorsProductWidgetState();
}

class _ListOfColorsProductWidgetState extends State<ListOfColorsProductWidget> {

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 6.0.w,
        runSpacing: 6.0.h,
        children: widget.colorsProduct
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
                      },
                      child: Container(
                        height: 25.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hexToColor(item.colorHex!),
                          border: selectedIndex == index
                              ? Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                )
                              : null,
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
