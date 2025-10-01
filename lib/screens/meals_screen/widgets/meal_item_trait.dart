import 'package:flutter/material.dart';
import 'package:meals_app/shared/utils/spacing.dart';
// import 'package:meals_app/theme/app_colors.dart';
import 'package:meals_app/theme/text_styles.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        horizontalSpace(2),
        Text(
          label,
          style: getTextStyle(
              fontColor: FontColor.secondary, fontSize: FontSize.fontSize0),
        ),
      ],
    );
  }
}
