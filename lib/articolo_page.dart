import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// ============================
/// PAGINA ARTICOLO
/// ============================
class ArticoloPage extends StatefulWidget {

  /// DATI CHE ARRIVANO
  final String titolo;
  final String descrizione;
  final List<String> immagini;
  final String prezzo;
  final List<String> taglie;
  final List<String> colori;

  /// COSTRUTTORE
  const ArticoloPage({
    super.key,
    required this.titolo,
    required this.descrizione,
    required this.immagini,
    required this.prezzo,
    required this.taglie,
    required this.colori,
  });

  @override
  State<ArticoloPage> createState() => _ArticoloPageState();
}

/// ============================
/// STATO
/// ============================
class _ArticoloPageState extends State<ArticoloPage> {

  int fotoSelezionata = 0;
  String? tagliaSelezionata;
  String? coloreSelezionato;

  /// ============================
  /// WHATSAPP
  /// ============================
  Future<void> apriWhatsApp() async {

    final messaggio = Uri.encodeComponent(
      'Ciao, sono interessata a:\n'
          '${widget.titolo}\n'
          'Prezzo: ${widget.prezzo}\n'
          'Taglia: ${tagliaSelezionata ?? "Non selezionata"}\n'
          'Colore: ${coloreSelezionato ?? "Non selezionato"}',
    );

    final url = Uri.parse(
      'https://wa.me/393911462781?text=$messaggio',
    );

    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  /// ============================
  /// UI
  /// ============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.titolo),
        backgroundColor: Colors.pink.shade200,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// FOTO
              SizedBox(
                height: 300,
                child: PageView.builder(
                  itemCount: widget.immagini.length,
                  onPageChanged: (index) {
                    setState(() {
                      fotoSelezionata = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      widget.immagini[index],
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              /// DESCRIZIONE
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(widget.descrizione),
              ),

              /// PREZZO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Prezzo: ${widget.prezzo}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// TAGLIE
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Taglia"),
              ),

              Wrap(
                children: widget.taglie.map((taglia) {
                  return ChoiceChip(
                    label: Text(taglia),
                    selected: tagliaSelezionata == taglia,
                    onSelected: (_) {
                      setState(() {
                        tagliaSelezionata = taglia;
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              /// COLORI
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Colore"),
              ),

              Wrap(
                children: widget.colori.map((colore) {
                  return ChoiceChip(
                    label: Text(colore),
                    selected: coloreSelezionato == colore,
                    onSelected: (_) {
                      setState(() {
                        coloreSelezionato = colore;
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              /// BOTTONE
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: apriWhatsApp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("Acquista"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

