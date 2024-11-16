import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/theme.dart';
import 'core/widgets/bottomNavbar/bottom_navigation_bar_widget.dart';
import 'features/user/presentation/pages/continue_to_log_in_page.dart';
import 'features/user/presentation/pages/log_in_page.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
        return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
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
        home: ContinueToLogInPage(),
      ),
    );
  }
}
















// import 'package:flutter/material.dart';
// import 'dart:ui';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   ScrollController _scrollController = ScrollController();
//   double _opacity = 0.0;
//   int _currentIndex = 0;
//   bool _isBlurred = false;
//
//   final List<String> promoImages = [
//     'https://example.com/promo_image1.jpg',
//     'https://example.com/promo_image2.jpg',
//     // Add more image URLs
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       setState(() {
//         _opacity = (_scrollController.offset / 150).clamp(0, 1).toDouble();
//         _isBlurred = _scrollController.offset <= -50;
//       });
//     });
//   }
//
//   void _onPageChanged(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background with promo images
//           ListView(
//             controller: _scrollController,
//             children: [
//               Container(
//                 height: 300,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(promoImages[_currentIndex]),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: PageView.builder(
//                   onPageChanged: _onPageChanged,
//                   itemCount: promoImages.length,
//                   itemBuilder: (context, index) {
//                     return Image.network(
//                       promoImages[index],
//                       fit: BoxFit.cover,
//                     );
//                   },
//                 ),
//               ),
//               buildCategories(),
//             ],
//           ),
//           // Blurred effect on pull-down
//           if (_isBlurred)
//             Container(
//               height: 300,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.3),
//                 backgroundBlendMode: BlendMode.overlay,
//               ),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                 child: Container(color: Colors.black.withOpacity(0)),
//               ),
//             ),
//           // Top bar with opacity effect
//           Opacity(
//             opacity: _opacity,
//             child: Container(
//               height: 100,
//               padding: EdgeInsets.only(top: 40),
//               color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.menu, color: Colors.black),
//                     onPressed: () {},
//                   ),
//                   Text('SHEIN', style: TextStyle(color: Colors.black, fontSize: 20)),
//                   IconButton(
//                     icon: Icon(Icons.shopping_cart, color: Colors.black),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildCategories() {
//     return Column(
//       children: [
//         Text("Categories", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//         // More widgets for categories
//       ],
//     );
//   }
// }


// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   ScrollController _scrollController = ScrollController();
//   double _opacity = 0.0;
//   int _currentIndex = 0;
//   bool _isBlurred = false;
//
//   final List<String> promoImages = [
//     'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGK3diR3Zi-mnOXEaj-3ewmFyRYVxGzVzZw&s',
//     // Add more image URLs
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       setState(() {
//         _opacity = (_scrollController.offset / 150).clamp(0, 1).toDouble();
//         _isBlurred = _scrollController.offset <= -50;
//       });
//     });
//   }
//
//   void _onPageChanged(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background with promo images
//           ListView(
//             controller: _scrollController,
//             children: [
//               Container(
//                 height: 300,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(promoImages[_currentIndex]),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: PageView.builder(
//                   onPageChanged: _onPageChanged,
//                   itemCount: promoImages.length,
//                   itemBuilder: (context, index) {
//                     return Image.network(
//                       promoImages[index],
//                       fit: BoxFit.cover,
//                     );
//                   },
//                 ),
//               ),
//               buildCategories(),
//             ],
//           ),
//           // Blurred effect on pull-down
//           if (_isBlurred)
//             Container(
//               height: 300,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.3),
//                 backgroundBlendMode: BlendMode.overlay,
//               ),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                 child: Container(color: Colors.black.withOpacity(0)),
//               ),
//             ),
//           // Top bar with opacity effect
//           Opacity(
//             opacity: _opacity,
//             child: Container(
//               height: 100,
//               padding: EdgeInsets.only(top: 40),
//               color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.menu, color: Colors.black),
//                     onPressed: () {},
//                   ),
//                   Text('SHEIN', style: TextStyle(color: Colors.black, fontSize: 20)),
//                   IconButton(
//                     icon: Icon(Icons.shopping_cart, color: Colors.black),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   Widget buildCategories() {
//     return Column(
//       children: [
//         Text("Categories", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//         // More widgets for categories
//       ],
//     );
//   }
// }
