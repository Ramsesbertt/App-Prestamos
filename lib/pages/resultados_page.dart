import 'package:flutter/material.dart';
import 'mensaje_page.dart';

class ResultadosPage extends StatelessWidget {
  final double montoPrestamo;
  final int plazoPrestamo;
  final double tasaInteres;

  ResultadosPage(
      {required this.montoPrestamo,
      required this.plazoPrestamo,
      required this.tasaInteres});

  @override
  Widget build(BuildContext context) {
    double interesMensual = tasaInteres / 12 / 100;
    double factor = 1.0;
    for (int i = 0; i < plazoPrestamo; i++) {
      factor *= (1 + interesMensual);
    }
    double cuotaMensual = montoPrestamo * interesMensual / (1 - (1 / factor));
    double totalInteres = cuotaMensual * plazoPrestamo - montoPrestamo;
    double totalPagar = montoPrestamo + totalInteres;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados del Préstamo'),
        backgroundColor: Color(0xFF003366),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            buildDetailCard('Monto del préstamo', 'S/. ${montoPrestamo.toStringAsFixed(2)}'),
            buildDetailCard('Plazo en meses', '$plazoPrestamo'),
            buildDetailCard('Interés mensual %', '${(interesMensual * 100).toStringAsFixed(1)} %'),
            buildDetailCard('Cuota mensual', 'S/. ${cuotaMensual.toStringAsFixed(2)}'),
            buildDetailCard('Total de interés a pagar', 'S/. ${totalInteres.toStringAsFixed(2)}'),
            buildDetailCard('Total a pagar', 'S/. ${totalPagar.toStringAsFixed(2)}'),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MensajePage(),
                    ),
                  );
                },
                child: Text(
                  'Saca tu préstamo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15), backgroundColor: Color(0xFF003366),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailCard(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF212121),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFA000),
            ),
          ),
        ],
      ),
    );
  }
}


