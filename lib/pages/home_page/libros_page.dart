import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lean_canvas/pages/home_page/data.dart';

class LibrosPage extends StatelessWidget {
  const LibrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff576CA8),
        centerTitle: true,
        title: Text(
          'Libros',
          style: GoogleFonts.poppins(
            color: const Color(0xffF5F3F5),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: libroData.length,
          itemBuilder: (context, index) {
            final info = libroData[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/DetalleLibro',
                    arguments: {
                      'title': info.title,
                      'imagen': info.imagen,
                      'description': info.description,
                      'author': info.author,
                      'category': info.category,
                    },
                  );
                },
                child: Row(
                  children: [
                    // Imagen
                    Hero(
                      tag: info.title,
                      child: Image.asset(
                        info.imagen,
                        width: 100,
                        height: 150,
                      ),
                    ),

                    const Gap(20),
                    // Texto
                    Expanded(
                      child: Text(
                        info.title,
                        //textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
