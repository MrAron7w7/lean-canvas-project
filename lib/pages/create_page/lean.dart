import 'package:flutter/material.dart';

class LeanCanvasForm extends StatefulWidget {
  final Map<String, String> initialData;

  LeanCanvasForm({this.initialData = const {}}); // Parámetro opcional con valor predeterminado

  @override
  _LeanCanvasFormState createState() => _LeanCanvasFormState();
}

class _LeanCanvasFormState extends State<LeanCanvasForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _propuestaValorController;
  late TextEditingController _segmentoClientesController;
  late TextEditingController _problemaController;
  late TextEditingController _solucionController;
  late TextEditingController _canalesController;
  late TextEditingController _flujosIngresoController;
  late TextEditingController _estructuraCostesController;
  late TextEditingController _metricasClaveController;
  late TextEditingController _ventajaDiferencialController;

  @override
  void initState() {
    super.initState();
    _propuestaValorController = TextEditingController(text: widget.initialData['propuestaValor'] ?? '');
    _segmentoClientesController = TextEditingController(text: widget.initialData['segmentoClientes'] ?? '');
    _problemaController = TextEditingController(text: widget.initialData['problema'] ?? '');
    _solucionController = TextEditingController(text: widget.initialData['solucion'] ?? '');
    _canalesController = TextEditingController(text: widget.initialData['canales'] ?? '');
    _flujosIngresoController = TextEditingController(text: widget.initialData['flujosIngreso'] ?? '');
    _estructuraCostesController = TextEditingController(text: widget.initialData['estructuraCostes'] ?? '');
    _metricasClaveController = TextEditingController(text: widget.initialData['metricasClave'] ?? '');
    _ventajaDiferencialController = TextEditingController(text: widget.initialData['ventajaDiferencial'] ?? '');
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final leanCanvasData = {
        'propuestaValor': _propuestaValorController.text,
        'segmentoClientes': _segmentoClientesController.text,
        'problema': _problemaController.text,
        'solucion': _solucionController.text,
        'canales': _canalesController.text,
        'flujosIngreso': _flujosIngresoController.text,
        'estructuraCostes': _estructuraCostesController.text,
        'metricasClave': _metricasClaveController.text,
        'ventajaDiferencial': _ventajaDiferencialController.text,
      };

      Navigator.pop(context, leanCanvasData);
    }
  }

  @override
  void dispose() {
    _propuestaValorController.dispose();
    _segmentoClientesController.dispose();
    _problemaController.dispose();
    _solucionController.dispose();
    _canalesController.dispose();
    _flujosIngresoController.dispose();
    _estructuraCostesController.dispose();
    _metricasClaveController.dispose();
    _ventajaDiferencialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilares Lean Canvas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _propuestaValorController,
                    decoration: const InputDecoration(labelText: 'Propuesta Única de Valor'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    
                  ),
                  TextFormField(
                    controller: _segmentoClientesController,
                    decoration: const InputDecoration(labelText: 'Segmento de Clientes'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    
                  ),
                  TextFormField(
                    controller: _problemaController,
                    decoration: const InputDecoration(labelText: 'Problema'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    
                  ),
                  TextFormField(
                    controller: _solucionController,
                    decoration: const InputDecoration(labelText: 'Solución'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    
                  ),
                  TextFormField(
                    controller: _canalesController,
                    decoration: const InputDecoration(labelText: 'Canales'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    
                  ),
                  TextFormField(
                    controller: _flujosIngresoController,
                    decoration: const InputDecoration(labelText: 'Flujos de Ingreso'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    
                  ),
                  TextFormField(
                    controller: _estructuraCostesController,
                    decoration: const InputDecoration(labelText: 'Estructura de Costes'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    
                  ),
                  TextFormField(
                    controller: _metricasClaveController,
                    decoration: const InputDecoration(labelText: 'Métricas Clave'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    
                  ),
                  TextFormField(
                    controller: _ventajaDiferencialController,
                    decoration: const InputDecoration(labelText: 'Ventaja Diferencial'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    
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
          onPressed: _saveForm,
        child: const Icon(
          Icons.done_all,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
