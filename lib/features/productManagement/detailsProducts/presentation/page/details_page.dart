import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/helpers/navigateTo.dart';
import '../../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../../core/widgets/show_modal_bottom_sheet_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../services/auth/auth.dart';
import '../../../../shoppingBag/cart/presentation/pages/add_to_cart_page.dart';
import '../../../../user/presentation/pages/log_in_page.dart';
import '../state_mangment/riverpod_details.dart';
import '../widget/app_bar_with_tabbar_of_details_widget.dart';
import '../widget/main_app_bar_of_details_widget.dart';
import '../widget/wares_part_in_details_widget.dart';

class DetailsPage extends ConsumerStatefulWidget {
  const DetailsPage({super.key, required this.idProduct});

  final int idProduct;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage>
    with TickerProviderStateMixin {
  double _scrollPosition = 0.0;

  late TabController _tabController;

  final appBarHeight = 120.0; // ارتفاع الـ AppBar العادي
  bool isAnimating = false;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _tabController = TabController(length: 3, vsync: this);
    _pageController.addListener(() {
      // print( _pageController.page!.toInt());
      // print( _pageController.page!.floor());
      // print( _pageController.page!.round());
      // print( _pageController.page!);
      if (_pageController.page!.toInt() < 3) {
        int newIndex = _pageController.page!.toInt();

        if (newIndex != _tabController.index) {
          _tabController.animateTo(newIndex);
        }
      } else {}
    });
  }

  final GlobalKey contentKey = GlobalKey();
  final GlobalKey commentsKey = GlobalKey();
  final GlobalKey otherSectionKey = GlobalKey();
  final GlobalKey imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(detailsProvider(widget.idProduct));

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: NotificationListener<ScrollNotification>(
        onNotification: (
          ScrollNotification scrollNotification,
        ) {
          setState(() {
            _scrollPosition = scrollNotification.metrics.pixels;
          });
          return true;
        },
        child: CheckStateInGetApiDataWidget(
          state: state,
          widgetOfData: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: _pageController,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(), // إيقاف التمرير
                      children: [
                        WaresPartInDetailsWidget(
                          key: contentKey,
                          productData: state.data,
                        ),
                        2.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  if (_scrollPosition <= appBarHeight)
                    const MainAppBarOfDetailsWidget(),
                  if (_scrollPosition >= appBarHeight)
                    AppBarWithTabBarOfDetailsWidget(
                      pageController: _pageController,
                      tabController: _tabController,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:state.stateData==States.loaded? Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            IconButtonWidget(
              icon: AppIcons.wishlist,
              height: 20.h,
              onPressed: () {},
            ),
            4.w.horizontalSpace,
            Expanded(
              child: DefaultButtonWidget(
                text: S.of(context).addToCart,
                textSize: 12.5.sp,
                onPressed: () {
                  if (!Auth().loggedIn) {
                    navigateTo(context, const LogInPage());
                  } else {
                    showModalBottomSheetWidget(
                      backgroundColor: Colors.transparent,
                      context: context,
                      page: AddToCartPage(
                        productId: state.data.id!,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ):null,
    );
  }
}
