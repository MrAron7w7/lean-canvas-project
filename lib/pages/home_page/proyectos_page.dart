import 'package:flutter/material.dart';

class ProyectosPage extends StatelessWidget {
  const ProyectosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyectos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProjectCard(context, 'Proyecto 1', 'assets/images/pizarra.png',
              'assets/images/puntos.png', true),
          _buildProjectCard(context, 'Proyecto 2', 'assets/images/pizarra.png',
              'assets/images/puntos.png', true),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, String title, String imagePath,
      String optionsPath, bool showEditIcon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (showEditIcon)
                const Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(Icons.edit, size: 15),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 18)),
                if (showEditIcon) Image.asset(optionsPath, height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
