import 'package:flutter/material.dart';
import 'anteprima_page.dart';
import 'inserisci_misure_page.dart';
import 'cliente.dart';

class MisurePage extends StatefulWidget {
  const MisurePage({super.key});

  @override
  State<MisurePage> createState() => _MisurePageState();
}
//VARIABILI
class _MisurePageState extends State<MisurePage> { // APRE

  //collo
  // SENOSELEZIONATO
  //  VITASELEZIONATA   ( Qeste 3 dati lo passaremo ha disegno anteprima
  // VACINOSELEZIONAO
  //MISURE SELEZIONATA
  double colloSelezionato = 0;
  double spallaSingolaSelezionata = 0;
  double spalleSelezionate = 0;
  double senoSelezionato = 0;
  double vitaSelezionata = 0;
  double bacinoSelezionato = 0;

  // NUMERI DOUBLE
int colonnaSelezionata = 1;
  // 🔹 lingua (cambia "it" o "es")
  String lingua = "it";
  // VARIABILE TAGLIA SELEZIONATA

  String tagliaSelezionata = "";  //
//VARIABILE SENO (numeo)
  //BSCINO SELEZIONATO
  TextEditingController notaController = TextEditingController();


  //CALCULA LA MEDIA
  double calcolaMedia(String testo) {
    // divido il testo con il trattino "-"
    var parti = testo.split('-');

    // se ci sono due numeri (es: 80-82)
    if (parti.length == 2) {

      // trasformo in numeri
      double primo = double.parse(parti[0]);
      double secondo = double.parse(parti[1]);

      // faccio la media
      return (primo + secondo) / 2;
    }

    // se c'è un solo numero (es: "80")
    return double.parse(testo);
  }

  //FINISCE CODICE
  // =========================
// METODO SCELTA (taglia / manuale)
// =========================

  String metodo = "taglia"; // valore iniziale


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        backgroundColor: Colors.purple,
      ),

      // 🔹 SCROLL VERTICALE
      body: SingleChildScrollView(
        child: Column(
          children: [

// CAMBIARE LINGUA
            /// ============================
            /// BOTTONI LINGUA
            /// ============================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // 🇮🇹 Italiano
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      lingua = "it";
                    });
                  },
    /// nuovo codice





///FINISCE IL CODICE
                  child: const Text("Italiano"),
                ),

                const SizedBox(width: 10),

                // 🇪🇸 Español
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      lingua = "es";
                    });
                  },
                  child: const Text("Español"),
                ),

              ],
            ),

            // FINISCE IL CODICE CAMMBIO IDIOMA
            /// ===============================
            /// SCELTA METODO
            /// ===============================
            const Text(
              "Scegli metodo:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
/// BUTTON CONTINUA

            ElevatedButton( //apre
              onPressed: () {  //apre

                // controllo quale metodo è stato scelto
                if (metodo == "manuale") {

                  // apro pagina inserimento misure
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InserisciMisurePage(),
                    ),
                  );

                } else {

                  // apro pagina anteprima con la taglia
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnteprimaPage(
                        taglia: tagliaSelezionata,
                        seno: senoSelezionato,
                        vita: vitaSelezionata,
                        bacino: bacinoSelezionato,
                        collo: colloSelezionato,
                      ),
                    ),
                  );

                }

              },// chiude sobra
              child: const Text("Continua"),








            ),//chiude
//////////////////////////////////////

/// INIZIA NUOVO CODICE
            /// ==========================
            /// SELEZIONE TAGLIA
            /// ==========================
            Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                spacing: 10,
                children: [

                  /// XS
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        colonnaSelezionata = 1;
                        tagliaSelezionata = "XS";
                        colloSelezionato =
                        calcolaMedia("34-35");

                        // seno
                        senoSelezionato=
                        calcolaMedia("80-82"); //
                        //vita
                        vitaSelezionata =
                            calcolaMedia("60-62");
bacinoSelezionato = calcolaMedia("88-90");
                      });


                    },
                    child: const Text("XS"),
                  ),
                  /// CASELLA PER SCRIVERE






                  /// S
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        colonnaSelezionata = 2;
                        tagliaSelezionata = "S";
                        colloSelezionato =
                        calcolaMedia("36-37");
                        senoSelezionato =  calcolaMedia("83-87");
                        vitaSelezionata= calcolaMedia("65-69");
                        bacinoSelezionato = calcolaMedia("89-93");
                        // AGGIUNGERE
                        spallaSingolaSelezionata = calcolaMedia("11-12");
                        spalleSelezionate = calcolaMedia("38-36");
                      });
                    },
                    child: const Text("S"),
                  ),

                  /// M
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        colonnaSelezionata = 3;
                        tagliaSelezionata = "M";
                        colloSelezionato  =
                        calcolaMedia("38-39");
                        senoSelezionato =
                        calcolaMedia("88-92");
                        vitaSelezionata =
                        calcolaMedia("70-74");
                        bacinoSelezionato = calcolaMedia("94-98");
                      });
                    },
                    child: const Text("M"),
                  ),

                  /// L
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        colonnaSelezionata = 4;
                        tagliaSelezionata = "L";
                        colloSelezionato =
                        calcolaMedia("40-41");
                        senoSelezionato =
                        calcolaMedia("93-97");
                        vitaSelezionata =
                            calcolaMedia("75-79");
                        bacinoSelezionato =
                            calcolaMedia("99-103");
                      });
                    },
                    child: const Text("L"),
                  ),

                  /// XL
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        colonnaSelezionata = 5;
                        tagliaSelezionata = "XL";
                        colloSelezionato =
                        calcolaMedia("42-43");
                        senoSelezionato =
                            calcolaMedia("98-102");
                        vitaSelezionata =
                            calcolaMedia("80-84");
                        bacinoSelezionato =
                            calcolaMedia("104-108");

                      });
                    },
                    child: const Text("XL"),
                  ),

                  /// XXL
                  ElevatedButton( //APRE
                    onPressed: () {
                      setState(() {
                        tagliaSelezionata =
                        "XXL";
                        colonnaSelezionata = 6;
                        colloSelezionato =
                        calcolaMedia("44-45");
                        senoSelezionato =
                            calcolaMedia("103-108");
                        vitaSelezionata =
                            calcolaMedia("85-90");
                        bacinoSelezionato =
                            calcolaMedia("109-114");
                      });
                    },
                    child: const Text("XXL"),
                  ),  //



                ],
              ),
            ),


///FINISCE
// RADIO BUTTON TAGLIA
            RadioListTile(
              title: const Text("Usa Taglia"),
              value: "taglia",
              groupValue: metodo,
              onChanged: (value) {
                setState(() {
                  metodo = value.toString();
                });
              },
            ),

// RADIO BUTTON MANUALE
            RadioListTile(
              title: const Text("Inserisci Misure"),
              value: "manuale",
              groupValue: metodo,
              onChanged: (value) {
                setState(() {
                  metodo = value.toString();
                });
              },
            ),





//FINISCE
            const SizedBox(height: 20),








            /////

            // 🔹 SCROLL ORIZZONTALE
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                border: TableBorder.all(color: Colors.black),
                defaultColumnWidth: const IntrinsicColumnWidth(),

                children: [

                  /// =========================
                  /// HEADER
                  /// =========================
                  TableRow(
                    children: [
                      _cell("Colonna", isHeader: true), // nome colonna
                      _cell("1", isHeader: true),
                      _cell("2", isHeader: true),
                      _cell("3", isHeader: true),
                      _cell("4", isHeader: true),
                      _cell("5", isHeader: true),
                      _cell("6", isHeader: true),
                    ],
                  ),









                  TableRow(
                    children: [
                      _cell(_getText("misura"), isHeader: true),
                      _cell("XS"),
                      _cell("S"),
                      _cell("M"),
                      _cell("L"),
                      _cell("XL"),
                      _cell("XXL"),
                    ],
                  ),

                  /// COLLO 1
                  TableRow(
                    children: [
                      _cell(_getText("collo"), isHeader: true),
                      _cell("34-35"),
                      _cell("36-37"),
                      _cell("38-39"),
                      _cell("40-41"),
                      _cell("42-43"),
                      _cell("44-45"),
                    ],
                  ),

                  /// MANICA CORTA 2
                  TableRow(
                    children: [
                      _cell(_getText("manica_corta"), isHeader: true),
                      _cell("20"),
                      _cell("21"),
                      _cell("22"),
                      _cell("23"),
                      _cell("24"),
                      _cell("25"),
                    ],
                  ),

                  /// MANICA LUNGA 1
                  TableRow(
                    children: [
                      _cell(_getText("manica_lunga"), isHeader: true),
                      _cell("58"),
                      _cell("59"),
                      _cell("60"),
                      _cell("61"),
                      _cell("62"),
                      _cell("63"),
                    ],
                  ),

                  /// SPALLE TOTALI 2
                  TableRow(
                    children: [
                      _cell(_getText("spalle_totali"), isHeader: true),
                      _cell("35-36"),
                      _cell("37-38"),
                      _cell("39-40"),
                      _cell("41-42"),
                      _cell("43-44"),
                      _cell("45-46"),
                    ],
                  ),

                  /// SPALLA SINGOLA
                  TableRow(
                    children: [
                      _cell(_getText("spalla_singola"), isHeader: true),
                      _cell("11"),
                      _cell("11.5"),
                      _cell("12"),
                      _cell("12.5"),
                      _cell("13"),
                      _cell("13.5"),
                    ],
                  ),

                  /// SENO
                  TableRow(
                    children: [
                      _cell(_getText("seno"), isHeader: true),
                      _cell("78-82"),
                      _cell("83-87"),
                      _cell("88-92"),
                      _cell("93-97"),
                      _cell("98-102"),
                      _cell("103-108"),
                    ],
                  ),
///  SEPARAZIONE BUSTO
                  /// SEPARAZIONE BUSTO
                  TableRow(
                    children: [
                      _cell(_getText("separazione"), isHeader: true),
                      _cell("16-17"),
                      _cell("17.5-18.5"),
                      _cell("19-20"),
                      _cell("20.5-21.5"),
                      _cell("22-23"),
                      _cell("23.5-24.5"),
                    ],
                  ),
                  /// ALTEZZA BUSTO
                  TableRow(
                    children: [
                      _cell(_getText("altezza_busto"), isHeader: true),
                      _cell("23-24"),
                      _cell("24.5-25.5"),
                      _cell("26-27"),
                      _cell("27.5-28.5"),
                      _cell("29-30"),
                      _cell("30.5-31.5"),
                    ],
                  ),



                  /// VITA
                  TableRow(
                    children: [
                      _cell(_getText("vita"), isHeader: true),
                      _cell("60-64"),
                      _cell("65-69"),
                      _cell("70-74"),
                      _cell("75-79"),
                      _cell("80-84"),
                      _cell("85-90"),
                    ],
                  ),

                  /// BACINO
                  TableRow(
                    children: [
                      _cell(_getText("bacino"), isHeader: true),
                      _cell("84-88"),
                      _cell("89-93"),
                      _cell("94-98"),
                      _cell("99-103"),
                      _cell("104-108"),
                      _cell("109-114"),
                    ],
                  ),

                  /// LUNGHEZZA
                  TableRow(
                    children: [
                      _cell(_getText("lunghezza"),

                          isHeader: true),

                      _cell("58-60"),
                      _cell("60-62"),
                      _cell("62-64"),
                      _cell("64-66"),
                      _cell("66-68"),
                      _cell("68-70"),
                    ],
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }






  /// =========================
  /// TITOLO
  /// =========================
  String _getTitle() {
    if (lingua == "it") {
      return "Tabella Misure";
    } else {
      return "Tabla de Medidas";
    }
  }

  /// =========================
  /// TRADUZIONE
  /// =========================
  String _getText(String key) {

    // ITALIANO
    if (lingua == "it") {
      switch (key) {
        case "misura": return "Misura";
        case "collo": return "Collo";
        case "manica_corta": return "Manica Corta";
        case "manica_lunga": return "Manica Lunga";
        case "spalle_totali": return "Spalle Totali";
        case "spalla_singola": return "Spalla Singola";
        case "seno": return "Circonferenza Seno";
        case "vita": return "Circonferenza Vita";
        case "bacino": return "Circonferenza Bacino";
        case "lunghezza": return "Lunghezza Totale";
        case "separazione": return "Separazione Busto";
        case "altezza_busto": return "Altezza Busto";

        default: return key;
      }
    }

    // SPAGNOLO
    else {
      switch (key) {
        case "misura": return "Medida";
        case "collo": return "Cuello";
        case "manica_corta": return "Manga Corta";
        case "manica_lunga": return "Manga Larga";
        case "spalle_totali": return "Hombros Totales";
        case "spalla_singola": return "Hombro Individual";
        case "seno": return "Contorno Pecho";
        case "vita": return "Contorno Cintura";
        case "bacino": return "Contorno Cadera";
        case "separazione": return "Separacion Busto";
        case "lunghezza": return "Largo Total";
        case "altezza_busto": return "Altura Busto";

        default: return key;
      }
    }
  }

  /// =========================
  /// CELLA
  /// =========================
  Widget _cell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
