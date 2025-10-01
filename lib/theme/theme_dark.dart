import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/theme/app_colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: GoogleFonts.nunitoTextTheme(),
  scaffoldBackgroundColor: AppColors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.blue9,
    foregroundColor: AppColors.white,
  ),
);
