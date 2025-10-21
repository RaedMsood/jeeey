import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../core/theme/app_colors.dart';
import '../riverpod/sections_riverpod.dart';
import '../widgets/app_bar_home_widget.dart';
import '../widgets/sections_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool _isTabControllerInitialized = false;
  late PageController pageController;
  final Map<int, ScrollController> _scrollControllers = {};
  late ScrollController scrollController;
  final Map<int, VoidCallback> _scrollListeners = {};
  final PageStorageBucket _pageStorageBucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollControllers.forEach((key, controller) {
      controller.dispose();
    });
    _tabController?.dispose();
    pageController.dispose();
    super.dispose();
  }
  void _onScroll(int sectionId) {

    var iconColor = ref.watch(colorIconAppBarProvider);
    final scrollController = _scrollControllers[sectionId];
    double offset = scrollController!.offset;
    if (scrollController == null) {
      return;
    }
    // if (offset > kToolbarHeight + 45.h) {
    //   if(iconColor !=  Color(0xff8a1538)) {
    //     ref
    //         .read(colorIconAppBarProvider.notifier)
    //         .setColorIcon(const Color(0xff8a1538));
    //   }
    // } else {
    //   ref.read(colorIconAppBarProvider.notifier).setColorIcon(Colors.white);
    // }

    var appBarColor = ref.watch(colorBackAppBarProvider);

    if (offset > kToolbarHeight + 20.h) {
      if (iconColor != const Color(0xff8a1538)) {
        ref.read(colorIconAppBarProvider.notifier).setColorIcon(const Color(0xff8a1538));
      }
    } else {
      if (iconColor != Colors.white) {
        ref.read(colorIconAppBarProvider.notifier).setColorIcon(Colors.white);
      }
    }

    if (offset > kToolbarHeight + 50.h) {
      if (appBarColor != Colors.white) {
        ref.read(colorBackAppBarProvider.notifier).setColorBackGround(Colors.white);
      }
    } else {
      if (appBarColor != Colors.transparent) {
        ref.read(colorBackAppBarProvider.notifier).setColorBackGround(Colors.transparent);
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    var state = ref.watch(sectionProvider);

    if (state.data.section == null || state.data.section!.isEmpty) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
    }

    try {
      if (!_isTabControllerInitialized) {
        _tabController = TabController(
          length: state.data.section!.length,
          vsync: this,
        );
        _isTabControllerInitialized = true;
      }
    } catch (e) {
      if (kReleaseMode) {
        print("Error initializing TabController in Release mode: $e");
      }
      return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
    }

    if (_tabController == null) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
    }

    return CheckStateInGetApiDataWidget(
      state: state,
     // widgetOfLoading: const SkeletonizerOfHomePage(),
      widgetOfData: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        extendBodyBehindAppBar: true,
        appBar: appBarHomeWidget(
          tabController: _tabController,
          iconColor: ref.watch(colorIconAppBarProvider) ?? Colors.white,
          appBarColor: ref.watch(colorBackAppBarProvider) ?? Colors.transparent,
          section: state.data.section!,
          pageController: pageController,
          context: context,
        ),
        body: PageStorage(
          bucket: _pageStorageBucket,
          child: TabBarView(
            controller: _tabController,
            //physics: const BouncingScrollPhysics(),
            children: state.data.section!.map((section) {
              if (!_scrollControllers.containsKey(section.id!)) {
                _scrollControllers[section.id!] = ScrollController();
                _scrollListeners[section.id!] = () {
                  _onScroll(section.id!);
                };
                _scrollControllers[section.id!]!
                    .addListener(_scrollListeners[section.id!]!);
              }
              return SectionOfCategoryInHomePage(
                scrollController:_scrollControllers[section.id!]! ,
                idSection: section.id!,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
