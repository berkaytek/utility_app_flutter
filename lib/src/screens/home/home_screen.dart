import 'package:flutter/material.dart';
import 'package:utility_app/src/widgets/app_bar.dart';
import 'package:utility_app/src/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: title,),
        drawer:const DefaultDrawer());
  }
}
