import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/botton_navbar/botton_navbar.dart';
import '/pages/pages.dart';

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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
        ),
      ),
      //home: SplashPage(),
      initialRoute: '/splashPage',
      routes: {
        '/splashPage': (context) => const Presentation(),
        '/bottonNavBar': (context) => const BottonNavbar(),
        '/homePage': (context) => const HomePage(),
        '/createPage': (context) => CreatePage(),
        '/profile': (context) => const ProfilePage(),
        '/LibroPage': (context) => const LibrosPage(),
        '/QueEsPage': (context) => const QueEsPage(),
      },
    );
  }
}
