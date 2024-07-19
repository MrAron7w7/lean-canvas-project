import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lean_canvas/pages/profile_page/provider.dart';
import 'package:provider/provider.dart';
import 'package:lean_canvas/pages/profile_page/profile_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child: Consumer<UiProvider>(
        builder: (context, UiProvider notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Lean Canvas',
            themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: notifier.darkTheme,
            theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            home: const ProfilePage(),
          );
        },
      ),
    );
  }
}
