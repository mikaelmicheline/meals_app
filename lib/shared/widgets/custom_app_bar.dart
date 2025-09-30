import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _CustomBarState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomBarState extends State<CustomAppBar> {
  void _toggleTheme() {
    setState(() {
      themeManager.toggleTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(
          icon: Icon(themeManager.themeMode == ThemeMode.dark
              ? Icons.dark_mode
              : Icons.light_mode),
          onPressed: _toggleTheme,
        ),
      ],
    );
  }
}
