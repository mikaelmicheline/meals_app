import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen/categories_screen.dart';
import 'package:meals_app/theme/theme_dark.dart';
import 'package:meals_app/theme/theme_light.dart';
import 'package:meals_app/theme/theme_manager.dart';

void main() {
  runApp(const App());
}

ThemeManager themeManager = ThemeManager();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  void initState() {
    themeManager.addListener(themeListener);
    super.initState();
  }

  void themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: CategoriesScreen(),
    );
  }
}
