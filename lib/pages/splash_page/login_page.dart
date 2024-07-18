import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lean_canvas/provider/user_provider.dart';
import 'package:lean_canvas/services/service_firebase.dart';
import 'package:provider/provider.dart';

import 'register_page.dart';
import 'widgets/my_button.dart';
import 'widgets/my_button_social.dart';
import 'widgets/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ServiceFirebase _authService = ServiceFirebase();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // Iniciar session
  Future<void> _singInUser() async {
    final user = await _authService.loginAccount(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (user != null) {
      _emailController.clear();
      _passwordController.clear();

      // Establece el UID del usuario en UserProvider
      Provider.of<UserProvider>(context, listen: false).setUserId(user.uid);

      Navigator.pushReplacementNamed(context, '/bottonNavBar');
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: '¡Error!',
        titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w800,
          fontSize: 22,
        ),
        desc: 'Usuario o contraseña incorrectos',
      ).show();
    }
  }

  // Validad formulario si esta vacio
  void _validateForm() {
    if (_globalKey.currentState!.validate()) {
      _singInUser();
    } else {
      print('No valido');
    }
  }

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
            margin: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
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
                  Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        MyTextfield(
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          controller: _emailController,
                          validator: (val) {
                            if (val == '') {
                              return 'Campo requerido*';
                            }
                            return null;
                          },
                        ),
                        const Gap(25),
                        MyTextfield(
                          keyboardType: TextInputType.text,
                          hintText: 'Contraseña',
                          controller: _passwordController,
                          validator: (val) {
                            if (val == '') {
                              return 'Campo requerido*';
                            }
                            return null;
                          },
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
                        MyButton(
                          sizeText: 20,
                          text: 'Iniciar',
                          sizeWidth: size.width,
                          sizeHeight: 60,
                          onPressed: _validateForm,
                        ),
                        const Gap(15),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
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
