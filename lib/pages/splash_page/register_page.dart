import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lean_canvas/services/service_firebase.dart';

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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ServiceFirebase _authService = ServiceFirebase();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // Mostrar el diálogo de carga
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text('Cargando...'),
              ],
            ),
          ),
        );
      },
    );
  }

  // Registrar usuario
  Future<void> _registerUser() async {
    _showLoadingDialog(context); // Mostrar el diálogo de carga

    final user = await _authService.registerAccount(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    Navigator.pop(context); // Ocultar el diálogo de carga

    if (user != null) {
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      Navigator.pushReplacementNamed(context, '/loginPage');
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
        desc: 'Completa todos los campos',
      ).show();
    }
  }

  // Validar formulario si está vacío
  void _validateForm() {
    if (_globalKey.currentState!.validate()) {
      _registerUser();
    } else {
      print('No válido');
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
              child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    // Crear cuenta
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
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
                          // Input de nombre
                          MyTextfield(
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Nombre',
                            controller: _nameController,
                            validator: (val) {
                              if (val == '') {
                                return 'Campo requerido*';
                              }
                              return null;
                            },
                          ),

                          const Gap(20),

                          // Input de email
                          MyTextfield(
                            keyboardType: TextInputType.text,
                            hintText: 'Email',
                            controller: _emailController,
                            validator: (val) {
                              if (val == '') {
                                return 'Campo requerido*';
                              }
                              return null;
                            },
                          ),

                          const Gap(20),

                          // Input de contraseña
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

                          // Botón de crear cuenta
                          MyButton(
                            sizeText: 20,
                            text: 'Crear cuenta',
                            sizeWidth: size.width,
                            sizeHeight: 60,
                            onPressed: _validateForm,
                          ),

                          const Gap(15),

                          // Ya tienes cuenta
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
      ),
    );
  }
}
