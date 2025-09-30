import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meal_details_screen/meal_details_screen.dart';
import 'package:meals_app/screens/meals_screen/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, required this.category})
      : meals = availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

  final CategoryModel category;
  final List<MealModel> meals;

  void _selectMeal(BuildContext context, MealModel meal) {
    Navigator.push(context,
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Uh oh... nothing here!",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Try selecting a different category!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                )
              ],
            ),
          )
        : ListView.builder(
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
          );

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: SafeArea(
          child: content,
        ));
  }
}
