import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'QueEs_page.dart';
import 'libros_page.dart';
import 'pilares_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List data = [
      {
        'text': 'Libros',
        'image': 'assets/images/libros.png',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LibrosPage()),
          );
        },
      },
      {
        'text': 'Pilares',
        'image': 'assets/images/pilares.png',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  PilaresPage()),
          );
        },
      },
      {
        'text': 'Proyectos',
        'image': 'assets/images/proyectos.png',
        'onTap': () => Navigator.pushNamed(context, '/libros'),
      },
      {
        'text': '¿Qué es?',
        'image': 'assets/images/que_es.png',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QueEsPage()),
          );
        },
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 2.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 90.0, // Altura del rectángulo
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 27, 77, 162),
                        Color(0xFF40C4FF)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Bienvenido' ', Aròn Del Piero Magallanes Torres',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                            'assets/images/foto_perfil.jpg'), // imagen del prifil
                      ),
                    ],
                  ),
                ),
                //*********************************** */

                // Este es un SizeBox de 30 pixeles
                const Gap(30),

                // Cards
                GridView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                    final image = data[index]['image'];
                    final text = data[index]['text'];
                    return _myCard(
                      context,
                      onTap: data[index]['onTap'] as VoidCallback,
                      text: text,
                      image: image,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _myCard(BuildContext context,
    {required String text,
    required String image,
    required VoidCallback onTap}) {
  return Card(
    elevation: 20,
    color: Colors.white,
    shadowColor: Colors.lightBlueAccent,
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.lightBlueAccent,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Gap(20),
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(image),
          ),
          const Gap(10),
          Text(text),
          const Gap(20),
        ],
      ),
    ),
  );
}
