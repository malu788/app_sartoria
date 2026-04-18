import 'package:flutter/material.dart';

class IstruzioniPage extends StatelessWidget {
  const IstruzioniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guida alle Misure"),
        backgroundColor: const Color(0xFFE9A9BC),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "COME PRENDERE LE MISURE",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE9A9BC)),
            ),
            const SizedBox(height: 10),
            const Text(
              "Segui questa guida per garantire che il cartamodello sia perfetto.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 25),

            // FOTO CON ZOOM
            SizedBox(
              height: 450, // Un po' più alto per dare respiro
              width: double.infinity,
              child: InteractiveViewer(
                clipBehavior: Clip.none, // FONDAMENTALE: permette di uscire dai bordi orizzontali
                panEnabled: true, // Permette di spostare la foto ovunque
                minScale: 1.0,
                maxScale: 5.0, // Zoom molto potente
                boundaryMargin: const EdgeInsets.symmetric(horizontal: 200, vertical: 200), // Spazio extra per muoverla
                child: Center(
                  child: Image.asset(
                    'assets/icons/misura.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),


            const SizedBox(height: 30),

            // ELENCO ISTRUZIONI
            _buildIstruzione(Icons.accessibility, "1. COLLO", "Misura alla base del collo, appoggiando il metro sopra la settima vertebra."),
            _buildIstruzione(Icons.straighten, "2. SENO", "Circonferenza totale nel punto più sporgente del busto."),
            _buildIstruzione(Icons.content_cut, "3. VITA", "Misura nel punto più stretto, solitamente sopra l'ombelico."),
            _buildIstruzione(Icons.height, "4. BACINO", "Circonferenza massima dei fianchi (circa 20cm sotto la vita)."),
            _buildIstruzione(Icons.architecture, "5. SPALLE", "Dall'osso della spalla sinistra a quella destra."),
            _buildIstruzione(Icons.straighten, "6. SEPARAZIONE BUSTO", "Distanza tra i due punti più alti del seno."),
            _buildIstruzione(Icons.check_box_outline_blank, "7. TALLE", "Misura dalla base del collo fino alla linea della vita."),

            const SizedBox(height: 40),

            // BOX CONSIGLIO
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "💡 CONSIGLIO: Assicurati che il metro sia sempre parallelo al pavimento per le circonferenze.",
                style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
              ),
            ),

            // --- SPAZIO VUOTO SOTTO (SPAZZATURA) ---
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }

  Widget _buildIstruzione(IconData icona, String titolo, String descrizione) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icona, color: const Color(0xFFE9A9BC), size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titolo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 5),
                Text(
                    descrizione,
                    style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4) // Corretto qui!
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

