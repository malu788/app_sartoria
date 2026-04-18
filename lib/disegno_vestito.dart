import 'package:flutter/material.dart';
import 'misure.dart';

/// =======================================
/// DISEGNO CARTAMODELLO BASE
/// =======================================

class DisegnoVestitoPainter extends CustomPainter {

  final double seno;
  final Misure misure;

  DisegnoVestitoPainter({
    required this.seno,
    required this.misure,
  });

  @override
  void paint(Canvas canvas, Size size) {

    /// =====================================
    /// PENNA
    /// =====================================
    ///
    
    double coll =36;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    /// =====================================
    /// CALCOLO TORACE
    /// =====================================

    double torace = seno / 4;
    double scala = 4;

    double larghezzaTorace = torace * scala;

    /// ============================
    /// CALCOLO VITA
    /// ============================

    double vitaQuarto = misure.vita / 4;

    /// larghezza vita nel disegno
    double larghezzaVita = vitaQuarto * scala;


    /// =====================================
    /// CENTRO DAVANTI
    /// =====================================

    double centroX = size.width / 2;

    canvas.drawLine(
      Offset(centroX, 0),
      Offset(centroX, size.height),
      paint,
    );

    /// =====================================
    /// SPALLA
    /// =====================================

    double spallaY = 60;

    /// =====================================
    /// COLLO
    /// =====================================


    double colloL = coll / 6;
    double colloP = 7;

    Path path = Path();

    /// punto iniziale (centro davanti)
    path.moveTo(0, 0);

    /// curva più naturale (tipo Inkscape ma pulita)
    path.quadraticBezierTo(
      colloL * 0.6, // controllo (curva dolce)
      colloP * 0.2,
      colloL,
      colloP,
    );
canvas.drawPath(path, paint);
    /// =====================================
    /// LINEA SPALLA
    /// =====================================

    canvas.drawLine(
      Offset(centroX, spallaY),
      Offset(centroX + larghezzaTorace, spallaY),
      paint,
    );

    /// spalla inclinata

    canvas.drawLine(
      Offset(centroX, 40),
      Offset(centroX + larghezzaTorace * 0.6, spallaY),
      paint,
    );

    /// =====================================
    /// POSIZIONI MODELLISTICHE
    /// =====================================

    double toraceY = 140;
    double vitaY = toraceY + 120;
    double bacinoY = vitaY + 60;

    /// =====================================
    /// PUNTO SENO
    /// =====================================

    double senoX = centroX + larghezzaTorace * 0.4;
    double senoY = toraceY - 20;

    canvas.drawCircle(
      Offset(senoX, senoY),
      4,
      paint,
    );

    /// =====================================
    /// PINCE
    /// =====================================

    double pinceSinistraX = senoX - 10;
    double pinceDestraX = senoX + 10;
    double pinceVitaY = vitaY;

    canvas.drawLine(
      Offset(pinceSinistraX, pinceVitaY),
      Offset(senoX, senoY + 45),
      paint,
    );

    canvas.drawLine(
      Offset(pinceDestraX, pinceVitaY),
      Offset(senoX, senoY + 45),
      paint,
    );

    /// =====================================
    /// LINEA TORACE
    /// =====================================

    canvas.drawLine(
      Offset(centroX, toraceY),
      Offset(centroX + larghezzaTorace, toraceY),
      paint,
    );

    /// =====================================
    /// LARGHEZZE
    /// =====================================

    /// calcolo bacino reale
    double bacino = misure.bacino / 4;
    double larghezzaBacino = bacino * scala;

    /// =====================================
    /// GIRO MANICA
    /// =====================================

    Path giroManica = Path();

    giroManica.moveTo(
      centroX + larghezzaTorace * 0.45,
      spallaY,
    );

    giroManica.quadraticBezierTo(
      centroX + larghezzaTorace,
      toraceY - 30,
      centroX + larghezzaTorace * 0.42,
      toraceY,
    );

    canvas.drawPath(giroManica, paint);

    /// =====================================
    /// FIANCO
    /// =====================================

    Path fianco = Path(); // inizia a disegnar linea del fianco vestito

    fianco.moveTo(
      centroX + larghezzaTorace, // fianco parte linea torace
      toraceY,
    );

    fianco.quadraticBezierTo( //  curva torace
      centroX + larghezzaTorace * 0.8,
      vitaY - 10,
      centroX + larghezzaVita,
      vitaY,
    );

    fianco.quadraticBezierTo( // curva vita
      centroX + larghezzaBacino * 0.7,
      bacinoY - 35,
      centroX + larghezzaBacino,
      bacinoY,
    );

    canvas.drawPath(fianco, paint);

    /// =====================================
    /// LINEA VITA
    /// =====================================

    canvas.drawLine(
      Offset(centroX, vitaY),
      Offset(centroX + larghezzaTorace * 0.9, vitaY),
      paint,
    );

    /// =====================================
    /// LINEA BACINO
    /// =====================================

    canvas.drawLine(
      Offset(centroX, bacinoY),
      Offset(centroX + larghezzaBacino * 1.6, bacinoY),
      paint,
    );

    /// =====================================
    /// LETTERE
    /// =====================================

    final textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    void drawText(String text, double x, double y) {

      final textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(canvas, Offset(x, y));
    }

    drawText("B", centroX - 30, spallaY - 10);
    drawText("D", centroX - 30, toraceY - 10);
    drawText("E", senoX + 10, senoY - 20);
    drawText("F", centroX - 30, vitaY - 10);
    drawText("G", centroX - 30, bacinoY - 10);

    /// scrivere numero sull schermo del dsegno
    final textPainterDebug = TextPainter(







      //////////
      text: TextSpan(
        text: "Seno: $seno",
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );


    /// ======================================
    /// TESTO COLLO
    /// mostra la misura del collo nel disegno
    /// ======================================

    /// creiamo il pittore del testo
    final colloPainter = TextPainter(
      text: TextSpan(
        text: "Collo: ${misure.collo.toStringAsFixed(1)}", // testo con misura
        style: const TextStyle(
          color: Colors.purple, // colore del testo
          fontSize: 18, // grandezza del testo
          fontWeight: FontWeight.bold, // grassetto
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    /// prepariamo il layout del testo
    colloPainter.layout();

    /// disegniamo il testo vicino alla linea del collo
    colloPainter.paint(
      canvas,
      const Offset(20, 6), // posizione nel disegno
    );






    /// TESTO VITA
    final vitaPainter = TextPainter(
      text: TextSpan(
        text: "Vita: ${misure.vita}",
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );


    /// ======================================
    /// TESTO BACINO
    /// mostra la misura del bacino nel disegno
    /// ======================================

    final bacinoPainter = TextPainter(
      text: TextSpan(
        text: "Bacino: ${misure.bacino.toStringAsFixed(1)}",
        style: const TextStyle(
          color: Colors.green, // colore testo
          fontSize: 18, // grandezza testo
          fontWeight: FontWeight.bold, // grassetto
        ),
      ),
      textDirection: TextDirection.ltr,
    );
////////////////////////
    



    /// prepara il layout del testo
    bacinoPainter.layout();

    /// disegna il testo vicino alla linea bacino
    bacinoPainter.paint(
      canvas,
      Offset(20, bacinoY), // posizione del testo
    );




    ////////
    vitaPainter.layout();

    vitaPainter.paint(
      canvas,
      Offset(20, vitaY),
    );


    //////////////////////////////////
    textPainterDebug.layout();

    textPainterDebug.paint(
      canvas,
      Offset(20, 20),
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
