import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meal_details_screen/meal_details_screen.dart';
import 'package:meals_app/screens/meals_screen/widgets/meal_item.dart';
import 'package:meals_app/shared/utils/spacing.dart';
import 'package:meals_app/shared/widgets/custom_app_bar.dart';
import 'package:meals_app/theme/text_styles.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.emptyText,
    required this.onToggleFavorite,
    this.title,
  });

  final List<MealModel> meals;
  final String? title;
  final String emptyText;
  final void Function(MealModel meal) onToggleFavorite;

  void _selectMeal(BuildContext context, MealModel meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Nothing here :(",
                  style: getTextStyle(fontSize: FontSize.fontSize4),
                ),
                verticalSpace(14),
                Text(
                  emptyText,
                  style: getTextStyle(),
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onSelectMeal: () {
                  _selectMeal(
                    context,
                    meals[index],
                  );
                },
              ),
            ),
          );

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: CustomAppBar(title: title!),
        body: SafeArea(
          child: content,
        ));
  }
}
