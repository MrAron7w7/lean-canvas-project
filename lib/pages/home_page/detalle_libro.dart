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
    Map parametros = ModalRoute.of(context)!.settings.arguments as Map;
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
                parametros['title'],
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Gap(20),

              // Imagen
              Row(
                children: [
                  Hero(
                    tag: parametros['title'],
                    child: Image.asset(
                      parametros['imagen'],
                      height: 200,
                    ),
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
                          text2: '${parametros['author']}',
                        ),

                        const Gap(10),

                        // Categoria
                        _buildTextSpan(
                          context,
                          text1: 'Categoria',
                          text2: '${parametros['category']}',
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
                    Text(parametros['description']),
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
      maxLines: 5,
      TextSpan(
        text: '$text1: ',
        style: GoogleFonts.poppins(
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: text2,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
