import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme/app_colors.dart';

class CarouselSliderForOffersWidget extends StatefulWidget {
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  const CarouselSliderForOffersWidget({super.key, required this.onPageChanged});

  @override
  State<CarouselSliderForOffersWidget> createState() =>
      _CarouselSliderForOffersWidgetState();
}

class _CarouselSliderForOffersWidgetState
    extends State<CarouselSliderForOffersWidget> {
  final List<String> images = [
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s',
    'https://letsenhance.io/static/03620c83508fc72c6d2b218c7e304ba5/11499/UpscalerAfter.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG1X1dlZuFdyXtSX3gXdycKtVeXGtGOzsfdw&s'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        // height: 140.h,
        autoPlay: true,
        aspectRatio: 2,
        viewportFraction: 2,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        reverse: true,
        onPageChanged: widget.onPageChanged,
      ),
      items: images.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRect(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.5,
                        // لقص الجزء السفلي
                        child: Image.network(
                          imagePath,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: SmoothPageIndicator(
                        controller: PageController(initialPage: 1),
                        count: images.length,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: AppColors.whiteColor,
                          dotColor: Colors.white38,
                          dotHeight: 3.5,
                          dotWidth: 14,
                          expansionFactor: 2,
                          spacing: 6.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
