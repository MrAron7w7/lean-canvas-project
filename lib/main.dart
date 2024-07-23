import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lean_canvas/pages/home_page/detalle_libro.dart';
import 'package:lean_canvas/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '/botton_navbar/botton_navbar.dart';
import '/pages/pages.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

Future initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lean Canvas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
        ),
      ),
      initialRoute: '/splashPage',
      routes: {
        '/splashPage': (context) => const Presentation(),
        '/bottonNavBar': (context) => const BottonNavbar(),
        '/homePage': (context) => const HomePage(),
        '/loginPage': (context) => const LoginPage(),
        '/createPage': (context) => CreatePage(),
        '/profile': (context) => const ProfilePage(),
        '/LibroPage': (context) => const LibrosPage(),
        '/QueEsPage': (context) => const QueEsPage(),
        '/DetalleLibro': (context) => const DetalleLibro(),
      },
    );
  }
}
