import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

/// ===========================================
/// PAGINA RIPARAZIONE
/// ===========================================
class RiparazionePage extends StatefulWidget {
  const RiparazionePage({super.key});

  @override
  State<RiparazionePage> createState() => _RiparazionePageState();
}

class _RiparazionePageState extends State<RiparazionePage> {

  /// ===========================================
  /// CONTROLLER CAMPI (input utente)
  /// ===========================================
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController descrizioneController = TextEditingController();
  final TextEditingController indirizzoController = TextEditingController();

  /// ===========================================
  /// SWITCH DOMICILIO
  /// ===========================================
  bool servizioDomicilio = false;

  /// ===========================================
  /// FOTO
  /// ===========================================
  File? fotoSelezionata;

  /// ===========================================
  /// SCEGLI FOTO
  /// ===========================================
  Future<void> scegliFoto() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        fotoSelezionata = File(pickedFile.path);
      });
    }
  }

  /// ===========================================
  /// INVIO WHATSAPP
  /// ===========================================
  Future<void> inviaRichiesta() async {
    /// INVIO WHATSAPP (FUNZIONA SEMPRE)
    Future<void> inviaRichiesta() async {
      final messaggio = Uri.encodeComponent(
          "Richiesta riparazione\n\n"
              "Nome: ${nomeController.text}\n"
              "Telefono: ${telefonoController.text}"
      );

      final url = Uri.parse(
        "https://wa.me/393911462781?text=$messaggio",
      );

      try {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Errore apertura WhatsApp")),
        );
      }
    }
    /// CONTROLLO CAMPI OBBLIGATORI
    if (nomeController.text.isEmpty || telefonoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Inserisci nome e telefono")),
      );
      return;
    }

    /// MESSAGGIO
    final messaggio = Uri.encodeComponent(
        "RICHIESTA RIPARAZIONE\n\n"
            "Nome: ${nomeController.text}\n"
            "Telefono: ${telefonoController.text}\n"
            "Descrizione: ${descrizioneController.text}\n"
            "Domicilio: ${servizioDomicilio ? "SI" : "NO"}\n"
            "Indirizzo: ${servizioDomicilio ? indirizzoController.text : "Nessuno"}"
    );

    final url = Uri.parse(
      "https://wa.me/393911462781?text=$messaggio",
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Errore apertura WhatsApp")),
      );
    }
  }

  /// ===========================================
  /// UI
  /// ===========================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riparazione"),
        backgroundColor: Colors.pink,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ===========================
            /// TITOLO
            /// ===========================
            const Text(
              "Richiedi una riparazione",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            /// ===========================
            /// NOME
            /// ===========================
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: "Nome *",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            /// ===========================
            /// TELEFONO
            /// ===========================
            TextField(
              controller: telefonoController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Telefono *",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            /// ===========================
            /// DESCRIZIONE
            /// ===========================
            TextField(
              controller: descrizioneController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Descrivi la riparazione",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            /// ===========================
            /// SWITCH DOMICILIO
            /// ===========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Servizio a domicilio"),
                Switch(
                  value: servizioDomicilio,
                  onChanged: (value) {
                    setState(() {
                      servizioDomicilio = value;
                    });
                  },
                ),
              ],
            ),

            /// ===========================
            /// INDIRIZZO (solo se ON)
            /// ===========================
            if (servizioDomicilio) ...[
              const SizedBox(height: 10),

              TextField(
                controller: indirizzoController,
                decoration: const InputDecoration(
                  labelText: "Indirizzo",
                  border: OutlineInputBorder(),
                ),
              ),
            ],

            const SizedBox(height: 20),

            /// ===========================
            /// FOTO
            /// ===========================
            ElevatedButton.icon(
              onPressed: scegliFoto,
              icon: const Icon(Icons.image),
              label: const Text("Aggiungi foto"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            /// ===========================
            /// PREVIEW FOTO
            /// ===========================
            if (fotoSelezionata != null)
              Image.file(
                fotoSelezionata!,
                height: 150,
              ),

            const SizedBox(height: 30),

            /// ===========================
            /// BOTTONE INVIA
            /// ===========================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: inviaRichiesta, // 👈 ATTIVO
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Invia richiesta",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
