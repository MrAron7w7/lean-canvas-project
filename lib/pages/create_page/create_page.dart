import 'package:flutter/material.dart';
import 'package:lean_canvas/pages/create_page/add.dart';
import 'package:lean_canvas/pages/create_page/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  List<Map<String, String>> items = []; // Lista para almacenar los proyectos

  @override
  void initState() {
    super.initState();
    _loadItems(); // Carga los items cuando se inicia la app
  }

  // Cargar los items desde SharedPreferences
  Future<void> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? itemsString = prefs.getString('items');
    if (itemsString != null) {
      final List<dynamic> decodedItems = json.decode(itemsString);
      setState(() {
        items = decodedItems.map((item) => Map<String, String>.from(item)).toList();
      });
    }
  }

  // Guardar los items en SharedPreferences
  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('items', json.encode(items));
  }

  // Añadir un nuevo item
  void _addItem(Map<String, String> newItem) {
    setState(() {
      items.add(newItem);
    });
    _saveItems();
  }

  // Actualizar un item
  void _updateItem(int index, Map<String, String> updatedItem) {
    setState(() {
      items[index] = updatedItem;
    });
    _saveItems();
  }

  // Eliminar un item
  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    _saveItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lean Canvas', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1B264F),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'PROYECTOS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF302B27)),
              ),
              const SizedBox(height: 10),
              const Text(
                'Visualiza tu modelo de negocio',
                style: TextStyle(fontSize: 16, color: Color(0xFF1B264F)),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/modelocanvas.png', 
                height: 250, 
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                    height: 80,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.white, Color.fromARGB(255, 217, 238, 255)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF274690),
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Card(
                        color: Colors.transparent, 
                        elevation: 0, 
                        child: ListTile(
                          title: Text(
                            items[index]['nombreProyecto'] ?? '',
                            style: const TextStyle(
                              color: Color(0xFF302B27),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () async {
                            final result = await Navigator.push<Map<String, String>>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  item: items[index],
                                  index: index,
                                ),
                              ),
                            );
                            if (result != null) {
                              if (result.containsKey('delete') && result['delete'] == 'true') {
                                _deleteItem(index);
                              } else {
                                _updateItem(index, result);
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: const Color(0xFF1B264F),
        onPressed: () async {
          final result = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => AddDataScreen(),
            ),
          );

          if (result != null) {
            _addItem(result);
          }
        },
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
