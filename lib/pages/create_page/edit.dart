import 'package:flutter/material.dart';
import 'lean.dart';

class EditDataScreen extends StatefulWidget {
  final Map<String, String> item;

  EditDataScreen({required this.item});

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
    _nombreProyectoController = TextEditingController(text: widget.item['nombreProyecto']);
    _empresaController = TextEditingController(text: widget.item['empresa']);
    _descripcionController = TextEditingController(text: widget.item['descripcion']);
    _notaController = TextEditingController(text: widget.item['nota']);
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

        _nombreProyectoController.clear();
        _empresaController.clear();
        _descripcionController.clear();
        _notaController.clear();
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
        title: const Text('Editar Proyecto', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1B264F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white), 
          onPressed: () => Navigator.of(context).pop(),
        ),
        
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _nombreProyectoController,
                    decoration: const InputDecoration(labelText: 'Nombre del Proyecto', counterText: ''),
                    maxLength: 28,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el nombre del proyecto';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _empresaController,
                    decoration: const InputDecoration(labelText: 'Empresa', counterText: ''),
                    maxLength: 28,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _descripcionController,
                    decoration: const InputDecoration(labelText: 'Descripción', counterText: ''),
                    maxLength: 100,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _notaController,
                    decoration: const InputDecoration(labelText: 'Nota', counterText: ''),
                    maxLength: 100,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: const Color(0xFF1B264F),
          onPressed: _goToLeanCanvasForm,
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
