import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lean_canvas/pages/splash_page/datas/splash.dart';

class Presentation01 extends StatefulWidget {
  const Presentation01({super.key});

  @override
  State<Presentation01> createState() => _Presentation01State();
}

class _Presentation01State extends State<Presentation01> {
  final _dataPresentation = PresentationData.getPresentationDatas();
  final _controller = PageController();

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
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xff5F5F5F),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff274690),
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 35,
                          ),
                        ),
                        child: const Text(
                          'Siguiente',
                          style: TextStyle(
                            color: Color(0xffF5F3F5),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
