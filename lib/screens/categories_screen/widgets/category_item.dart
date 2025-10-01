import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';
// import 'package:meals_app/theme/app_colors.dart';
import 'package:meals_app/theme/text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.category, required this.onSelectCategory});

  final CategoryModel category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color2,
              category.color1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: getTextStyle(
            fontColor: FontColor.secondary,
          ),
        ),
      ),
    );
  }
}
