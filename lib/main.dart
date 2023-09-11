import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:chuckerprac/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      home: const HomeScreen(),
    );
  }
}
