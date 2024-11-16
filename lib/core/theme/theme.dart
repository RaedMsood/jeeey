import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  primarySwatch: AppColors.primarySwatch,
  splashColor: AppColors.primarySwatch.shade50.withOpacity(.6),
  highlightColor: AppColors.primarySwatch.shade50.withOpacity(.4),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
    dividerColor: AppColors.fontColor,
    labelColor: Colors.black,
    unselectedLabelColor: AppColors.fontColor,
    indicatorColor: Colors.black,
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        return AppColors.primaryColor.withOpacity(0.1);
      },
    ),
    indicatorSize: TabBarIndicatorSize.label,
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 1.6, color: Colors.black),
      insets: EdgeInsets.symmetric(vertical: 10),
    ),
    dividerHeight: 0.23,
    tabAlignment: TabAlignment.start,
  ),
  fontFamily: 'PlusJakartaSans',
);
