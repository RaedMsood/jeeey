import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jeeey/core/widgets/bottomNavbar/bottom_navigation_bar_widget.dart';
import 'package:jeeey/features/productManagement/copons_and_discount/data/model/discount_model.dart';
import 'core/network/remote_request.dart';
import 'core/state/app_restart_controller.dart';
import 'core/theme/theme.dart';
import 'features/category/data/model/category_data.dart';
import 'features/home/data/model/section_data.dart';
import 'features/home/data/model/section_with_category_of_all_data.dart';
import 'features/home/data/model/section_with_product_data.dart';
import 'features/productManagement/detailsProducts/data/model/color_data.dart';
import 'features/productManagement/detailsProducts/data/model/paginated_products_list_data.dart';
import 'features/productManagement/detailsProducts/data/model/product_data.dart';
import 'features/productManagement/detailsProducts/presentation/page/details_page.dart';
import 'features/profile/settings/presentation/riverpod/setting_riverpod.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'package:jeeey/injection.dart' as di;
import 'services/auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) {
      debugPrint("Flutter Error in Release Mode: ${details.exception}");
    }
  };
  runZonedGuarded(
    () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.android,
      );
      RemoteRequest.initDio();
      await Hive.initFlutter();
      Hive.registerAdapter(SectionAndProductDataAdapter());
      Hive.registerAdapter(SectionDataAdapter());
      Hive.registerAdapter(PaginatedProductsListAdapter());
      Hive.registerAdapter(CategoryDataAdapter());
      Hive.registerAdapter(ProductDataAdapter());
      Hive.registerAdapter(ColorOfProductDataAdapter());
      Hive.registerAdapter(SectionWithCategoryOfAllDataAdapter());
      Hive.registerAdapter(DiscountModelAdapter());
      await di.init();
      Auth();

      runApp(const AppRestartController(child: MyApp()));
    },
    (error, stackTrace) {
      debugPrint("Caught error in release mode: $error");
      debugPrint("Stack trace: $stackTrace");
    },
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    _handleDynamicLinks();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void _handleDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData? data) {
      if (data?.link != null) {
        final Uri deepLink = data!.link;
        int? productId = int.tryParse(deepLink.pathSegments.last);
        _navigateToProduct(productId ?? 0);
      }
    }).onError((error) {
      print('Error retrieving dynamic link: $error');
    });

    // Check if the app was opened from a dynamic link
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink?.link != null) {
      final Uri deepLink = initialLink!.link;
      int? productId = int.tryParse(deepLink.pathSegments.last);
      _navigateToProduct(productId ?? 0);
    }
  }

  void _navigateToProduct(int productId) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          idProduct: productId,
          price: '',
          name: '',
          image: [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(languageProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: false,
      splitScreenMode: false,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        locale: locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        theme: lightTheme,
        home: const BottomNavigationBarWidget(),
      ),
    );
  }
}
