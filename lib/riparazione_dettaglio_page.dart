import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// ============================
/// PAGINA RIPARAZIONE DETTAGLIO
/// ============================
class RiparazioneDettaglioPage extends StatefulWidget {
  const RiparazioneDettaglioPage({super.key});

  @override
  State<RiparazioneDettaglioPage> createState() =>
      _RiparazioneDettaglioPageState();
}

/// ============================
/// STATO DELLA PAGINA
/// ============================
class _RiparazioneDettaglioPageState
    extends State<RiparazioneDettaglioPage> {

  /// ============================
  /// VARIABILI
  /// ============================

  bool domicilio = false;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController indirizzoController = TextEditingController();

  /// ============================
  /// FUNZIONE WHATSAPP
  /// ============================
  Future<void> inviaWhatsApp() async {

    // 👉 CONTROLLO CAMPI
    if (nomeController.text.trim().isEmpty ||
        telefonoController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Inserisci nome e telefono"),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    // 👉 CREA MESSAGGIO
    final messaggio = Uri.encodeComponent(
      'Richiesta riparazione\n\n'
          'Nome: ${nomeController.text}\n'
          'Telefono: ${telefonoController.text}\n'
          'Domicilio: ${domicilio ? "SI" : "NO"}\n'
          'Indirizzo: ${domicilio ? indirizzoController.text : "NO"}',
    );

    final url = Uri.parse(
      'https://wa.me/393911462781?text=$messaggio',
    );

    // 👉 APRE WHATSAPP
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  /// ============================
  /// LIBERA MEMORIA
  /// ============================
  @override
  void dispose() {
    nomeController.dispose();
    telefonoController.dispose();
    indirizzoController.dispose();
    super.dispose();
  }

  /// ============================
  /// INTERFACCIA
  /// ============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// APP BAR
      appBar: AppBar(
        title: const Text("Riparazione"),
        backgroundColor: Colors.pink.shade200,
      ),

      /// CONTENUTO
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITOLO
              const Text(
                "Richiedi una riparazione",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// NOME
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              /// TELEFONO
              TextField(
                controller: telefonoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Telefono",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              /// SWITCH DOMICILIO
              SwitchListTile(
                title: const Text("Servizio a domicilio"),
                value: domicilio,
                onChanged: (value) {
                  setState(() {
                    domicilio = value;
                  });
                },
              ),

              /// INDIRIZZO (solo se domicilio)
              if (domicilio) ...[
                const SizedBox(height: 15),

                TextField(
                  controller: indirizzoController,
                  decoration: const InputDecoration(
                    labelText: "Indirizzo",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],

              const SizedBox(height: 30),

              /// BOTTONE INVIA
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),

                  onPressed: inviaWhatsApp,

                  child: const Text(
                    "Invia richiesta",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
