import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/helpers/navigateTo.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/auto_size_text_widget.dart';
import '../../data/model/address_model.dart';
import '../pages/add_or_update_an_address_page.dart';
import '../riverpod/address_riverpod.dart';

class AddressCardWidget extends ConsumerWidget {
  final AddressModel address;

  const AddressCardWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.watch(mapProvider);
        ref.read(mapProvider.notifier).locationIsEmpty = false;
        navigateTo(
          context,
          AddANewAddressPage(
            address: address,
            onSuccess: () {
              ref.refresh(getAllAddressesProvider);
              Navigator.of(context).pop();
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.cardAddress,
              height: 44.h,
            ),
            8.w.horizontalSpace,
            Flexible(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeTextWidget(
                      text: address.address.toString(),
                      fontSize: 13.6.sp,
                      maxLines: 2,
                      fontWeight: FontWeight.w600,
                    ),
                    3.h.verticalSpace,
                    AutoSizeTextWidget(
                      text:
                          "${address.cityName.toString()} - ${address.districtName.toString()}",
                      fontSize: 10.6.sp,
                      maxLines: 2,
                      colorText: AppColors.greySwatch.shade600,
                    ),
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              AppIcons.arrowLeft,
              color: AppColors.primaryColor,
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
