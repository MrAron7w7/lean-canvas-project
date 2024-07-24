import 'package:flutter/material.dart';

class LeanCanvasForm extends StatefulWidget {
  final Map<String, String> initialData;

  const LeanCanvasForm(
      {super.key,
      this.initialData =
          const {}}); // Parámetro opcional con valor predeterminado

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
    _propuestaValorController =
        TextEditingController(text: widget.initialData['propuestaValor'] ?? '');
    _segmentoClientesController = TextEditingController(
        text: widget.initialData['segmentoClientes'] ?? '');
    _problemaController =
        TextEditingController(text: widget.initialData['problema'] ?? '');
    _solucionController =
        TextEditingController(text: widget.initialData['solucion'] ?? '');
    _canalesController =
        TextEditingController(text: widget.initialData['canales'] ?? '');
    _flujosIngresoController =
        TextEditingController(text: widget.initialData['flujosIngreso'] ?? '');
    _estructuraCostesController = TextEditingController(
        text: widget.initialData['estructuraCostes'] ?? '');
    _metricasClaveController =
        TextEditingController(text: widget.initialData['metricasClave'] ?? '');
    _ventajaDiferencialController = TextEditingController(
        text: widget.initialData['ventajaDiferencial'] ?? '');
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
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilares Lean Canvas',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _propuestaValorController,
                    decoration: InputDecoration(
                      labelText: 'Propuesta Única de Valor',
                      counterText: '',
                      labelStyle: TextStyle(color: textColor),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: textColor),
                  ),
                  TextFormField(
                    controller: _segmentoClientesController,
                    decoration: InputDecoration(
                      labelText: 'Segmento de Clientes',
                      counterText: '',
                      labelStyle: TextStyle(color: textColor),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: textColor),
                  ),
                  TextFormField(
                    controller: _problemaController,
                    decoration: InputDecoration(
                      labelText: 'Problema',
                      counterText: '',
                      labelStyle: TextStyle(color: textColor),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: textColor),
                  ),
                  TextFormField(
                    controller: _solucionController,
                    decoration: InputDecoration(
                      labelText: 'Solución',
                      counterText: '',
                      labelStyle: TextStyle(color: textColor),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: textColor),
                  ),
                  TextFormField(
                    controller: _canalesController,
                    decoration: InputDecoration(
                      labelText: 'Canales',
                      counterText: '',
                      labelStyle: TextStyle(color: textColor),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: textColor),
                  ),
                  TextFormField(
                    controller: _flujosIngresoController,
                    decoration: InputDecoration(
                      labelText: 'Flujos de Ingreso',
                      counterText: '',
                      labelStyle: TextStyle(color: textColor),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: textColor),
                  ),
                  TextFormField(
                    controller: _estructuraCostesController,
                    decoration: InputDecoration(
                      labelText: 'Estructura de Costes',
                      counterText: '',
                      labelStyle: TextStyle(color: textColor),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: textColor),
                  ),
                  TextFormField(
                    controller: _metricasClaveController,
                    decoration: InputDecoration(
                      labelText: 'Métricas Clave',
                      counterText: '',
                      labelStyle: TextStyle(color: textColor),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: textColor),
                  ),
                  TextFormField(
                    controller: _ventajaDiferencialController,
                    decoration: InputDecoration(
                      labelText: 'Ventaja Diferencial',
                      counterText: '',
                      labelStyle: TextStyle(color: textColor),
                    ),
                    maxLength: 100,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
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
