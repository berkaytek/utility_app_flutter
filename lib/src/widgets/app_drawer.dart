import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(
          decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
          child: const Text("Utility App")),
      ListTile(
          title: const Text("Home Page"),
          leading: const Icon(Icons.home),
          onTap: () {
            Navigator.of(context).pushNamed("/home");
          }),
      ListTile(
          title: const Text("Counter"),
          leading: const Icon(Icons.numbers),
          onTap: () {
            Navigator.of(context).pushNamed("/counter");
          }),
      ListTile(
          title: const Text("About"),
          leading: const Icon(Icons.question_mark),
          onTap: () {
            Navigator.of(context).pushNamed("/about");
          })
    ]));
  }
}
