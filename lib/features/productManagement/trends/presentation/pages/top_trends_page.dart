import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jeeey/core/theme/app_colors.dart';
import 'package:jeeey/core/widgets/auto_size_text_widget.dart';
import 'package:jeeey/core/widgets/online_images_widget.dart';

import '../../../../../core/widgets/product_card.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/app_bar_top_trends_widget.dart';
import '../widgets/list_of_trend_products_widget.dart';
import '../widgets/top_trends_widget.dart';

class TopTrendsPage extends StatefulWidget {
  const TopTrendsPage({super.key});

  @override
  State<TopTrendsPage> createState() => _TopTrendsPageState();
}

class _TopTrendsPageState extends State<TopTrendsPage> {
  // with SingleTickerProviderStateMixin
  final ScrollController _scrollController = ScrollController();
  Color appBarBackgroundColor = AppColors.transparent;

  // late AnimationController _animationController;
  //  Animation<double>? _textOffsetAnimation; // حركة النص من اليمين إلى اليسار
  // Animation<double>?
  //     _containerOffsetAnimation; // حركة الكونتينر من اليسار إلى اليمين
  // Animation<double>? _containerWidthAnimation; // توسيع عرض الكونتينر
  // bool showText = true;

  @override
  void initState() {
    super.initState();
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 400), // مدة الحركة
    // );
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // if (_scrollController.offset > kToolbarHeight + 90.h) {
    //   // _textOffsetAnimation = Tween<double>(begin: 0, end: -0.0).animate(
    //   //     CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    //   _containerOffsetAnimation = Tween<double>(begin: 0.w, end: 0).animate(
    //       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    //   _containerWidthAnimation = Tween<double>(begin: 0, end: 280.w).animate(
    //       CurvedAnimation(
    //           parent: _animationController, curve: Curves.easeOutExpo));
    //   _animationController.forward();
    //   // setState(() {
    //   //   showText = false; // إخفاء النص بعد ظهور الكونتينر
    //   // });
    // } else if (_scrollController.offset > kToolbarHeight + 85.h) {
    //   _containerOffsetAnimation = Tween<double>(begin: 0.w, end: 0).animate(
    //       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    //   _animationController.reverse();
    //   // Future.delayed(const Duration(milliseconds: 250), () {
    //   //   setState(() {
    //   //     showText = true;
    //   //
    //   //   });
    //   // });
    // }
    if (_scrollController.offset > kToolbarHeight + 40.h) {
      if (appBarBackgroundColor == AppColors.transparent) {
        setState(() {
          appBarBackgroundColor = AppColors.primarySwatch.shade900;
        });
      }
    } else {
      if (appBarBackgroundColor == AppColors.primarySwatch.shade900) {
        setState(() {
          appBarBackgroundColor = AppColors.transparent;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBarTopTrendsWidget(
        backgroundColor: appBarBackgroundColor,
        // textOffsetAnimation: _textOffsetAnimation,
        // // تمرير حركة النص
        // containerOffsetAnimation: _containerOffsetAnimation,
        // // تمرير حركة الكونتينر
        // containerWidthAnimation: _containerWidthAnimation,
        // // تمرير توسيع الكونتينر
        // showText: showText,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const TopTrendsWidget(),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 11.w, right: 11.w, bottom: 12.h),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade50.withOpacity(.9),
                        Colors.purple.shade50.withOpacity(.7),
                        Colors.purple.shade50.withOpacity(.4),
                        Colors.purple.shade50.withOpacity(.3),
                        AppColors.whiteColor,
                        AppColors.whiteColor,
                        AppColors.whiteColor,
                        Colors.purple.shade50.withOpacity(.2),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                  child: AutoSizeTextWidget(
                    text: S.of(context).recommendedTrendsForYou,
                    fontSize: 12.8.sp,
                  ),
                ),
                ListOfTrendProductsWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
