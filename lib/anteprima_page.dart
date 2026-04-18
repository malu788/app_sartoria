import 'package:flutter/material.dart';
import 'cliente.dart';
import 'package:sartoria_valencia/misure.dart';
import 'disegno_vestito.dart'; // 👈 IMPORT del disegno del cartamodello
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';


// ===============================
// 📄 PAGINA ANTEPRIMA CARTAMODELLO
// ===============================

class AnteprimaPage extends StatelessWidget {


  final GlobalKey disegnoKey = GlobalKey();


  //CREA PDF
  // ===============================
// 📄 FUNZIONE GENERA PDF
// ===============================
  Future<void> generaPDF(BuildContext context) async {
    // 🔹 Creiamo il documento PDF
    final pdf = pw.Document();

    // 🔹 Aggiungiamo una pagina al PDF
    pdf.addPage(

      pw.Page(

        // 🔹 Contenuto della pagina
        build: (pw.Context context) {
          return pw.Column(

            crossAxisAlignment: pw.CrossAxisAlignment.start,

            children: [


              // ===============================
              // 🧵 TITOLO CARTAMODELLO
              // ===============================
              pw.Text(
                "Cartamodello Taglia $taglia",
                style: pw.TextStyle(fontSize: 24),
              ),

              pw.SizedBox(height: 20),

              //vedere limagina pfd


              // ===============================
              // 📏 MISURE
              // ===============================
              pw.Text("Seno: ${seno.toStringAsFixed(1)} cm"),
              pw.Text("Vita: ${vita.toStringAsFixed(1)} cm"),
              pw.Text("Bacino: ${bacino.toStringAsFixed(1)} cm"),
/////////////////////////////////////////////////
              pw.SizedBox(height: 20),

              // ===============================
              // 📐 LEGENDA MODELLISTICA
              // ===============================
              pw.Text("Legenda Modellistica"),

              pw.Text("A - Punto collo"),
              pw.Text("B - Fine spalla"),
              pw.Text("C - Giro manica"),
              pw.Text("D - Linea torace"),
              pw.Text("E - Punto seno"),
              pw.Text("F - Linea vita"),
              pw.Text("G - Linea bacino"),

              pw.SizedBox(height: 30),
              // ===============================
// AREA DISEGNO CARTAMODELLO
// ===============================

              pw.Container(

                // larghezza area disegno
                width: 500,

                // altezza area disegno
                height: 400,

                // dentro il container mettiamo il disegno
                child: pw.Stack(

                  children: [

                    // ==================================
                    // LINEA CENTRO DAVANTI (verticale)
                    // ==================================

                    pw.Positioned(

                      // distanza dall'alto
                      top: 40,

                      // distanza da sinistra
                      left: 100,

                      child: pw.Container(

                        // linea molto sottile
                        width: 3,

                        // lunghezza linea
                        height: 350,

                        // colore linea
                        color: PdfColors.black,

                      ),

                    ),


                    // ==================================
                    // LINEA SPALLA
                    // ==================================

                    pw.Positioned(

                      top: 60,
                      left: 100,

                      child: pw.Container(

                        width: 320, // allungare ls spalla
                        height: 3,

                        color: PdfColors.black,

                      ),

                    ),


                    // ==================================
                    // LINEA TORACE
                    // ==================================

                    pw.Positioned(

                      top: 150,
                      left: 100,

                      child: pw.Container(

                        width: 340,
                        height: 3,

                        color: PdfColors.black,

                      ),

                    ),


                    // ==================================
                    // LINEA VITA
                    // ==================================

                    pw.Positioned(

                      top: 240,
                      left: 100,

                      child: pw.Container(

                        width: 260,
                        height: 3,

                        color: PdfColors.black,

                      ),

                    ),


                    // ==================================
                    // LINEA BACINO
                    // ==================================

                    pw.Positioned(

                      top: 330,
                      left: 100,

                      child: pw.Container(

                        width: 360,
                        height: 3,

                        color: PdfColors.black,

                      ),

                    ),


                    // ==================================
                    // LETTERA SPALLA
                    // ==================================

                    pw.Positioned(
                      top: 55,
                      left: 60,
                      child: pw.Text("B"),
                    ),


                    // ==================================
                    // LETTERA TORACE
                    // ==================================

                    pw.Positioned(
                      top: 145,
                      left: 60,
                      child: pw.Text("D"),
                    ),


                    // ==================================
                    // LETTERA VITA
                    // ==================================

                    pw.Positioned(
                      top: 235,
                      left: 60,
                      child: pw.Text("F"),
                    ),


                    // ==================================
                    // LETTERA BACINO
                    // ==================================

                    pw.Positioned(
                      top: 325,
                      left: 60,
                      child: pw.Text("G"),
                    ),

                  ],

                ),

              ),


              // ===============================
              // 📐 DISEGNO CARTAMODELLO
              // ===============================
              pw.Container(
                width: 500,
                height: 400,

                child: pw.Stack(
                  children: [

                    // LINEA CENTRO DAVANTI
                    pw.Positioned(
                      top: 40,
                      left: 100,
                      child: pw.Container(
                        width: 3,
                        height: 350,
                        color: PdfColors.black,
                      ),
                    ),

                    // altre linee qui...

                  ],
                ),
              )


//finisce
            ],

          );
        },

      ),

    );

    // ===============================
    // 🖨️ APRE LA STAMPA / SALVA PDF
    // ===============================
    await Printing.layoutPdf(

      onLayout: (format) async => pdf.save(),

    );
  }


/////////////////////////
  // 🔹 DATI CHE ARRIVANO DALLA PAGINA MISURE
  final double collo;
  final double seno;
  final double vita;
  final double bacino;
  final String taglia;

  // 🔹 COSTRUTTORE
  AnteprimaPage({
    super.key,
    required this.collo,
    required this.seno,
    required this.vita,
    required this.bacino,
    required this.taglia,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ===============================
      // 🟣 APPBAR
      // ===============================
        appBar: AppBar(
          title: Text("Anteprima Taglia $taglia"),
          backgroundColor: Colors.purple,
        ),

        // ===============================
        // 📜 SCROLL PAGINA
        // ===============================
        body: SingleChildScrollView(

          child: Column(

              children: [

              const SizedBox(height: 20),
// MOSTRARE TUTTE LE MISURE SOPRA


          // ===============================
          // 🎨 AREA DISEGNO CARTAMODELLO
          // ===============================

          Container(

            height: 400,
            margin: const EdgeInsets.all(16),
            color: Colors.grey[200],

            // 👇 permette ZOOM con due dita
            child: InteractiveViewer(

              minScale: 0.5,
              maxScale: 5,

              child: Center(

                child: RepaintBoundary(
                  key: disegnoKey,
                  child: CustomPaint(

                    // dimensione area disegno
                    size: const Size(400, 600),

                    // 👇 PASSIAMO LE MISURE AL DISEGNO
                    painter: DisegnoVestitoPainter(
                      seno: seno,
                      misure: Misure(
                        collo: collo,
                         corta: 0,
                        vita: vita,
                        bacino: bacino,
                        torace: seno,
                        altezzaTorace: 25,
                        altezzaVita: 40,
                        altezzaBacino: 60,
                      ),
                    ),


                  ),

                ),

              ),

            ),

          ),
////////////AGGIUNGERE IL DISEGNO PDF


          // ===============================
          // 📐 LEGENDA MODELLISTICA
          // ===============================

          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [

                Text(
                  "Legenda Modellistica",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text("A - Punto collo"),
                Text("B - Fine spalla"),
                Text("C - Giro manica"),
                Text("D - Linea torace"),
                Text("E - Punto seno"),
                Text("F - Linea vita"),
                Text("G - Linea bacino"),

              ],

            ),

          ),

          const SizedBox(height: 20),

          // ===============================
          // 📊 VISUALIZZA MISURE
          // ===============================

          Padding(

            padding: const EdgeInsets.all(16),

            child: Column(

              children: [


                // =======================================================
                /// BOTTONE SALVA CLIENTE
                /// quando premiamo il bottone il cliente viene salvato
                /// =======================================================


//////////////////////////////////////////////////
                Text("Seno: ${seno.toStringAsFixed(1)} cm"),
                Text("Vita: ${vita.toStringAsFixed(1)} cm"),
                Text("Bacino: ${bacino.toStringAsFixed(1)} cm"),


////////////////////////////
              ],

            ),

          ),

          const SizedBox(height: 20),
          //
          // =======================================================

          // ===============================
          // 🔘 BOTTONI AZIONE
          // ===============================
          SafeArea(
            child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,

                children: [


/////////////////////////////////////////////
                // 📄 GENERA PDF
                ElevatedButton(


/////////////////////////////////
                onPressed: () {
          generaPDF(context);
/////

                  Cliente nuovoCliente = Cliente(
                    nome: "Cliente prova",
                    collo: collo,
                    spalla_singula: 0,
                    spalle: 0,
                    seno: seno,
                    vita: vita,
                    bacino: bacino,
                    taglia: taglia,
                    nota: "",
                  );


                  listaClienti.add(nuovoCliente);

          /////
          },

            child: const Text("Genera PDF"),

            //////////


//////////////////////////////////////////////////////
          ),
/////////////////////////////////////////



// =======================================================
  ////////////////////////
  // 🔙 TORNA ALLA PAGINA MISURE
  OutlinedButton(

  onPressed: () {
  Navigator.pop(context);
  },

  child: const Text("Modifica Misure"),

  ),

  ],

  ),
  ),
  const SizedBox(height: 80),

  ],

  ),

  )

  ,

  );

}

}
