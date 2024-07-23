import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lean_canvas/provider/user_provider.dart';
import 'package:lean_canvas/services/service_firebase.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, dynamic>?> _userDataFuture;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final uid = userProvider.userId;
    if (uid != null) {
      _userDataFuture = ServiceFirebase().getUserData(uid);
    } else {
      _userDataFuture = Future.value(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final String? uid = userProvider.userId;

    final List data = [
      {
        'text': 'Libros',
        'image': 'assets/images/libros.png',
        'onTap': () => Navigator.pushNamed(context, '/LibroPage'),
      },
      {
        'text': 'Pilares',
        'image': 'assets/images/pilares.png',
        'onTap': () => Navigator.pushNamed(context, '/PilaresPage'),
      },
      {
        'text': 'Proyectos',
        'image': 'assets/images/proyectos.png',
        'onTap': () => Navigator.pushNamed(context, '/ProyectosPage'),
      },
      {
        'text': '¿Qué es?',
        'image': 'assets/images/que_es.png',
        'onTap': () => Navigator.pushNamed(context, '/QueEsPage'),
      }
    ];

    if (uid == null) {
      return const Scaffold(
        body: Center(
          child: Text('Error: Usuario no autenticado'),
        ),
      );
    }

    return FutureBuilder<Map<String, dynamic>?>(
      future: _userDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Scaffold(
            body: Center(
              child: Text('No se encontró información del usuario'),
            ),
          );
        } else {
          final userData = snapshot.data!;
          final String userName = userData['name'] ?? 'Usuario';

          // Actualizar el UserProvider después de que el marco actual haya terminado de construir
          WidgetsBinding.instance.addPostFrameCallback((_) {
            userProvider.setUserData(userData);
          });

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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Bienvenido, $userName',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            const CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                  'assets/images/user.png'), // imagen del perfil
                            ),
                          ],
                        ),
                      ),
                      //******************************************************************************************************* */

                      // Este es un SizeBox de 30 pixeles
                      const Gap(30),

                      // Cards
                      GridView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
      },
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
