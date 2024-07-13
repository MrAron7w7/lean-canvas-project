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
          child: Row(
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
        ),
      ),
    );
  }
}




/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Asegúrate de agregar esta dependencia en tu pubspec.yaml

class LibrosPage extends StatelessWidget {
  const LibrosPage({super.key});

  // Función para lanzar la URL del PDF
  void _downloadPDF() async {
    const url = 'https://www.example.com/tu_libro.pdf'; // Reemplaza con la URL de tu archivo PDF
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contenedor para las imágenes
              Column(
                children: [
                  SizedBox(
                    width: 100, // Ajusta el ancho de la imagen
                    height: 150, // Ajusta la altura de la imagen
                    child: Image.asset('assets/images/libro canvas.jpg'), // Ruta de la imagen
                  ),
                  const SizedBox(height: 16.0), // Espacio entre las imágenes
                  ElevatedButton(
                    onPressed: _downloadPDF,
                    child: const Text('Descargar PDF'),
                  ),
                ],
              ),
              const SizedBox(width: 10.0), // Espacio entre la imagen y el texto
              // Texto a la derecha
              Expanded(
                child: Text(
                  'The Lean Startup: How Today\'s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses\n\n'
                  'Este es un libro fundamental que introduce los principios de Lean Startup, que son la base del Lean Canvas.',
                  style: TextStyle(fontSize: 14), // Ajusta el tamaño de la fuente
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

class LibrosPage extends StatelessWidget {
  const LibrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libros'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contenedor para las imágenes
              Column(
                children: [
                  SizedBox(
                    width: 100, // Ajusta el ancho de la imagen
                    height: 150, // Ajusta la altura de la imagen
                    child: Image.asset('assets/images/libro canvas.jpg'), // Ruta de la imagen
                  ),
                  const SizedBox(height: 16.0), // Espacio entre las imágenes
                   
                  
                  
                ],
              ),
              const SizedBox(width: 16.0), // Espacio entre la imagen y el texto
              // Texto a la derecha
              Expanded(
                child: Text(
                  'The Lean Startup: How Today\'s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses\n\n'
                  'Este es un libro fundamental que introduce los principios de Lean Startup, que son la base del Lean Canvas.',
                  style: TextStyle(fontSize: 16), // Ajusta el tamaño de la fuente
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

*/