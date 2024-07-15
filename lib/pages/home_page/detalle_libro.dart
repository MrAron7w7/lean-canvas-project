import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleLibro extends StatefulWidget {
  const DetalleLibro({super.key});

  @override
  State<DetalleLibro> createState() => _DetalleLibroState();
}

class _DetalleLibroState extends State<DetalleLibro> {
  // Función para lanzar la URL del PDF
  void _openPDF() async {
    const url =
        'https://juannava64.wordpress.com/wp-content/uploads/2012/02/redes-comandos-switch-y-router-cisco-v2-3.pdf';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff576CA8),
        centerTitle: true,
        title: Text(
          'Detalles',
          style: GoogleFonts.poppins(
            color: const Color(0xffF5F3F5),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        //color: Colors.red[100],
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Titulo
              Text(
                'The Lean Startup',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Gap(20),

              // Imagen
              Row(
                children: [
                  Image.asset(
                    'assets/images/libro_canvas.jpg',
                    height: 200,
                  ),

                  const Gap(20),

                  // Descripcion basica

                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Autor
                        _buildTextSpan(
                          context,
                          text1: 'Autor',
                          text2: 'Autor',
                        ),

                        const Gap(10),

                        // Categoria
                        _buildTextSpan(
                          context,
                          text1: 'Categoria',
                          text2: 'Categoria',
                        ),
                        const Gap(10),

                        // Botton de pagina
                        ElevatedButton(
                          onPressed: _openPDF,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff274690),
                            foregroundColor: const Color(0xffF5F3F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(100, 50),
                          ),
                          child: const Text('Ver pagina'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Gap(20),

              // Descripcion
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descripción:',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(10),
                    const Text(
                        'Este es un libro fundamental que introduce los principios de Lean Startup, que son la base del Lean Canvas'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextSpan(BuildContext context,
      {required String text1, required String text2}) {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      TextSpan(
        text: '$text1: ',
        style: GoogleFonts.poppins(
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: text2,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
