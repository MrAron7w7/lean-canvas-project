import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '/pages/splash_page/datas/splash.dart';
import '/pages/splash_page/login_page.dart';
import '/pages/splash_page/widgets/my_button.dart';

class Presentation extends StatefulWidget {
  const Presentation({super.key});

  @override
  State<Presentation> createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  int _currentPage = 0;
  final _dataPresentation = PresentationData.getPresentationDatas();
  final _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  void _nextPage() {
    if (_currentPage == _dataPresentation.length - 1) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => const LoginPage()));
    } else {
      setState(() {
        _currentPage++;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: _dataPresentation.length,
          itemBuilder: (context, index) {
            return Container(
              //color: Colors.green[200],
              margin: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagen de la presentacion
                  SizedBox(
                    //color: Colors.blue[100],
                    width: 400,
                    height: 400,
                    child: SvgPicture.asset(
                        _dataPresentation[index].image ?? 'No hay imagen'),
                  ),

                  // Titulo
                  Text(
                    textAlign: TextAlign.center,
                    _dataPresentation[index].title ?? 'No hay titutlo',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Gap(20),

                  // Descripcion
                  Text(
                    textAlign: TextAlign.center,
                    _dataPresentation[index].description ??
                        'No hay descripcion',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const Gap(40),

                  // Bottones
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xff5F5F5F),
                        ),
                        child: Text(
                          'Skip',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      MyButton(
                        sizeText: 15,
                        text: 'Siguiente',
                        sizeWidth: 30,
                        sizeHeight: 50,
                        onPressed: _nextPage,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
