import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lean_canvas/pages/profile_page/edit_profile.dart';
import 'package:lean_canvas/pages/profile_page/utils.dart';
import 'package:lean_canvas/provider/darkmode_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String profile = 'assets/images/profile.png';
  String userName = 'usuario-name';
  String email = 'youremail@domain.com';

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('name') ?? 'usuario-name';
    final savedEmail = prefs.getString('email') ?? 'youremail@domain.com';
    final imagePath = prefs.getString('profileImagePath') ?? '';

    setState(() {
      userName = savedName;
      email = savedEmail;
      if (imagePath.isNotEmpty) {
        profile = imagePath;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<UiProvider>(context).isDark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

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
              child: Image.asset('assets/images/LeanCanvasBanner.jpg'),
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
                backgroundImage: profile.startsWith('assets/')
                    ? AssetImage(profile)
                    : FileImage(File(profile)) as ImageProvider,
              ),
            ),
          ),
          Positioned(
            top: 215,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: textColor.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(
                        0xFFE1C329), // Color de fondo en formato ARGB
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Bordes redondeados
                    ),
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      ),
                    );
                    // Reload profile data after returning from EditProfile
                    loadProfileData();
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 14,
                  ),
                  label: const Text('Edit Profile'),
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
                              title: const Text('Tema'),
                              trailing: Switch(
                                value: isDarkMode,
                                onChanged: (value) {
                                  Provider.of<UiProvider>(context,
                                          listen: false)
                                      .changeTheme();
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
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
