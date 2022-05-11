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
        iconTheme: const IconThemeData(color: Colors.white,size: 90),
        textTheme: const TextTheme(
          headline2: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
