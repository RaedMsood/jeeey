import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeeey/core/state/check_state_in_post_api_data_widget.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/helpers/flash_bar_helper.dart';
import '../../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../../core/state/state.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/buttons/default_button.dart';
import '../../../../../core/widgets/buttons/icon_button_widget.dart';
import '../../../../../core/widgets/show_modal_bottom_sheet_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../services/auth/auth.dart';
import '../../../../../services/firebase/deep_link_services.dart';
import '../../../../shoppingBag/cart/presentation/pages/add_to_cart_page.dart';
import '../../../../shoppingBag/cart/presentation/riverpod/cart_riverpod.dart';
import '../../../wishlist/presentation/riverpod/wishlist_riverpod.dart';
import '../state_mangment/riverpod_details.dart';
import '../widget/app_bar_with_tabbar_of_details_widget.dart';
import '../widget/main_app_bar_of_details_widget.dart';
import '../widget/show_details_come_from_card_product_with_shimmer_widget.dart';
import '../widget/wares_part_in_details_widget.dart';

class DetailsPage extends ConsumerStatefulWidget {
  const DetailsPage({
    super.key,
    required this.idProduct,
    this.image,
    required this.name,
    required this.price,
  });

  final int idProduct;
  final List<String>? image;
  final String name;
  final dynamic price;

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
  bool isWishlist = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: 3, vsync: this);
    _pageController.addListener(() {
      if (_pageController.page!.toInt() < 3) {
        int newIndex = _pageController.page!.toInt();

        if (newIndex != _tabController.index) {
          _tabController.animateTo(newIndex);
        }
      } else {}
    });
  }

  final GlobalKey contentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(detailsProvider(widget.idProduct));
    var wishlistState = ref.watch(wishlistProvider.notifier);
    var cartState = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: Colors.white,
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
          widgetOfLoading: Stack(
            children: [
              ShowDetailsComeFromCardProductWithShimmerWidget(
                key: contentKey,
                price: widget.price,
                name: widget.name,
                image: widget.image!,
              ),
              Column(
                children: [
                  if (_scrollPosition <= appBarHeight)
                    MainAppBarOfDetailsWidget(
                      imageForShare:
                          widget.image!.isNotEmpty ? widget.image![0] : '',
                      descriptionForShare: state.data.description ?? '',
                      idProductForShare: state.data.id ?? 0,
                      nameForShare: state.data.name ?? '',
                      price: state.data.price.toString(),
                      hideShareButton: false,
                    ),
                  if (_scrollPosition >= appBarHeight)
                    AppBarWithTabBarOfDetailsWidget(
                      pageController: _pageController,
                      tabController: _tabController,
                      imageForShare:
                          widget.image!.isNotEmpty ? widget.image![0] : '',
                      descriptionForShare: state.data.description ?? '',
                      idProductForShare: state.data.id ?? 0,
                      nameForShare: state.data.name ?? '',
                      price: state.data.price.toString(),
                    ),
                ],
              ),
            ],
          ),
          widgetOfData: Stack(
            children: [
              ListView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                children: [
                  WaresPartInDetailsWidget(
                    key: contentKey,
                    productData: state.data,
                  ),
                ],
              ),
              Column(
                children: [
                  if (_scrollPosition <= appBarHeight)
                    MainAppBarOfDetailsWidget(
                      imageForShare:
                          widget.image!.isNotEmpty ? widget.image![0] : '',
                      descriptionForShare: state.data.description ?? '',
                      idProductForShare: state.data.id ?? 0,
                      nameForShare: state.data.name ?? '',
                      price: state.data.price.toString(),
                    ),
                  if (_scrollPosition >= appBarHeight)
                    AppBarWithTabBarOfDetailsWidget(
                      pageController: _pageController,
                      tabController: _tabController,
                      imageForShare:
                          widget.image!.isNotEmpty ? widget.image![0] : '',
                      descriptionForShare: state.data.description ?? '',
                      idProductForShare: state.data.id ?? 0,
                      nameForShare: state.data.name ?? '',
                      price: state.data.price.toString(),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: state.stateData == States.loaded
          ? FloatingActionButton(
              onPressed: () {
                DynamicLinkService.shareProductOnWhatsApp(
                    state.data.name ?? '',
                    state.data.description ?? '',
                    state.data.id ?? 0,
                    state.data.allImage![0],
                    state.data.price.toString());
              },
              backgroundColor: AppColors.primaryColor,
              child: SvgPicture.asset(
                AppIcons.whatsapp,
                height: 19.h,
                color: Colors.white,
              ),
            )
          : null,
      bottomNavigationBar: state.stateData == States.loaded
          ? Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  IconButtonWidget(
                    icon: state.data.favorite == true
                        ? AppIcons.wishlistActive
                        : AppIcons.wishlist,
                    height: state.data.favorite == true ? 24.h : 21.h,
                    onPressed: () {
                      if (!Auth().loggedIn) {
                        pressAgainToExit(
                          context: context,
                          text: S.of(context).loginRequired,
                        );
                      } else {
                        setState(
                            () => state.data.favorite = !state.data.favorite!);
                        if (state.data.favorite == true) {
                          wishlistState.addWishlist(
                              productId: widget.idProduct);
                        } else {
                          wishlistState.deleteWishlist(
                            productsIds: [widget.idProduct],
                          );
                        }
                      }
                    },
                  ),
                  4.w.horizontalSpace,
                  Expanded(
                    child: CheckStateInPostApiDataWidget(
                      state: cartState,
                      functionSuccess: () {},
                      messageSuccess: 'تمت اضافة المنتج الى السلة بنجاح',
                      bottonWidget: DefaultButtonWidget(
                        text: S.of(context).addToCart,
                        isLoading: cartState.stateData == States.loading,
                        height: 34.h,
                        textSize: 11.sp,
                        onPressed: () {
                          int idColor = ref
                              .read(changePriceProvider(state.data).notifier)
                              .getIdColor();
                          int idSize = ref
                              .read(changePriceProvider(state.data).notifier)
                              .getIdSize();
                          var price =
                              ref.watch(changePriceProvider(state.data));

                          if (idSize == 0) {
                            showModalBottomSheetWidget(
                              backgroundColor: Colors.transparent,
                              context: context,
                              page: AddToCartPage(
                                productId: widget.idProduct,
                              ),
                            );
                          } else {
                            ref.read(cartProvider.notifier).addToCart(
                                  prodectId: widget.idProduct,
                                  colorId: idColor,
                                  sizeId: idSize,
                                  price: price ?? state.data.price!,
                                  quantity: 1,
                                );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
