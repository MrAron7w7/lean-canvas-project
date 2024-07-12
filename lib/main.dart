import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lean_canvas/pages/splash_page/splash_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lean Canvas',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const SplashPage(),
    );
  }
}
