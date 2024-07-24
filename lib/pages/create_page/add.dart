import 'package:flutter/material.dart';
import 'package:lean_canvas/pages/create_page/lean.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreProyectoController = TextEditingController();
  final _empresaController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _notaController = TextEditingController();

  void _goToLeanCanvasForm() async {
    if (_formKey.currentState!.validate()) {
      final leanCanvasData = await Navigator.push<Map<String, String>>(
        context,
        MaterialPageRoute(
          builder: (context) => const LeanCanvasForm(),
        ),
      );

      if (leanCanvasData != null) {
        final newItem = {
          'nombreProyecto': _nombreProyectoController.text,
          'empresa': _empresaController.text,
          'descripcion': _descripcionController.text,
          'nota': _notaController.text,
          ...leanCanvasData,
        };

        Navigator.pop(context, newItem);

        _nombreProyectoController.clear();
        _empresaController.clear();
        _descripcionController.clear();
        _notaController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor = theme.scaffoldBackgroundColor;
    final textColor = theme.textTheme.bodyLarge?.color;
    final inputDecorationColor =
        isDarkMode ? Colors.white : const Color(0xFF1B264F);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo Proyecto',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF1B264F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: backgroundColor,
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
                    decoration: InputDecoration(
                      labelText: 'Nombre del Proyecto',
                      labelStyle: TextStyle(color: inputDecorationColor),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: inputDecorationColor),
                      ),
                    ),
                    maxLength: 28,
                    style: TextStyle(color: textColor),
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
                    decoration: InputDecoration(
                      labelText: 'Empresa',
                      labelStyle: TextStyle(color: inputDecorationColor),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: inputDecorationColor),
                      ),
                    ),
                    maxLength: 28,
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _descripcionController,
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      labelStyle: TextStyle(color: inputDecorationColor),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: inputDecorationColor),
                      ),
                    ),
                    maxLength: 100,
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _notaController,
                    decoration: InputDecoration(
                      labelText: 'Nota',
                      labelStyle: TextStyle(color: inputDecorationColor),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: inputDecorationColor),
                      ),
                    ),
                    maxLength: 100,
                    style: TextStyle(color: textColor),
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
