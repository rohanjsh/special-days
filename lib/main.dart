import 'package:flutter/material.dart';
import 'package:special_day/home_page.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';
import 'package:special_day/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Special Day',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SimpleOnboarding(),
      ),
    );
  }
}
