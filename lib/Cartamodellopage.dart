import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class CartamodelloPage extends StatefulWidget {
  const CartamodelloPage({super.key});

  @override
  State<CartamodelloPage> createState() => _CartamodelloPageState();
}

class _CartamodelloPageState extends State<CartamodelloPage> {
  // 1. MISURE REALI DEL CLIENTE (in cm)
  double circonferenzaSeno = 100.0;
  double circonferenzaVita = 80.0;
  double lunghezzaVita = 45.0;

  @override
  Widget build(BuildContext context) {
    // 2. FORMULE SARTORIALI (Calcolo dei quarti + vestibilità)
    double larSeno = ((circonferenzaSeno / 4) + 2) * 10; // Punto torace in mm
    double larVita = ((circonferenzaVita / 4) + 2) * 10; // Punto vita in mm
    double altVita = lunghezzaVita * 10; // Altezza totale in mm

    return Scaffold(
      appBar: AppBar(title: const Text("Modello Dinamico"), backgroundColor: const Color(0xFFE9A9BC)),
      body: Column(
        children: [
          // Pannello Comandi
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.pink.shade50,
            child: Column(
              children: [
                Text("Seno: ${circonferenzaSeno.toInt()} cm"),
                Slider(value: circonferenzaSeno, min: 80, max: 140, onChanged: (v) => setState(() => circonferenzaSeno = v)),
                Text("Vita: ${circonferenzaVita.toInt()} cm"),
                Slider(value: circonferenzaVita, min: 60, max: 120, onChanged: (v) => setState(() => circonferenzaVita = v)),
                Text("Altezza: ${lunghezzaVita.toInt()} cm"),
                Slider(value: lunghezzaVita, min: 35, max: 65, onChanged: (v) => setState(() => lunghezzaVita = v)),
              ],
            ),
          ),
          // Disegno
          Expanded(
            child: InteractiveViewer(
              child: CustomPaint(
                size: const Size(800, 800),
                painter: SartoPainter(larSeno, larVita, altVita),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SartoPainter extends CustomPainter {
  final double seno;
  final double vita;
  final double altezza;
  SartoPainter(this.seno, this.vita, this.altezza);

  @override
  void paint(Canvas canvas, Size size) {
    double x = 60.0;
    double y = 60.0;

    final pennaNera = Paint()..color = Colors.black..style = PaintingStyle.stroke..strokeWidth = 2;
    final pennaRosa = Paint()..color = Colors.pink..style = PaintingStyle.stroke..strokeWidth = 3;

    // --- DISEGNO ---
    Path scollo = parseSvgPathData('M 60.8,0 C 60.6,23.4 23.4,60.6 0,60.8');
    Path spalla = parseSvgPathData('M 60.8,1 C 103,1 145,1 188.3,1');

    canvas.drawPath(scollo.shift(Offset(x, y)), pennaRosa);
    canvas.drawPath(spalla.shift(Offset(x, y)), pennaNera);

    // COORDINATE DEI PUNTI DINAMICI
    double livelloSizzaY = y + 180; // La linea del seno è circa 18cm sotto la spalla

    Offset puntoSeno = Offset(x + seno, livelloSizzaY);
    Offset puntoVita = Offset(x + vita, y + altezza);

    // LINEA FIANCO (Unisce il Seno alla Vita)
    canvas.drawLine(puntoSeno, puntoVita, pennaNera);

    // GIRO MANICA (Sizza) - Collega fine spalla al punto seno
    canvas.drawLine(Offset(x + 188, y + 1), puntoSeno, pennaNera);

    // CHIUSURA CENTRO E VITA
    canvas.drawLine(Offset(x, y), Offset(x, y + altezza), pennaNera); // Centro
    canvas.drawLine(Offset(x, y + altezza), puntoVita, pennaNera); // Cintura
  }

  @override
  bool shouldRepaint(SartoPainter oldDelegate) => true;
}

