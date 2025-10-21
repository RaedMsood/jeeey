import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../category/presentation/pages/subcategory_product_filter_page.dart';
import '../state_mangment/riverpod.dart';

AppBar appBarSearchWidget({
  required BuildContext context,
  required TextEditingController search,
  required Function(String) onSearchChanged,
  required bool isTypingStarted,
}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 50,
    leading: Padding(
      padding: EdgeInsets.only(right: 15.0.sp),
      child: InkWell(
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ),
    leadingWidth: 30.h,
    title: Consumer(
      builder: (context, ref, child) => SizedBox(
        height: 33.h,
        width: double.infinity,
        child: TextFormFieldWidget(
          controller: search,
          autofocus: true,
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          // label:search.text ,
          fieldValidator: (value) {
            if (value == null || value.toString().isEmpty) {
              return S.of(context).pleaseEnterYourPhoneNumberOrEmail;
            }
          },
          // actionButton: TextInputAction.search,
          onSubmit: (value) {
            navigateTo(
                context,
                SubcategoryProductFilterPage(
                  isSearchPage: true,
                  nameCategoryForHintSearch: value,
                  nameSearch: value,
                ));
            ref.read(searchHistoryProvider.notifier).addSearchHistory(value);
          },
          // borderRadius: 20.sp,
          cursorColor: Colors.black,
          contentPadding:
              EdgeInsets.only(bottom: 10.sp, left: 10.sp, right: 10.sp),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isTypingStarted
                  ? InkWell(
                      onTap: () {
                        search.clear();
                        onSearchChanged('');
                      },
                      child: Icon(
                        Icons.close,
                        size: 20.sp,
                        color: AppColors.primaryColor,
                      ),
                    )
                  //   : Icon(
                  //       Icons.camera_alt_outlined,
                  //       size: 20.sp,
                  // color: AppColors.primaryColor,
                  //     ),
                  : const SizedBox(),
              6.horizontalSpace,
              Container(
                width: 50.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              4.horizontalSpace,
            ],
          ),
          onChanged: onSearchChanged,
        ),
      ),
    ),
    // backgroundColor: Colors.white,
  );
}
