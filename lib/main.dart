import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/pages/splash_page/presentation_page.dart';
import 'firebase_options.dart';

void main() {
  initializeFirebase();
  runApp(const MyApp());
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
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      //home: SplashPage(),
      home: const Presentation(),
    );
  }
}
