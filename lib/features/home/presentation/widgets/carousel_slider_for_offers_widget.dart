import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/online_images_widget.dart';

class CarouselSliderForOffersWidget extends StatelessWidget {
  final List<dynamic> images;
  final double heightImage;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  const CarouselSliderForOffersWidget(
      {super.key, required this.onPageChanged, required this.images,required this.heightImage});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height:heightImage ,
        autoPlay: true,
        aspectRatio: 0,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        reverse: true,
        onPageChanged: onPageChanged,
      ),
      items: images.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return OnlineImagesWidget(
              imageUrl: imagePath,
              borderRadius: 0,
              fit: BoxFit.fill,
              size: const Size(double.infinity, double.infinity),
            );
          },
        );
      }).toList(),
    );
  }
}

// Column(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Stack(
// alignment: Alignment.bottomCenter,
// children: [
// ClipRect(
// child: Align(
// alignment: Alignment.bottomCenter,
// heightFactor: 0.5,
// child: Image.network(
// imagePath,
// fit: BoxFit.cover,
// width: MediaQuery.of(context).size.width,
// ),
// ),
// ),
//
// ],
// ),
// ],
// );
