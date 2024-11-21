import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/category/presentation/pages/category_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/new/presentation/pages/new_page.dart';
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
  @override
  Widget build(BuildContext context) {
    var activeIndex = ref.watch(activeIndexProvider);
    return Directionality(
      textDirection: Directionality.of(context),
      child: Scaffold(
        body: [
          const ExitFromAppWidget(child: HomePage()),
          const ExitFromAppWidget(child: CategoryPage()),
          const ExitFromAppWidget(child: NewPage()),
          const ExitFromAppWidget(child: Scaffold()),
          const ExitFromAppWidget(child: Scaffold()),
        ][activeIndex],
        bottomNavigationBar: Container(
          color: AppColors.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DesignForBottomNavigationBarWidget(
                    icon: AppIcons.home,
                    activeIcon: AppIcons.homeActive,
                    label: S.of(context).home,
                    active: activeIndex == 0,
                    onTap: () {
                      ref.read(activeIndexProvider.notifier).state = 0;
                    },
                  ),
                  DesignForBottomNavigationBarWidget(
                    icon: AppIcons.category,
                    activeIcon: AppIcons.categoryActive,
                    label: S.of(context).category,
                    active: activeIndex == 1,
                    onTap: () {
                      ref.read(activeIndexProvider.notifier).state = 1;
                    },
                  ),
                  DesignForBottomNavigationBarWidget(
                    icon: AppIcons.newIcon,
                    activeIcon: AppIcons.newActive,
                    label: S.of(context).neww,
                    active: activeIndex == 2,
                    onTap: () {
                      ref.read(activeIndexProvider.notifier).state = 2;
                    },
                  ),
                  DesignForBottomNavigationBarWidget(
                    icon: AppIcons.cart,
                    activeIcon: AppIcons.cartActive,
                    label: S.of(context).cart,
                    active: activeIndex == 3,
                    onTap: () {
                      ref.read(activeIndexProvider.notifier).state = 3;
                    },
                  ),
                  DesignForBottomNavigationBarWidget(
                    icon: AppIcons.profile,
                    activeIcon: AppIcons.profileActive,
                    label: S.of(context).profile,
                    active: activeIndex == 4,
                    onTap: () {
                      ref.read(activeIndexProvider.notifier).state = 4;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
