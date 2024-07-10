import 'package:flutter/material.dart';
import 'package:lean_canvas/pages/profile_page/edit_profile.dart';
import 'package:lean_canvas/pages/profile_page/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -75,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: OvalBottomClipper(),
              child: Image.asset(
                  'lib/pages/profile_page/images/LeanCanvasBanner.jpg'),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 70,
                backgroundImage:
                    Image.asset('lib/pages/profile_page/images/profile.png')
                        .image,
              ),
            ),
          ),
          Positioned(
            top: 215,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  'usuario-name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                const Text(
                  'youremail@domain.com | +01 234 567 89',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black12),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final route = MaterialPageRoute(
                      builder: (_) => const EditProfile(),
                    );
                    Navigator.push(context, route);
                  }, ////button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                        0xFFE1C329), // Color de fondo en formato ARGB
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Bordes redondeados
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
                    child: Row(
                      mainAxisSize: MainAxisSize
                          .min, // Ajusta el tamaño del Row al contenido
                      children: [
                        Icon(
                          Icons.edit, // Cambia esto por el icono que prefieras
                          color: Colors.white,
                          size: 16.0, // Tamaño del icono
                        ),
                        SizedBox(
                            width: 4.0), // Espacio entre el icono y el texto
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.grey[850] : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const ListTile(
                              leading: Icon(Icons.policy),
                              title: Text('Políticas de Privacidad'),
                            ),
                            ListTile(
                              leading: const Icon(Icons.brightness_6),
                              title: Text('Tema'),
                              trailing: Switch(
                                value: isDarkMode,
                                onChanged: (value) {
                                  setState(() {
                                    isDarkMode = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.grey[850] : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.help),
                              title: Text('Ayuda & Soporte'),
                            ),
                            ListTile(
                              leading: Icon(Icons.contact_mail),
                              title: Text('Contactanos'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 80), // Espacio para el BottomNavigationBar
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Crear',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
