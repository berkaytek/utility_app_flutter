import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:utility_app/src/screens/about/about.dart';
import 'package:utility_app/src/screens/counter/counter_observer.dart';
import 'package:utility_app/src/screens/counter/counter_page.dart';
import 'package:utility_app/src/screens/home/home_screen.dart';
import 'package:utility_app/src/widgets/app_drawer.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const MyApp());
}

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => const HomeScreen(title: "Home Page"),
  '/counter': (context) => const CounterPage(
        title: "Counter Page",
      ),
  '/about': (context) => const About(title: "About")
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utility App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: appRoutes,
      home: const HomeScreen(
        title: "Home Page",
      ),
    );
  }
}
