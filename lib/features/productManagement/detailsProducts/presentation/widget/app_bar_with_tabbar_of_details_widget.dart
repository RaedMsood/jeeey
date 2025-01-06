import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/text_form_field.dart';

class AppBarWithTabBarOfDetailsWidget extends StatelessWidget {
   AppBarWithTabBarOfDetailsWidget({super.key,required this.tabController,required this.pageController});
  late PageController pageController;
  late TabController tabController;
   TextEditingController controller = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 19.sp,
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Container(
            height: 35.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)),
            child: TextFormFieldWidget(
              controller: controller,
              prefix: const Icon(Icons.search),
              fillColor: Colors.grey[200],
              label: "blue skirt",
              labelFontSize: 13.sp,
              labelTextColor: Colors.black,
            ),
          ),

          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.black,
                    size: 19.sp,
                  ),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                    size: 19.sp,
                  ),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.density_medium_sharp,
                    color: Colors.black,
                    size: 19.sp,
                  ),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ],
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 40.h,
          alignment: Alignment.center,

          child: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            physics: const ClampingScrollPhysics(),
            dividerHeight: 0,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 33.sp),
            // indicator: BoxDecoration(
            //   borderRadius: BorderRadius.circular(25.sp),
            //   color: const Color(0xffFFF8ED),
            // ),
            tabAlignment: TabAlignment.center,
            tabs: const [
              Tab(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeTextWidget(
                    text: "السلع",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeTextWidget(
                    text: "التعليقات",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeTextWidget(
                    text: "التوصية",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            onTap: (index) {
             pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
          ),
        ),
      ],
    );
  }
}
