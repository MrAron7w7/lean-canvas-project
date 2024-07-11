import 'package:flutter/material.dart';
import 'edit.dart'; 

class DetailScreen extends StatelessWidget {
  final Map<String, String> item;
  final int index;

  DetailScreen({required this.item, required this.index});

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar Proyecto'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Estás seguro de que deseas eliminar este proyecto?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop({'delete': 'false'});
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () {
                Navigator.of(context).pop({'delete': 'true'}); 
              },
            ),
          ],
        );
      },
    );

    if (result != null && result['delete'] == 'true') {
      Navigator.pop(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['nombreProyecto'] ?? 'Detalle del Proyecto', style: const TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF1B264F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white), 
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Empresa: ${item['empresa'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Descripción: ${item['descripcion'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Nota: ${item['nota'] ?? ''}', style: const TextStyle(fontSize: 18)),
              const Divider(),
              const Text('Lean Canvas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Propuesta Única de Valor: ${item['propuestaValor'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Segmento de Clientes: ${item['segmentoClientes'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Problema: ${item['problema'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Solución: ${item['solucion'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Canales: ${item['canales'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Flujos de Ingreso: ${item['flujosIngreso'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Estructura de Costes: ${item['estructuraCostes'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Métricas Clave: ${item['metricasClave'] ?? ''}', style: const TextStyle(fontSize: 18)),
              Text('Ventaja Diferencial: ${item['ventajaDiferencial'] ?? ''}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B264F), 
                    ),
                    onPressed: () async {
                      final result = await Navigator.push<Map<String, String>>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditDataScreen(item: item, index: index),
                        ),
                      );
                      if (result != null) {
                        Navigator.pop(context, result);
                      }
                    },
                    child: const Text('EDITAR', style: TextStyle(color: Colors.white),),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B264F),
                    ),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context); 
                    },
                    child: const Text('ELIMINAR', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
