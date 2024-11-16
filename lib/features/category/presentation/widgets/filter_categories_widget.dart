import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/features/home/presentation/widgets/sliver_appbar_home_widget.dart';

import '../../../../core/widgets/auto_size_text_widget.dart';

class FilterCategoriesWidget extends StatefulWidget {
  const FilterCategoriesWidget({super.key});

  @override
  State<FilterCategoriesWidget> createState() => _FilterCategoriesWidgetState();
}

class _FilterCategoriesWidgetState extends State<FilterCategoriesWidget> {
  List<String> categoryName = [
    'لأجلكم فقط',
    'تخفيضات',
    'ملابس نسائية',
    'ملابس داخلية',
    'المنزل',
    'الصحة والجمال الصحة والجمال',
    'اطفال',
    'جديد في جي Jeeey',
    'احذية',
    'لأجلكم فقط1',
    'تخفيضات ص',
    'ملابس نسائية ص',
    'ملابس داخلية ؤ',
    'المنزل لا',
    'الصحة والجمال الصحة والجمال ر',
    'اطفال ب',
    'جديد في جي  بJeeey',
    'احذيةر',
    'الصحة والجمال الصحة والجمال ر',
    'اطفال ر',
    'جديد في جي  ر رJeeey',
    'احذيةرؤ',
    'لأجلكم فقط يؤؤر',
    'تخفيضات ي',
    'ملابس نسائية س',
  ];
  String tempCategoryName = categories[0];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categoryName.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                tempCategoryName = categoryName[index];
              });
            },
            child: Container(
              color: tempCategoryName == categoryName[index]
                  ? Colors.white
                  : Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (tempCategoryName == categoryName[index])
                    Container(
                      height: 18.h,
                      width: 4.5.w,
                      color: Colors.black87,
                    ),
                  2.w.horizontalSpace,
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: AutoSizeTextWidget(
                        text: categoryName[index],
                        fontSize: 12.sp,
                        colorText: tempCategoryName == categoryName[index]
                            ? Colors.black
                            : Colors.grey[800],
                        fontWeight: tempCategoryName == categoryName[index]
                            ? FontWeight.w600
                            : FontWeight.w500,
                        maxLines: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
