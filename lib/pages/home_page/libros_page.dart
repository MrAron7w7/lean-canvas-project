import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LibrosPage extends StatelessWidget {
  const LibrosPage({super.key});

  // Función para lanzar la URL del PDF
  void _downloadPDF() async {
    const url =
        'https://juannava64.wordpress.com/wp-content/uploads/2012/02/redes-comandos-switch-y-router-cisco-v2-3.pdf'; // Reemplaza con la URL de tu archivo PDF
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
        title: const Text('Libros'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 150,
                        child: Image.asset('assets/images/libro canvas.jpg'),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _downloadPDF,
                        style: ElevatedButton.styleFrom(
                          foregroundColor:  Colors.white,
                          backgroundColor: const Color(0xff274690),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(100, 50),
                        ),
                        child: const Text('Descargar PDF'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  const Expanded(
                    child: Text(
                      'The Lean Startup: How Today\'s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses\n\n'
                      'Este es un libro fundamental que introduce los principios de Lean Startup, que son la base del Lean Canvas.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
