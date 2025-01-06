import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeeey/features/home/presentation/pages/home_page.dart';
import '../../../features/category/presentation/pages/category_page.dart';
import '../../../features/new/presentation/pages/new_page.dart';
import '../../../features/profile/main/presentation/pages/profile_page.dart';
import '../../../features/shoppingBag/cart/presentation/pages/cart_page.dart';
import '../../../generated/l10n.dart';
import '../../constants/app_icons.dart';
import '../../helpers/exit_from_the_app.dart';
import '../../theme/app_colors.dart';
import 'design_for_bottom_navigation_bar_widget.dart';

var activeIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavigationBarWidget extends ConsumerStatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  ConsumerState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends ConsumerState<BottomNavigationBarWidget> {
  final List<Widget> _pages = [
    const ExitFromAppWidget(child: HomePage()),
    const ExitFromAppWidget(child: CategoryPage()),
    const ExitFromAppWidget(child: NewPage()),
    const ExitFromAppWidget(child: CartPage()),
    const ExitFromAppWidget(child: ProfilePage()),
  ];

  @override
  Widget build(BuildContext context) {
    var activeIndex = ref.watch(activeIndexProvider);

    return Scaffold(
      body: _pages[activeIndex],
      bottomNavigationBar: Container(
        color: AppColors.whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(AppIcons.home, AppIcons.homeActive,
                S.of(context).home, 0, activeIndex),
            _buildNavItem(AppIcons.category, AppIcons.categoryActive,
                S.of(context).category, 1, activeIndex),
            _buildNavItem(AppIcons.newIcon, AppIcons.newActive,
                S.of(context).neww, 2, activeIndex),
            _buildNavItem(AppIcons.cart, AppIcons.cartActive,
                S.of(context).cart, 3, activeIndex),
            _buildNavItem(AppIcons.profile, AppIcons.profileActive,
                S.of(context).profile, 4, activeIndex),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, String activeIcon, String label, int index,
      int activeIndex) {
    return DesignForBottomNavigationBarWidget(
      icon: icon,
      activeIcon: activeIcon,
      label: label,
      active: activeIndex == index,
      onTap: () {
        if (mounted) {
          ref.read(activeIndexProvider.notifier).state = index;
        }
      },
    );
  }
}
// class BottomNavigationBarWidget extends StatefulWidget {
//   const BottomNavigationBarWidget({super.key});
//
//   @override
//   State<BottomNavigationBarWidget> createState() =>
//       _BottomNavigationBarWidgetState();
// }
//
// class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
//   int currentIndex = 0;
//
//   List pages = [
//     const ExitFromAppWidget(child: ProfilePage()),
//     const ExitFromAppWidget(child: ProfilePage()),
//     const ExitFromAppWidget(child: NewPage()),
//     const ExitFromAppWidget(child: CartPage()),
//     const ExitFromAppWidget(child: ProfilePage()),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: pages[currentIndex],
//         bottomNavigationBar: Consumer(
//           builder: (context, ref, child) {
//             return BottomNavigationBar(
//               currentIndex: currentIndex,
//               onTap: (index) {
//                 setState(() {
//                   currentIndex = index;
//                   if (currentIndex == 1) {
//                     // ref.read(localBasketProvider.notifier).functionGetAllBasket();
//                     // ref.read(changeBasketValuesProvider.notifier).totalPriceOfAllMedications=0.0;
//                     // ref.read(changeBasketValuesProvider.notifier).functionChangeTheTotalPriceForAllMedications();
//                     // ref.read(changeBasketValuesProvider.notifier).showTotalPriceStartLoadingBasketPage=true;
//                     //
//                     // navigateTo(
//                     //   context,
//                     //   BasketPage(),
//                     // );
//                     // currentIndex = 0;
//                   }
//                 });
//               },
//               backgroundColor: Colors.white,
//               unselectedItemColor: AppColors.fontColor,
//               selectedItemColor: AppColors.primaryColor,
//               showSelectedLabels: true,
//               showUnselectedLabels: true,
//               enableFeedback: true,
//               items: const [
//                 BottomNavigationBarItem(
//                   backgroundColor: Colors.white,
//                   icon: Icon(Icons.home_outlined),
//                   label: 'الرئيسية',
//                 ),
//                 BottomNavigationBarItem(
//                   backgroundColor: Colors.white,
//                   icon: Icon(Icons.shopping_cart_outlined),
//                   label: 'السلة',
//                 ),
//                 BottomNavigationBarItem(
//                   backgroundColor: Colors.white,
//                   icon: Icon(Icons.shopping_bag_outlined),
//                   label: 'طلباتي',
//                 ),
//                 BottomNavigationBarItem(
//                   backgroundColor: Colors.white,
//                   icon: Icon(Icons.alarm),
//                   label: 'المنبة',
//                 ),
//                 BottomNavigationBarItem(
//                   backgroundColor: Colors.white,
//                   icon: Icon(Icons.person_outline_outlined),
//                   label: 'حسابي',
//                 ),
//               ],
//             );
//           },
//         ));
//   }
// }



