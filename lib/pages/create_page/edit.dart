import 'package:flutter/material.dart';

import 'lean.dart';

class EditDataScreen extends StatefulWidget {
  final Map<String, String> item;

  const EditDataScreen({super.key, required this.item});

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
    _nombreProyectoController =
        TextEditingController(text: widget.item['nombreProyecto']);
    _empresaController = TextEditingController(text: widget.item['empresa']);
    _descripcionController =
        TextEditingController(text: widget.item['descripcion']);
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
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    final inputDecoration = InputDecoration(
      labelStyle: TextStyle(color: textColor),
      counterStyle: TextStyle(color: textColor),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: textColor ?? Colors.black),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: textColor ?? Colors.black),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Proyecto',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1B264F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: theme.scaffoldBackgroundColor,
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
                    decoration: inputDecoration.copyWith(
                      labelText: 'Nombre del Proyecto',
                    ),
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
                    decoration: inputDecoration.copyWith(
                      labelText: 'Empresa',
                    ),
                    maxLength: 28,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _descripcionController,
                    decoration: inputDecoration.copyWith(
                      labelText: 'Descripción',
                    ),
                    maxLength: 100,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _notaController,
                    decoration: inputDecoration.copyWith(
                      labelText: 'Nota',
                    ),
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
