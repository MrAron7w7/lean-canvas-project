import 'package:flutter/material.dart';
import 'package:lean_canvas/pages/splash_page/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lean Canvas',
      home: SplashPage(),
    );
  }
}
