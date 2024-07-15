import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1B264F),
      body: Center(
        child: Text.rich(
          TextSpan(
            text: 'Learn ',
            style: TextStyle(
              color: Color(0xffF5F3F5),
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: 'Canvas',
                style: TextStyle(
                  color: Color(0xff576CA8),
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
