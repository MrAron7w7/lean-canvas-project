
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
            const SizedBox(height: 150.0), // Ajusta la altura según sea necesario
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    image: 'assets/images/libros.png', // Nueva ruta
                    text: 'Libros',
                    onPressed: () {
                      // Navegar a la página de libros
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
                    image: 'assets/images/proyectos.png', // Nueva ruta
                    text: 'Proyectos',
                    onPressed: () {
                      // Navegar a la página de proyectos
                    },
                  ),
                ),
                const SizedBox(width: 16.0), // Espacio entre los botones
                Expanded(
                  child: CustomButton(
                    image: 'assets/images/que_es.png', // Nueva ruta
                    text: '¿Qué es?',
                    onPressed: () {
                      // Navegar a la página de ¿Qué es?
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
        minimumSize: const Size(double.infinity, 100), // Ancho completo y altura mínima de 100
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image, height: 60), // Ajusta la altura de la imagen según sea necesario
          const SizedBox(height: 45.0),
          Text(text, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}



/*
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    image: 'assets/images/libros.png', 
                    text: 'Libros',
                    onPressed: () {
                      // Navegar a la página de libros
                    },
                  ),
                ),
                const SizedBox(width: 16.0), // Espacio entre los botones
                Expanded(
                  child: CustomButton(
                    image: 'assets/images/pilares.png', 
                    text: 'Pilares',
                    onPressed: () {
                      // Navegar a la página de pilares
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0), // Espacio entre las filas
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
                const SizedBox(width: 16.0), // Espacio entre los botones
                Expanded(
                  child: CustomButton(
                    image: 'assets/images/que_es.png',
                    text: '¿Qué es?',
                    onPressed: () {
                      // Navegar a la página de ¿Qué es?
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
        minimumSize: const Size(double.infinity, 100), // Ancho completo y altura mínima de 100
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image, height: 50), // Ajusta la altura de la imagen según sea necesario
          const SizedBox(height: 8.0),
          Text(text, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

*/
