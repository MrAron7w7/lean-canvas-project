

import 'package:flutter/cupertino.dart';

import 'QueEs_page.dart';
import 'libros_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lean Canvas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 2.0),
Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 90.0, // Altura del rectángulo
              decoration: BoxDecoration(
                gradient: LinearGradient(
              
                  colors: [Color.fromARGB(255, 27, 77, 162), Color(0xFF40C4FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Bienvenido' +', Aròn Del Piero Magallanes Torres', 
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/foto_perfil.jpg'), // imagen del prifil
                  ),
                ],
              ),
            ),
//******************************************************************************************************* */
       
       
            const SizedBox(height: 30.0), // Espacio entre el rectángulo y los botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    image: 'assets/images/libros.png', // ruta libro imagen
                    text: 'Libros',
                    onPressed: () {
                      // Navegar a la página de libros
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => LibrosPage()),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 40.0), // Espacio entre los botones
                Expanded(
                  child: CustomButton(
                    image: 'assets/images/pilares.png', // Nueva ruta
                    text: 'Pilares',
                    onPressed: () {
                      // Navegar a la página de pilares
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0), // Espacio entre las filas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    image: 'assets/images/proyectos.png', 
                    text: 'Proyectos',
                    onPressed: () {
                      // Navegar a la página de proyectos
                    },
                  ),
                ),
                const SizedBox(width: 40.0), // Espacio entre los botones
                Expanded(
                  child: CustomButton(
                    image: 'assets/images/que_es.png', 
                    text: '¿Qué es?',
                    onPressed: () {
                      // que es¡?¡?
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QueEsPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 80), // Ancho completo y altura mínima de 100
        elevation: 20, // Ajusta la elevación según sea necesario
        shadowColor: Colors.lightBlueAccent, // Color de la sombra
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image, height: 80), //Ajusta la altura de la imagen que est dtnro del buton
          const SizedBox(height: 10.0),
          Text(text, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}


