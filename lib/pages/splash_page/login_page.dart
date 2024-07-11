import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '/pages/splash_page/register_page.dart';
import '/pages/splash_page/widgets/my_button.dart';
import '/pages/splash_page/widgets/my_button_social.dart';
import '/pages/splash_page/widgets/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            //color: Colors.blue[100],
            margin: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Iniciar session
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    //color: Colors.red[100],
                    child: Column(
                      children: [
                        Text(
                          'Iniciar Sesión',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff274690),
                            fontSize: 30,
                          ),
                        ),
                        const Gap(20),
                        Text(
                          textAlign: TextAlign.center,
                          'Inicia sesión para hacer realidad tus sueños.',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Inputs
                  Column(
                    children: [
                      // Input  de email
                      MyTextfield(
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email',
                        controller: _emailController,
                      ),

                      const Gap(25),

                      // Input de password
                      MyTextfield(
                        keyboardType: TextInputType.text,
                        hintText: 'Contraseña',
                        controller: _passwordController,
                      ),
                      const Gap(20),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xff576CA8),
                          ),
                          child: const Text(
                            '¿Olvidastes tu contraseña?',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const Gap(10),

                      // Botton iniciar
                      MyButton(
                        sizeText: 20,
                        text: 'Iniciar',
                        sizeWidth: size.width,
                        sizeHeight: 60,
                        onPressed: () {},
                      ),

                      const Gap(15),

                      // O crear cuenta
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xff494949),
                        ),
                        child: const Text(
                          'Crear cuenta',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      const Gap(20),

                      Text(
                        'O continua con',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff576CA8),
                        ),
                      ),

                      const Gap(20),

                      SizedBox(
                        //color: Colors.blue[100],
                        width: 250,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyButtonSocial(
                              icon: Icons.email,
                              onTap: () {},
                            ),
                            MyButtonSocial(
                              icon: Icons.facebook,
                              onTap: () {},
                            ),
                            MyButtonSocial(
                              icon: Icons.apple,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
