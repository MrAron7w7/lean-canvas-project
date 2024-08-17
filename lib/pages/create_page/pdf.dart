import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'view.dart';

class PDFGenerator {
  static Future<void> generatePDF(BuildContext context, Map<String, String> item) async {
    final pdf = pw.Document();

    // Cargar la imagen desde los assets
    final ByteData bytes = await rootBundle.load('assets/images/lienzo.png');
    final Uint8List imageBytes = bytes.buffer.asUint8List();
    final pw.ImageProvider imageProvider = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(
            children: <pw.Widget>[
              pw.Padding(
                padding: const pw.EdgeInsets.all(16.0),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: <pw.Widget>[
                    pw.SizedBox(height: 20),
                    pw.Center(
                      child: pw.Text(
                        ' ${item['nombreProyecto'] ?? ''}',
                        style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Text('Empresa: ${item['empresa'] ?? ''}', style: const pw.TextStyle(fontSize: 14)),
                    pw.SizedBox(height: 10),
                    pw.Text('Descripción: ${item['descripcion'] ?? ''}', style: const pw.TextStyle(fontSize: 14)),
                    pw.SizedBox(height: 10),
                    pw.Text('Nota: ${item['nota'] ?? ''}', style: const pw.TextStyle(fontSize: 14)),
                    pw.SizedBox(height: 20),
                    pw.Divider(),
                  ],
                ),
              ),
              pw.Positioned(
                left: 0,
                top: 260,
                child: pw.Image(
                  imageProvider,
                  width: 480,
                  height: 380,
                  fit: pw.BoxFit.fill,
                ),
              ),
              pw.Positioned(
                left: 16,
                top: 350,
                child: pw.Container(
                  width: 80,
                  height: 120,
                  child: pw.Text(
                    ' ${item['problema'] ?? ''}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
              pw.Positioned(
                left: 108,
                top: 350,
                child: pw.Container(
                  width: 80,
                  height: 60,
                  child: pw.Text(
                    ' ${item['solucion'] ?? ''}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
              pw.Positioned(
                left: 200,
                top: 370,
                child: pw.Container(
                  width: 80,
                  height: 120,
                  child: pw.Text(
                    ' ${item['propuestaValor'] ?? ''}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
              pw.Positioned(
                left: 294,
                top: 350,
                child: pw.Container(
                  width: 80,
                  height: 60,
                  child: pw.Text(
                    ' ${item['ventajaDiferencial'] ?? ''}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
              pw.Positioned(
                left: 388,
                top: 370,
                child: pw.Container(
                  width: 80,
                  height: 120,
                  child: pw.Text(
                    ' ${item['segmentoClientes'] ?? ''}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
              pw.Positioned(
                left: 108,
                top: 454,
                child: pw.Container(
                  width: 80,
                  height: 60,
                  child: pw.Text(
                    ' ${item['metricasClave'] ?? ''}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
              pw.Positioned(
                left: 294,
                top: 454,
                child: pw.Container(
                  width: 80,
                  height: 60,
                  child: pw.Text(
                    ' ${item['canales'] ?? ''}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
              pw.Positioned(
                left: 16,
                top: 562,
                child: pw.Container(
                  width: 200,
                  height: 50,
                  child: pw.Text(
                    ' ${item['estructuraCostes'] ?? ''}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
              pw.Positioned(
                left: 250,
                top: 562,
                child: pw.Container(
                  width: 200,
                  height: 50,
                  child: pw.Text(
                    ' ${item['flujosIngreso'] ?? ''}',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/${item['nombreProyecto'] ?? 'proyecto'}.pdf');
      final pdfBytes = await pdf.save();
      await file.writeAsBytes(pdfBytes);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFPreviewScreen(filePath: file.path),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al generar PDF: $e')),
      );
    }
  }
}
