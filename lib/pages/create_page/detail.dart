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
              child: const Text('Cancelar', style: TextStyle(color: Color(0xFF1B264F)),),
              onPressed: () {
                Navigator.of(context).pop({'delete': 'false'});
              },
            ),
            TextButton(
              child: const Text('Eliminar', style: TextStyle(color: Color(0xFF1B264F)),),
              onPressed: () {
                Navigator.of(context).pop({'delete': 'true'});
              },
            ),
          ],
        );
      },
    );

    if (result != null && result['delete'] == 'true') {
      Navigator.pop(context, {'delete': 'true'});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' ${item['nombreProyecto'] ?? ''}',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1B264F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                const Text(
                  'Empresa:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B264F)),
                ),
                Text(
                  ' ${item['empresa'] ?? ''}',
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF274690)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Descripción: ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B264F)),
                ),
                Text(
                  ' ${item['descripcion'] ?? ''}',
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF274690)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Nota: ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B264F)),
                ),
                Text(
                  ' ${item['nota'] ?? ''}',
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF274690)),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                const Text('Lean Canvas',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B264F))),
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/modelocanvas.png',
                  height: 250,
                ),
                const SizedBox(height: 40),
                const Text('Propuesta Única de Valor:',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B264F))),
                Text(' ${item['propuestaValor'] ?? ''}',
                    style: const TextStyle(
                        fontSize: 16, color: Color(0xFF274690))),
                const SizedBox(height: 10),
                const Text('Segmento de Clientes: ',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B264F))),
                Text(' ${item['segmentoClientes'] ?? ''}',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF274690))),
                const SizedBox(height: 10),
                const Text('Problema: ',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B264F))),
                Text(' ${item['problema'] ?? ''}',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF274690))),
                const SizedBox(height: 10),
                const Text('Solución: ',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B264F))),
                Text(' ${item['solucion'] ?? ''}',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF274690))),
                const SizedBox(height: 10),
                const Text('Canales: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B264F))),
                Text(' ${item['canales'] ?? ''}',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF274690))),
                const SizedBox(height: 10),
                const Text('Flujos de Ingreso: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B264F))),
                Text(' ${item['flujosIngreso'] ?? ''}',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF274690))),
                const SizedBox(height: 10),
                const Text('Estructura de Costes: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B264F))),
                Text(' ${item['estructuraCostes'] ?? ''}',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF274690))),
                const SizedBox(height: 10),
                const Text('Métricas Clave: ',
                    style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, color: Color(0xFF1B264F))),
                Text(' ${item['metricasClave'] ?? ''}',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF274690))),
                const SizedBox(height: 10),
                const Text('Ventaja Diferencial: ',
                    style: TextStyle(fontSize: 16,  fontWeight: FontWeight.bold, color: Color(0xFF1B264F))),
                Text(' ${item['ventajaDiferencial'] ?? ''}',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF274690))),
                const SizedBox(height: 40),
              ],
            ),
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
              builder: (context) => EditDataScreen(item: item),
            ),
          );

          if (result != null) {
            Navigator.pop(context, result);
          }
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
