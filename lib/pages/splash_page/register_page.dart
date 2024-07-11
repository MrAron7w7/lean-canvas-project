import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '/pages/splash_page/login_page.dart';
import '/pages/splash_page/widgets/my_button.dart';
import '/pages/splash_page/widgets/my_button_social.dart';
import '/pages/splash_page/widgets/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                          'Crear cuenta',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff274690),
                            fontSize: 30,
                          ),
                        ),
                        const Gap(20),
                        Text(
                          textAlign: TextAlign.center,
                          'Transforma ideas en negocios con Lean Canvas',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Inputs
                  Container(
                    child: Column(
                      children: [
                        // Input  de email
                        MyTextfield(
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Nombre',
                          controller: _nombreController,
                        ),

                        const Gap(20),

                        // Input de password
                        MyTextfield(
                          keyboardType: TextInputType.text,
                          hintText: 'Email',
                          controller: _emailController,
                        ),

                        const Gap(20),

                        MyTextfield(
                          keyboardType: TextInputType.text,
                          hintText: 'Contraseña',
                          controller: _passwordController,
                        ),

                        const Gap(20),

                        MyTextfield(
                          keyboardType: TextInputType.text,
                          hintText: 'Confirmar contraseña',
                          controller: _confirmPasswordController,
                        ),

                        const Gap(20),

                        // Botton iniciar
                        MyButton(
                          sizeText: 20,
                          text: 'Crear cuenta',
                          sizeWidth: size.width,
                          sizeHeight: 60,
                          onPressed: () {},
                        ),

                        const Gap(15),

                        // O crear cuenta
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xff494949),
                          ),
                          child: const Text(
                            '¿Ya tienes cuenta?',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        const Gap(10),

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
