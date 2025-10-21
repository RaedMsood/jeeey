import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/widgets/price_and_currency_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../core/widgets/show_modal_bottom_sheet_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../data/model/copon_data.dart';
import 'categories_of_copon_widget.dart';
import 'copon_date_widget.dart';
import 'product_copon_widget.dart';
import 'show_code_widget.dart';

class CardOfCoponWidget extends StatefulWidget {
  const CardOfCoponWidget(
      {super.key, required this.coponData, required this.showBottonShopping});

  final CoponData coponData;
  final bool showBottonShopping;

  @override
  State<CardOfCoponWidget> createState() => _CardOfCoponWidgetState();
}

class _CardOfCoponWidgetState extends State<CardOfCoponWidget> {
  bool isExpandedDetails = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: !widget.showBottonShopping
                ? Colors.grey[100]
                : AppColors.primaryColor.withOpacity(0.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AutoSizeTextWidget(
                              text: 'خصم ',
                              fontSize: 13.sp,
                              colorText: AppColors.primaryColor,
                            ),
                            PriceAndCurrencyWidget(
                              price: '${widget.coponData.discount}',
                              textWeight1: FontWeight.normal,
                              textWeight2: FontWeight.normal,
                              mainAxisAlignment: MainAxisAlignment.center,
                              fontSize1: 13.sp,
                            ),
                          ],
                        ),
                        4.verticalSpace,
                        Visibility(
                          visible: widget.coponData.minimumOrder != '',
                          replacement: AutoSizeTextWidget(
                            text: 'بدون حد ادنى للشراء',
                            colorText: AppColors.primaryColor,
                            fontSize: 8.sp,
                          ),
                          child: Row(
                            children: [
                              AutoSizeTextWidget(
                                text: 'طلبات اكثر من ',
                                fontSize: 7.sp,
                                colorText: AppColors.primaryColor,
                              ),
                              PriceAndCurrencyWidget(
                                price: '${widget.coponData.minimumOrder}',
                                textWeight1: FontWeight.normal,
                                textWeight2: FontWeight.normal,
                                fontSize1: 7.sp,
                                fontSize2: 7.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Visibility(
                      visible: widget.showBottonShopping,
                      child: Flexible(
                        child: DefaultButtonWidget(
                          text: 'تسوق',
                          background: AppColors.primaryColor,
                          width: 55.w,
                          height: 25.h,
                          onPressed: () {
                            scrollShowModalBottomSheetWidget(
                                context: context,
                                page: ProductCoponWidget(
                                  idCopon: widget.coponData.id ?? 1,
                                  coponDiscount:
                                      widget.coponData.discount.toString(),
                                  expirationDate:
                                      widget.coponData.expirationTime ?? '',
                                ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CategoriesOfCoponWidget(
                category: widget.coponData.categories ?? [],
              ),
              Divider(
                color: Colors.black,
                thickness: 0.1,
                height: 4.h,
              ),
              Row(
                children: [
                  Visibility(
                    visible: widget.coponData.expirationTime != null,
                    child: CoponDateWidget(
                      isProductPage: false,
                      expirationDate: DateTime.tryParse(
                          widget.coponData.expirationTime ?? ''),
                    ),
                  ),
                  IconShowCodeWidget(
                    onTab: () {
                      setState(() {
                        isExpandedDetails = !isExpandedDetails;
                      });
                    },
                    isExpandedDetails: isExpandedDetails,
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 2.sp),
                child: Visibility(
                  visible: isExpandedDetails,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeTextWidget(
                        text: 'العناصر المحددة',
                        fontSize: 9.sp,
                        colorText: AppColors.primaryColor,
                      ),
                      6.verticalSpace,
                      Row(
                        children: [
                          AutoSizeTextWidget(
                            text: 'الكود : ${widget.coponData.code}',
                            fontSize: 9.sp,
                            colorText: AppColors.primaryColor,
                          ),
                          8.horizontalSpace,
                          InkWell(
                            onTap: ()async{
                              await Clipboard.setData(ClipboardData(text: widget.coponData.code!));

                            },
                              child: Icon(Icons.copy,size: 13.sp,color:AppColors.primaryColor ,)),
                        ],
                      ),
                      4.verticalSpace,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: 23.w,
          padding: EdgeInsets.all(4.sp),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 0.1.r,
            ),
          ),
          child: AutoSizeTextWidget(
            text: widget.coponData.usageLimit.toString(),
            colorText: AppColors.primaryColor,
            minFontSize: 4,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
