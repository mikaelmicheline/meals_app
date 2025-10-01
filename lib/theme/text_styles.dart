import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/theme/app_colors.dart';

enum FontSize {
  fontSize0(12),
  fontSize1(15),
  fontSize2(18),
  fontSize3(21),
  fontSize4(24),
  fontSize5(27),
  fontSize6(30),
  fontSize7(33),
  fontSize8(36),
  fontSize9(39);

  final double fontSize;
  const FontSize(this.fontSize);

  double _toDouble() {
    return fontSize;
  }
}

enum FontColor {
  primary(
      fontColorLightTheme: AppColors.black,
      fontColorDarkTheme: AppColors.white),
  secondary(
      fontColorLightTheme: AppColors.white,
      fontColorDarkTheme: AppColors.white);

  final Color fontColorLightTheme;
  final Color fontColorDarkTheme;
  const FontColor(
      {required this.fontColorLightTheme, required this.fontColorDarkTheme});

  Color _toColor() {
    return themeManager.themeMode == ThemeMode.light
        ? fontColorLightTheme
        : fontColorDarkTheme;
  }
}

TextStyle getTextStyle(
    {FontColor? fontColor, FontSize? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    color: fontColor?._toColor() ?? FontColor.primary._toColor(),
    fontSize: fontSize?._toDouble() ?? FontSize.fontSize2._toDouble(),
    fontWeight: fontWeight ?? FontWeight.w400,
  );
}
