
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/state/check_state_in_get_api_data_widget.dart';
import '../../../../core/theme/app_colors.dart';
import '../riverpod/sections_riverpod.dart';
import '../widgets/app_bar_home_widget.dart';
import '../widgets/sections_widget.dart';
import '../widgets/skeletonizer_of_home_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with TickerProviderStateMixin {
   TabController? _tabController;
  bool _isTabControllerInitialized = false;
  late ScrollController scrollController;
  final Map<int, ScrollController> _scrollControllers = {};
  final Map<int, VoidCallback> _scrollListeners = {};
  late PageController pageController;
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
    _tabController!.dispose();
    pageController.dispose();
    super.dispose();
  }

  void _onScroll(int sectionId) {
    final scrollController = _scrollControllers[sectionId];
    if (scrollController == null) {
      return;
    }
    final offset = scrollController.offset;
    var iconColor = ref.watch(colorIconAppBarProvider);
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
    var iconColors = ref.watch(colorIconAppBarProvider) ?? Colors.white;
    var appBarColor = ref.watch(colorBackAppBarProvider) ?? Colors.transparent;
    var state = ref.watch(sectionProvider);
    if (state.data.section == null || state.data.section!.isEmpty) {
      return const  Center(child: CircularProgressIndicator());
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
      return const Center(child: CircularProgressIndicator());
    }
    if(_tabController==null){
      return const Center(child: CircularProgressIndicator());
    }
    return CheckStateInGetApiDataWidget(
      state: state,
      widgetOfLoading: const SkeletonizerOfHomePage(),
      widgetOfData: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        extendBodyBehindAppBar: true,
        appBar: appBarHomeWidget(
          tabController: _tabController,
          iconColor: iconColors,
          appBarColor: appBarColor,
          section: state.data.section!,
          pageController: pageController,
        ),
        body: PageView.builder(
          controller: pageController,
          itemCount: state.data.section!.length,
          onPageChanged: (index) {
            ref.read(colorIconAppBarProvider.notifier).setColorIcon(Colors.white);
            ref.read(colorBackAppBarProvider.notifier).setColorBackGround(Colors.transparent);
            _tabController!.index = index;
          },
          itemBuilder: (context, index) {
            var section = state.data.section![index];
            if (!_scrollControllers.containsKey(section.id!)) {
              _scrollControllers[section.id!] = ScrollController();
              _scrollListeners[section.id!] = () {
                _onScroll(section.id!);
              };
              _scrollControllers[section.id!]!
                  .addListener(_scrollListeners[section.id!]!);
            }

            return SectionOfCategoryInHomePage(
              scrollController: _scrollControllers[section.id ?? 1]!,
              idSection: section.id ?? 1,
            );
          },
        ),
      ),

    );
  }
}



