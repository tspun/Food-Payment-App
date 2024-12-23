import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodStuff Payment App',
      theme: ThemeData(
        primarySwatch: Colors.red, // Use a MaterialColor like Colors.red
      ),
      home: const LoginPage(), // Ensure the statement ends with a semicolon
    );
  }
}
