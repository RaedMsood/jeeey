import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'new_categories_card_widget.dart';

class HorizontalListOfNewCategoriesWidget extends StatefulWidget {
  const HorizontalListOfNewCategoriesWidget({super.key});

  @override
  State<HorizontalListOfNewCategoriesWidget> createState() =>
      _HorizontalListOfNewCategoriesWidgetState();
}

class _HorizontalListOfNewCategoriesWidgetState extends State<HorizontalListOfNewCategoriesWidget> {
  String tempCategoriesName = newCategories[0];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              tempCategoriesName = newCategories[index];
            });
          },
          child: NewCategoriesCardWidget(
            categoriesName: newCategories[index],
            tempCategoriesName: tempCategoriesName,
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 8.w,
      ),
      itemCount: newCategories.length,
    );
  }
}

final List<String> newCategories = [
  'الكل',
  'رجالي',
  'نسائي',
  'ملابس داخلية ملابس نوم',
  'رجالي2',
  'نسائي2',
  'ملابس رجالي ملابس نوم',
  'ملابس اطفال ملابس نوم',
  'ملابس خ ملابس نوم',
  'ملابس داخلية ملابس داخلية',
  '1 ولادي',
  'رجالي 1',
  'نسائي 1',
  'ولادي 1',
  'رجالي 1',
  'نسائي 1',
  '1ملابس رجالي ملابس نوم',
  'ملابس اطفال ملابس نوم1',
  'ملابس خ ملابس نوم1',
  '1ملابس داخلية ملابس داخلية',
  'ولادي 1',
  '1 ولادي',
  'رجالي 3',
  'نسائي 3',
  'ولادي 2',
  'رجالي 4',
  'نسائي 4',
  'ولادي 4',
  'ولادي 1',
  'رجالي 1',
  'نسائي 1',
  '1ملابس رجالي ملابس نوم',
  'ملابس اطفال ملابس نوم1',
  'ملابس خ ملابس نوم1',
  '1ملابس داخلية ملابس داخلية',
  'ولادي 1',
  '1 ولادي',
  'رجالي 3',
  'نسائي 3',
  'ولادي 2',
  'رجالي 4',
  'نسائي 4',
  'ولادي 4',

];
