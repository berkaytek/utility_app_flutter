import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        backgroundColor: Theme
            .of(context)
            .primaryColorLight);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}