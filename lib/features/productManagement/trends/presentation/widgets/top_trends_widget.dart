import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeeey/core/helpers/navigateTo.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/auto_size_text_widget.dart';
import '../../../../../core/widgets/online_images_widget.dart';
import '../../data/model/trend_model.dart';
import '../pages/trend_page.dart';
import 'hexagon_image _widget.dart';
import 'title_and_description_of_the_trend_widget.dart';
import 'carousel_slider_for_the_top_trends_widget.dart';

class TopTrendsWidget extends StatefulWidget {
  const TopTrendsWidget({super.key});

  @override
  State<TopTrendsWidget> createState() => _TopTrendsWidgetState();
}

class _TopTrendsWidgetState extends State<TopTrendsWidget> {
  List<TrendModel> trends = [
    TrendModel(
      id: 1,
      image: "https://www.fay3.com/iQ4IUj5az/download",
      name: "#أزياء هاوندستوث",
      description: "نمط كلاسيكي مع مربعات صغيرة مكسورة",
    ),
    TrendModel(
      id: 2,
      image:
          "https://babyy.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F07%2F577-2.jpg&n=WkLH96WqPCwadwTgdr10Q",
      name: "#ستايل عملي",
      description: "تبدو الكاجوال مثالية لموسم الصيف",
    ),
    TrendModel(
      id: 3,
      image:
          "https://meaningg.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F07%2F3947-1.jpg&n=6HIfwnIaMkYZpv222iyJYw",
      name: "#ملائم تماما",
      description: "مصممة ومتعددة الاستخدامات للحصول على مظهر حاد ومصقول",
    ),
    TrendModel(
      id: 4,
      image: "https://meaningg.cc/wp-content/uploads/2019/07/3947-16.jpg",
      name: "#ملابس نسائية",
      description: "كولكشن ملابس نسائية روعة",
    ),
    TrendModel(
      id: 5,
      image:
          "https://babyy.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F07%2F577-2.jpg&n=WkLH96WqPCwadwTgdr10Q",
      name: "#ستايل عملي",
      description: "تبدو الكاجوال مثالية لموسم الصيف",
    ),
    TrendModel(
      id: 6,
      image: "https://meaningg.cc/wp-content/uploads/2019/07/3947-16.jpg",
      name: "#ملابس نسائية",
      description: "كولكشن ملابس نسائية روعة",
    ),
    TrendModel(
      id: 7,
      image:
          "https://meaningg.cc/?seraph_accel_gci=wp-content%2Fuploads%2F2019%2F07%2F3947-1.jpg&n=6HIfwnIaMkYZpv222iyJYw",
      name: "#ملائم تماما",
      description: "مصممة ومتعددة الاستخدامات للحصول على مظهر حاد ومصقول",
    ),
    TrendModel(
      id: 8,
      image: "https://www.fay3.com/iQ4IUj5az/download",
      name: "#أزياء هاوندستوث",
      description: "نمط كلاسيكي مع مربعات صغيرة مكسورة",
    ),
    TrendModel(
      id: 9,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUiYCu_O4vwu-qYVhK7B3OYc8QEdyZPEmmTA&s",
      name: "#ستايل عملي",
      description: "تبدو الكاجوال مثالية لموسم الصيف",
    ),
    TrendModel(
      id: 10,
      image:
          "https://cdn.dsmcdn.com/mnresize/600/-/ty1392/product/media/images/prod/QC/20240630/22/4a550e28-920b-37e1-9a57-9b7f73ff14a3/1_org_zoom.jpg",
      name: "#ملائم تماما",
      description: "مصممة ومتعددة الاستخدامات للحصول على مظهر حاد ومصقول",
    ),
  ];

  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });

    _scrollController.animateTo(
      index * 54.w,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSliderForTheTopTrendsWidget(
      trendsDate: trends,
      carouselController: _carouselController,
      onPageChanged: _onPageChanged,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){
              navigateTo(context, TrendPage(
                image: trends[_currentIndex].image,
                name: trends[_currentIndex].name,
                description: trends[_currentIndex].description,
              ));
            },
            child: TitleAndDescriptionOfTheTrendWidget(
              name: trends[_currentIndex].name,
              description: trends[_currentIndex].description,
            ),
          ),
          SizedBox(
            height: 48.h,
            child: ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                    _carouselController.jumpToPage(index);
                  },
                  child: _currentIndex == index
                      ? HexagonImageWidget(imageUrl: trends[index].image)
                      : Stack(
                          children: [
                            OnlineImagesWidget(
                              imageUrl: trends[index].image,
                              size: Size(48.w, 46.h),
                              borderRadius: 8.r,
                            ),
                            Container(
                              width: 48.w,
                              height: 46.h,
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: Colors.white70, width: 0.4.w),
                              ),
                              alignment: Alignment.center,
                              child: AutoSizeTextWidget(
                                text: trends[index].name,
                                colorText: Colors.white,
                                fontSize: 8.4.sp,
                                maxLines: 3,
                                minFontSize: 8,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 6.w),
              itemCount: trends.length,
            ),
          ),
          6.h.verticalSpace,
          Container(
            height: 12.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
              ),
            ),
            child: Container(
              height: 12.h,
              width: double.infinity,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  topLeft: Radius.circular(16.r),
                ),
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
              ),
          ),

        ],
      ),
    );
  }
}
