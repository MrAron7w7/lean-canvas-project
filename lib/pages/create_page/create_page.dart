import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'add.dart';
import 'detail.dart';

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
      setState(() {
        items = List<Map<String, String>>.from(json.decode(itemsString));
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
        color: const Color(0xFFF6F4F6),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'PROYECTOS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF302B27)),
              ),
              const Text(
                'Visualiza tu modelo de negocio',
                style: TextStyle(fontSize: 16, color: Color(0xFF1B264F)),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 80,
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: ListTile(
                          title: Text(items[index]['nombreProyecto'] ?? '', style: const TextStyle(color: Color(0xFF302B27))),
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
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
