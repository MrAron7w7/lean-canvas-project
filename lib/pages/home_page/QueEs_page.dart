
import 'package:flutter/material.dart';
import 'libros_page.dart';

class QueEsPage extends StatelessWidget {
  const QueEsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¿Qué es?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/muestra.png'),
            const SizedBox(height: 16),
            const Text(
              '¿Qué es?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'El Lean Canvas es una herramienta de planificación estratégica utilizada principalmente por emprendedores y startups para desarrollar y validar modelos de negocio de manera rápida y eficiente. Fue creado por Ash Maurya como una adaptación del Business Model Canvas de Alexander Osterwalder, enfocada en las necesidades específicas de startups.',
            ),
            const SizedBox(height: 16),
            const Text(
              '¿Quién lo creó?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Fue creado por Ash Maurya. Es una adaptación del Business Model Canvas de Alexander Osterwalder, diseñada específicamente para startups y emprendedores que buscan una manera más ágil y eficiente de desarrollar y validar sus modelos de negocio. Ash Maurya es un emprendedor y autor conocido por su trabajo en metodologías de desarrollo de negocios lean, y su libro "Running Lean" detalla cómo utilizar el Lean Canvas en la práctica.',
            ),
            const SizedBox(height: 16),
            Image.asset('assets/creador.png'),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Change button color to green
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LibrosPage()),
                );
              },
              child: const Text('Libros'),
            ),
          ],
        ),
      ),
    );
  }
}