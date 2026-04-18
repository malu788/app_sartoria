import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() {
  runApp(const MaterialApp(
    home: CartamodelloPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class CartamodelloPage extends StatefulWidget {
  const CartamodelloPage({super.key});

  @override
  State<CartamodelloPage> createState() => _CartamodelloPageState();
}



class _CartamodelloPageState extends State<CartamodelloPage> {

  Map<String, double> misure = {
    'spalla': 13.0,
    'seno': 92.0,
    'vita': 72.0,
    'bacino': 98.0,
    'altezzaVita': 42.0,
    'collo': 34.5,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Valencia Atelier"),
        backgroundColor: const Color(0xFFE9A9BC),
      ),
      body: Column(
        children: [

          /// 🔴 CONTROLLI
          Container(
            height: 300,
            color: Colors.pink.shade50,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                _buildSlider("Collo", 'collo', 30, 45),
                _buildSlider("Spalla", 'spalla', 8, 20),
                _buildSlider("Seno", 'seno', 70, 140),
                _buildSlider("Vita", 'vita', 50, 120),
                _buildSlider("Bacino", 'bacino', 70, 150),
                _buildSlider("Alt. Vita", 'altezzaVita', 30, 60),
              ],
            ),
          ),

          /// ⚪ AREA DISEGNO
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 1200,
                child: CustomPaint(
                  painter: SartoPainter(misure),
                ),
              ),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/icons/cartamodello.svg',
              width: 300,
            ),
          )

        ],
      ),
    );
  }

  Widget _buildSlider(String label, String key, double min, double max) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text("$label: ${misure[key]!.toInt()}")),
        Expanded(
          child: Slider(
            value: misure[key]!,
            min: min,
            max: max,
            activeColor: const Color(0xFFE9A9BC),
            onChanged: (v) => setState(() => misure[key] = v),
          ),
        ),
      ],
    );
  }
}

/// ✂️ DISEGNO CARTAMODELLO
class SartoPainter extends CustomPainter {
  final Map<String, double> m;
  SartoPainter(this.m);

  @override
  void paint(Canvas canvas, Size size) {

    final Paint penna = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    /// 📐 MISURE
    double collo = m['collo']!;
    double spalla = m['spalla']!;
    double seno = m['seno']!;
    double vita = m['vita']!;
    double bacino = m['bacino']!;
    double altVita = m['altezzaVita']!;

    /// 📐 SCALA
    double scala = 10;

    double colloL = (collo / 6) * scala;
    double colloP = 7 * scala;

    double s = spalla * scala;
    double sn = ((seno / 4) + 2) * scala;
    double vt = ((vita / 4) + 2) * scala;
    double bc = ((bacino / 4) + 2) * scala;
    double hVita = altVita * scala;

    double x = 80;
    double y = 100;

    /// 🔴 COLLO PERFETTO
    Path scollo = Path();

    scollo.moveTo(x, y);

    scollo.quadraticBezierTo(
      x + colloL * 0.8,
      y + colloP * 0.3,
      x + colloL,
      y + colloP,
    );

    canvas.drawPath(scollo, penna);

    /// 🟡 SPALLA
    double spallaX = x + colloL + s;
    double spallaY = y + colloP + 30;

    canvas.drawLine(
      Offset(x + colloL, y + colloP),
      Offset(spallaX, spallaY),
      penna,
    );

    /// 🔵 GIRO MANICA MIGLIORATO
    double senoY = y + 200;

    Path manica = Path();

    manica.moveTo(spallaX, spallaY);

    manica.quadraticBezierTo(
      spallaX - 40,
      senoY - 60,
      x + sn,
      senoY,
    );

    canvas.drawPath(manica, penna);

    /// 🟢 FIANCO
    canvas.drawLine(
      Offset(x + sn, senoY),
      Offset(x + vt, y + hVita),
      penna,
    );

    canvas.drawLine(
      Offset(x + vt, y + hVita),
      Offset(x + bc, y + hVita + 200),
      penna,
    );

    /// ⚫ CENTRO
    canvas.drawLine(
      Offset(x, y),
      Offset(x, y + hVita + 200),
      penna,
    );

    /// ⚫ FONDO
    canvas.drawLine(
      Offset(x, y + hVita + 200),
      Offset(x + bc, y + hVita + 200),
      penna,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
