import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lean_canvas/botton_navbar/botton_navbar.dart';
import 'package:lean_canvas/pages/home_page/libros_page.dart';
import 'package:lean_canvas/pages/home_page/que_es_page.dart';
import 'package:lean_canvas/pages/profile_page/profile_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lean Canvas',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: SplashPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const BottonNavbar(),
        '/profile': (context) => const ProfilePage(),
        '/LibroPage': (context) => const LibrosPage(),
        '/QueEsPage': (context) => const QueEsPage(),
      },
    );
  }
}
