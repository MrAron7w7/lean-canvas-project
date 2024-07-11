import 'package:flutter/material.dart';
import 'lean.dart'; 

class EditDataScreen extends StatefulWidget {
  final Map<String, String> item;
  final int index;

  EditDataScreen({required this.item, required this.index});

  @override
  _EditDataScreenState createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nombreProyectoController;
  late TextEditingController _empresaController;
  late TextEditingController _descripcionController;
  late TextEditingController _notaController;

  @override
  void initState() {
    super.initState();
    _nombreProyectoController = TextEditingController(text: widget.item['nombreProyecto']!);
    _empresaController = TextEditingController(text: widget.item['empresa']!);
    _descripcionController = TextEditingController(text: widget.item['descripcion']!);
    _notaController = TextEditingController(text: widget.item['nota']!);
  }

  void _goToLeanCanvasForm() async {
    if (_formKey.currentState!.validate()) {
      final leanCanvasData = await Navigator.push<Map<String, String>>(
        context,
        MaterialPageRoute(
          builder: (context) => LeanCanvasForm(
            initialData: widget.item,
          ),
        ),
      );

      if (leanCanvasData != null) {
        final updatedItem = {
          'nombreProyecto': _nombreProyectoController.text,
          'empresa': _empresaController.text,
          'descripcion': _descripcionController.text,
          'nota': _notaController.text,
          ...leanCanvasData,
        };

        Navigator.pop(context, updatedItem);
      }
    }
  }

  @override
  void dispose() {
    _nombreProyectoController.dispose();
    _empresaController.dispose();
    _descripcionController.dispose();
    _notaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Proyecto', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF1B264F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white), 
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nombreProyectoController,
                  decoration: const InputDecoration(labelText: 'Nombre del Proyecto'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresar un nombre de proyecto';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _empresaController,
                  decoration: const InputDecoration(labelText: 'Empresa'),
                ),
                TextFormField(
                  controller: _descripcionController,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
                TextFormField(
                  controller: _notaController,
                  decoration: const InputDecoration(labelText: 'Nota'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B264F), // Color de fondo del botón
                      ),
                  onPressed: _goToLeanCanvasForm,
                  child: const Text('Siguiente', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
