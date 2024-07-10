import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onPressed;
  final double sizeText;
  final String text;
  final double sizeWidth;
  final double sizeHeight;
  const MyButton({
    super.key,
    this.onPressed,
    required this.sizeText,
    required this.text,
    required this.sizeWidth,
    required this.sizeHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff274690),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(sizeWidth, sizeHeight),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xffF5F3F5),
          fontWeight: FontWeight.w600,
          fontSize: sizeText,
        ),
      ),
    );
  }
}
