import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          headline2: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline1: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
