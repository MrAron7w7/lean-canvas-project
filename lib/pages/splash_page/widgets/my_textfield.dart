import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final bool? obscureText;
  final TextEditingController controller;
  final Function(String?)? validator;
  const MyTextfield({
    super.key,
    required this.keyboardType,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator!(value),
      obscureText: obscureText!,
      cursorColor: const Color(0xff576CA8),
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xff626262),
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: const Color(0xfff1f4ff),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xff576CA8),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
