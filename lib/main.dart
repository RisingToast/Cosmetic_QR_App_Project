import 'package:cosmetic_tryon_app/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:cosmetic_tryon_app/qr_scanner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmetic Try-On App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainNavigationScreen(),

    );
  }
}
