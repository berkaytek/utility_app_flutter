import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:utility_app/src/screens/about/about.dart';
import 'package:utility_app/src/screens/observers/general_observer.dart';
import 'package:utility_app/src/screens/counter/counter_page.dart';
import 'package:utility_app/src/screens/home/home_screen.dart';
import 'package:utility_app/src/screens/timer/timer_page.dart';

void main() {
  Bloc.observer = GeneralObserver();
  runApp(const MyApp());
}

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => const HomeScreen(title: "Home Page"),
  '/counter': (context) => const CounterPage(
        title: "Counter Page",
      ),
  '/timer': (context) => const TimerPage(title: "Timer page"),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        scaffoldBackgroundColor: Colors.grey[200],
        useMaterial3: true,
      ),
      routes: appRoutes,
      home: const HomeScreen(
        title: "Home Page",
      ),
    );
  }
}
