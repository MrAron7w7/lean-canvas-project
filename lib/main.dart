import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lean_canvas/botton_navbar/botton_navbar.dart';
import 'package:lean_canvas/pages/home_page/detalle_libro.dart';
import 'package:lean_canvas/pages/home_page/pilares_page.dart';
import 'package:lean_canvas/pages/home_page/proyectos_page.dart';
import 'package:lean_canvas/pages/pages.dart';
import 'package:lean_canvas/provider/darkmode_provider.dart';
import 'package:lean_canvas/provider/user_provider.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child: Consumer<UiProvider>(
        builder: (context, UiProvider notifier, child) {
          return MaterialApp(
            title: 'Lean Canvas',
            debugShowCheckedModeBanner: false,
            themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: notifier.darkTheme,
            initialRoute: '/splashPage',
            routes: {
              '/splashPage': (context) => const Presentation(),
              '/bottonNavBar': (context) => const BottonNavbar(),
              '/homePage': (context) => const HomePage(),
              '/loginPage': (context) => const LoginPage(),
              '/createPage': (context) => const CreatePage(),
              '/profile': (context) => const ProfilePage(),
              '/LibroPage': (context) => const LibrosPage(),
              '/QueEsPage': (context) => const QueEsPage(),
              '/PilaresPage': (context) => PilaresPage(),
              '/ProyectosPage': (context) => const ProyectosPage(),
              '/DetalleLibro': (context) => const DetalleLibro(),
            },
          );
        },
      ),
    );
  }
}
