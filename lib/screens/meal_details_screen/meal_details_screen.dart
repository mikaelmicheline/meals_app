import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/shared/widgets/custom_app_bar.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: meal.title),
      body: SafeArea(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            SizedBox(
              height: 14,
            ),
            Text('Ingredients')
          ],
        ),
      ),
    );
  }
}
