import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/theme/text_styles.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  State<CustomAppBar> createState() {
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
      title: Text(
        widget.title,
        style: getTextStyle(
          fontColor: FontColor.secondary,
          fontSize: FontSize.fontSize6,
        ),
      ),
      actions: [
        if (widget.actions != null)
          for (final action in widget.actions!) action,
        IconButton(
          icon: Icon(
            themeManager.themeMode == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
          onPressed: _toggleTheme,
        ),
      ],
    );
  }
}
