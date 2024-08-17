import 'package:flutter/material.dart';
import 'resultados_page.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  double montoPrestamo = 10000;
  int plazoPrestamo = 24;
  double tasaInteres = 44;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Préstamos'),
        backgroundColor: Color(0xFF003366),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            buildSlider(
              'Monto del préstamo',
              montoPrestamo,
              1000,
              50000,
              (value) {
                setState(() {
                  montoPrestamo = value;
                });
              },
              'S/. ${montoPrestamo.toStringAsFixed(2)}',
              'S/. 1,000.00',
              'S/. 50,000.00',
            ),
            SizedBox(height: 20),
            buildSlider(
              'Plazo del préstamo',
              plazoPrestamo.toDouble(),
              6,
              36,
              (value) {
                setState(() {
                  plazoPrestamo = value.toInt();
                });
              },
              '$plazoPrestamo meses',
              '6 meses',
              '36 meses',
            ),
            SizedBox(height: 20),
            buildSlider(
              'Tasa de interés anual',
              tasaInteres,
              10,
              50,
              (value) {
                setState(() {
                  tasaInteres = value;
                });
              },
              '${tasaInteres.toStringAsFixed(1)} %',
              '10 %',
              '50 %',
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultadosPage(
                        montoPrestamo: montoPrestamo,
                        plazoPrestamo: plazoPrestamo,
                        tasaInteres: tasaInteres,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Calcular',
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

  Widget buildSlider(
    String title,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
    String currentValue,
    String minValue,
    String maxValue,
  ) {
    return Container(
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
            ),
          ),
          SizedBox(height: 8),
          Slider(
            value: value,
            min: min,
            max: max,
            activeColor: Color(0xFFFFA000),
            inactiveColor: Color(0xFFBDBDBD),
            onChanged: onChanged,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                minValue,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
              ),
              Text(
                currentValue,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFA000),
                ),
              ),
              Text(
                maxValue,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

