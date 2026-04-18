import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'nota_page.dart';

class DettaglioClientePage extends StatelessWidget {
  final Map<String, dynamic> cliente;

  const DettaglioClientePage({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scheda di ${cliente['nome']}"),
        backgroundColor: const Color(0xFFE9A9BC),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        // Il padding intorno a tutta la pagina
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- INTESTAZIONE BELLA ---
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.pink[50],
                    child: Icon(Icons.person, size: 50, color: Colors.pink[200]),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    cliente['nome'].toString().toUpperCase(),
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                  const Divider(height: 30, thickness: 1),
                ],
              ),
            ),

            // --- ELENCO DELLE MISURE CON ICONE ---
            _rigaDato("Collo", cliente['collo'], Icons.straighten),
            _rigaDato("Manica Lunga", cliente['manica_lunga'], Icons.accessibility),
            _rigaDato("Manica Corta", cliente['manica_corta'], Icons.checkroom),
            _rigaDato("Spalle Totali", cliente['spalle_total'], Icons.square_foot),
            _rigaDato("Circonferenza Seno", cliente['seno'], Icons.architecture),
            _rigaDato("Separazione Busto", cliente['separazione_busto'], Icons.straighten),
            _rigaDato("Altezza Busto", cliente['altezza_busto'], Icons.height),
            _rigaDato("Talle Delantero", cliente['talle_delantero'], Icons.content_cut),
            _rigaDato("Talle Trasero", cliente['talle_trasero'], Icons.content_cut),
            _rigaDato("Circonferenza Vita", cliente['vita'], Icons.shutter_speed_outlined),
            _rigaDato("Circonferenza Bacino", cliente['bacino'], Icons.circle_outlined),
            _rigaDato("Altezza Bacino", cliente['altezza_bacino'], Icons.height),
            _rigaDato("Lunghezza Totale", cliente['lunghezza_totale'], Icons.line_weight),

            const SizedBox(height: 20),

            // --- SEZIONE NOTE ---
            const Text("NOTE AGGIUNTIVE:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(cliente['note']?.toString() ?? "Nessuna nota inserita", style: const TextStyle(fontSize: 15)),
            ),

            const SizedBox(height: 40),

            // --- BOTTONE MODIFICA (Rosa Intenso) ---
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE9A9BC),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 4,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotaPage(clientePerModifica: cliente),
                  ),
                );
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text("MODIFICA TUTTE LE MISURE",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),

            const SizedBox(height: 15),

            // --- BOTTONE ELIMINA (Rosso Sbiadito) ---
            TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () => _confermaElimina(context),
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              label: const Text("ELIMINA QUESTA SCHEDA",
                  style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500)),
            ),

            const SizedBox(height: 150), // <--- IL GRANDE SPAZIO VUOTO SOTTO
          ],
        ),
      ),
    );
  }

  // Funzione per mostrare le righe in modo elegante
  Widget _rigaDato(String titolo, dynamic valore, IconData icona) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icona, size: 20, color: Colors.pink[200]),
          const SizedBox(width: 15),
          Text(titolo, style: const TextStyle(fontSize: 16, color: Colors.black87)),
          const Spacer(),
          Text(
            valore != null && valore.toString().isNotEmpty ? "$valore cm" : "---",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink),
          ),
        ],
      ),
    );
  }

  // Funzione per chiedere conferma prima di eliminare
  void _confermaElimina(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Sei sicura?"),
        content: const Text("Vuoi davvero eliminare questa scheda? L'azione non si può annullare."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("ANNULLA")),
          TextButton(
            onPressed: () async {
              await DatabaseHelper.instance.elimina(cliente['id']);
              Navigator.pop(context); // chiude il dialogo
              Navigator.pop(context, true); // torna all'archivio
            },
            child: const Text("ELIMINA", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

