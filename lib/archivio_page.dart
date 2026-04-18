import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'dettaglio_cliente_page.dart';

class ArchivioPage extends StatefulWidget {
  @override
  _ArchivioPageState createState() => _ArchivioPageState();
}

class _ArchivioPageState extends State<ArchivioPage> {
  List<Map<String, dynamic>> _clienti = [];

  @override
  void initState() {
    super.initState();
    _caricaClienti(); // Carica la lista appena apri la pagina


  }

  // inizia il codice
  Future<void> _caricaClienti() async {

    // 1. Apre la connessione al database
    final db = await DatabaseHelper.instance.database;

    // 2. Legge tutte le righe della tabella 'clienti'
    final List<Map<String, dynamic>> dati = await db.query('clienti');

    print("Dati recuperati dal database: ${dati.length} clienti trovate");


    // 3. Dice alla pagina di aggiornarsi con i nuovi dati
    setState(() {
      _clienti = dati;
    });
  }

// fisnice il codice
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Archivio Clienti")),
      body: _clienti.isEmpty
          ? Center(child: Text("Nessuna cliente salvata"))
          : ListView.builder(
        itemCount: _clienti.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(_clienti[index]['nome'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text("Misure: Seno ${_clienti[index]['seno']} - Vita ${_clienti[index]['vita']}"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Per ora lo lasciamo così, cliccando non succede nulla
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DettaglioClientePage(cliente: _clienti[index]),
                  ),
                );
              },
            ),
          );

        },
      ),
    );
  }
}

