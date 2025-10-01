import 'package:flutter/material.dart';

class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.title,
    required this.color1,
    required this.color2,
  });

  final String id;
  final String title;
  final Color color1;
  final Color color2;
}
