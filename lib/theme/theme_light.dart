import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/theme/app_colors.dart';
import 'package:meals_app/theme/text_styles.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: GoogleFonts.nunitoTextTheme(),
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.blue9,
    foregroundColor: AppColors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.blue9,
    unselectedItemColor: AppColors.gray5,
  ),
  snackBarTheme: SnackBarThemeData(
    elevation: 0,
    backgroundColor: AppColors.blue9,
    contentTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: FontSize.fontSize1.toDouble(),
    ),
  ),
);
