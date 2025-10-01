import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/screens/categories_screen/widgets/category_item.dart';
import 'package:meals_app/screens/meals_screen/meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, CategoryModel category) {
    final meals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: meals,
          title: category.title,
          emptyText: "Try selecting a different category",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.fromLTRB(10, 24, 10, 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
