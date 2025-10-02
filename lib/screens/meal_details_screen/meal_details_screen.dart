import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/shared/utils/spacing.dart';
import 'package:meals_app/shared/widgets/custom_app_bar.dart';
import 'package:meals_app/theme/text_styles.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final MealModel meal;
  final void Function(MealModel meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: meal.title,
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: Icon(Icons.star),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(14),
                  Text(
                    'Recipe',
                    style: getTextStyle(fontSize: FontSize.fontSize3),
                  ),
                  verticalSpace(14),
                  Text(
                    meal.title,
                    style: getTextStyle(fontSize: FontSize.fontSize1),
                  ),
                  verticalSpace(14),
                  Text(
                    'Ingredients',
                    style: getTextStyle(fontSize: FontSize.fontSize3),
                  ),
                  verticalSpace(14),
                  for (final ingredient in meal.ingredients)
                    Text(
                      ingredient,
                      style: getTextStyle(fontSize: FontSize.fontSize1),
                    ),
                  verticalSpace(14),
                  Text(
                    'Steps',
                    style: getTextStyle(fontSize: FontSize.fontSize3),
                  ),
                  verticalSpace(14),
                  for (final step in meal.steps)
                    Text(
                      step,
                      style: getTextStyle(fontSize: FontSize.fontSize1),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
