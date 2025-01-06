import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jeeey/core/widgets/bottomNavbar/bottom_navigation_bar_widget.dart';
import 'core/network/remote_request.dart';
import 'core/theme/theme.dart';
import 'features/category/data/model/category_data.dart';
import 'features/home/data/model/section_data.dart';
import 'features/home/data/model/section_with_category_of_all_data.dart';
import 'features/home/data/model/section_with_product_data.dart';
import 'features/productManagement/detailsProducts/data/model/color_data.dart';
import 'features/productManagement/detailsProducts/data/model/paginated_products_list_data.dart';
import 'features/productManagement/detailsProducts/data/model/product_data.dart';
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
      RemoteRequest.initDio();
      await Hive.initFlutter();
      Hive.registerAdapter(SectionAndProductDataAdapter());
      Hive.registerAdapter(SectionDataAdapter());
      Hive.registerAdapter(PaginatedProductsListAdapter());
      Hive.registerAdapter(CategoryDataAdapter());
      Hive.registerAdapter(ProductDataAdapter());
      Hive.registerAdapter(ColorOfProductDataAdapter());
      Hive.registerAdapter(SectionWithCategoryOfAllDataAdapter());
      await di.init();
      Auth();

        runApp(const ProviderScope(child: MyApp()));
    },
    (error, stackTrace) {
      debugPrint("Caught error in release mode: $error");
      debugPrint("Stack trace: $stackTrace");
    },
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: false,
      splitScreenMode: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: lightTheme,
        home: BottomNavigationBarWidget(),
      ),
    );
  }
}
