import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/screens/categories_screen/widgets/category_item.dart';
import 'package:meals_app/screens/meals_screen/meals_screen.dart';
import 'package:meals_app/shared/widgets/custom_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, CategoryModel category) {
    Navigator.push(context,
        MaterialPageRoute(builder: (ctx) => MealsScreen(category: category)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Categories'),
      body: SafeArea(
        child: GridView(
          padding: EdgeInsets.all(10),
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
        ),
      ),
    );
  }
}
