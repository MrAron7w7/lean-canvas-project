import 'package:flutter/material.dart';
import 'package:lean_canvas/pages/profile_page/profile_page.dart';
import 'package:lean_canvas/pages/profile_page/utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isDarkMode = false;
  String fondoEdiProfile = 'assets/images/fondo-edit-profile.jpg';

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const BottomSheetContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -15,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: OvalBottomClipper(),
              child: Image.asset(fondoEdiProfile),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PreferredSize(
              preferredSize: const Size.fromHeight(56.0),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  iconSize: 35,
                  icon: const Icon(Icons.arrow_back),
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: () {
                    final route = MaterialPageRoute(
                      builder: (_) => const ProfilePage(),
                    );
                    Navigator.push(context, route);
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 110,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: Image.asset('assets/images/profile.png').image,
              ),
            ),
          ),
          Positioned(
            top: 210,
            right: 113,
            child: InkWell(
              onTap: () => _showBottomSheet(context),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 60.0,
              ),
            ),
          ),
          Positioned(
            top: 300, 
            left: 20,
            right: 20,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10), 
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10), 
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 20, 20, 80),  
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
                  ),
                  child: const Text('GUARDAR',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'Choose Profile photo',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {},
                label: const Text('Camera'),
              ),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {},
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

