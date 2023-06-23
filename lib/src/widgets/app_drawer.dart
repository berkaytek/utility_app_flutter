import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            color: Theme.of(context).primaryColorLight,
            child: ListTile(
              leading: const Icon(
                Icons.bolt,
                color: Colors.white,
              ),
              title: Text(
                "Utility App",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home Page"),
            onTap: () {
              Navigator.of(context).pushNamed("/home");
            },
          ),
          ListTile(
            leading: const Icon(Icons.numbers),
            title: const Text("Counter"),
            onTap: () {
              Navigator.of(context).pushNamed("/counter");
            },
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text("Timer"),
            onTap: () {
              Navigator.of(context).pushNamed("/timer");
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text("About"),
            onTap: () {
              Navigator.of(context).pushNamed("/about");
            },
          ),
        ],
      ),
    );
  }
}
