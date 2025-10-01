import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen/categories_screen.dart';
import 'package:meals_app/screens/meals_screen/meals_screen.dart';
import 'package:meals_app/shared/widgets/custom_app_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String _selectedPageTitle = 'Categories';

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      _selectedPageTitle = _selectedPageIndex == 0 ? 'Categories' : 'Favorites';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: const [],
        emptyText: "Your favorite meals will be displayed here",
      );
    }

    return Scaffold(
      appBar: CustomAppBar(title: _selectedPageTitle),
      body: SafeArea(
        child: activePage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
