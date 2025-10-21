import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/productManagement/search_product/presntation/state_mangment/riverpod.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';

class DeleteSearchModeWidget extends ConsumerWidget {
  const DeleteSearchModeWidget(
      {super.key,
      required this.deleteSearchMode,
      required this.onTapIconDelete});

  final bool deleteSearchMode;

  final GestureTapCallback onTapIconDelete;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        const AutoSizeTextWidget(
          text: "البحث الاخير",
          fontWeight: FontWeight.w700,
        ),
        const Spacer(),
        deleteSearchMode
            ? InkWell(
                onTap: () {
                  ref.read(searchHistoryProvider.notifier).clearSearchHistory();
                },
                child: AutoSizeTextWidget(
                  text: "مسح الكل",
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              )
            : InkWell(
                onTap: onTapIconDelete,
                child: Icon(
                  Icons.delete_outlined,
                  size: 20.sp,
                  color: AppColors.primaryColor,
                ),
              ),
      ],
    );
  }
}
