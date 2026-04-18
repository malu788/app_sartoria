import 'package:flutter/material.dart';
import 'foto_spettacolo_page.dart';
import 'articolo_page.dart';

/// ============================
/// PAGINA: ABITI DA SPETTACOLO
/// SOLO FOTO (NO ACQUISTO)
/// ============================
class AbitiSpettacoloPage extends StatelessWidget {
  const AbitiSpettacoloPage({super.key});

  @override
  Widget build(BuildContext context) {

    // ============================
    // LISTA FOTO GALLERIA SPETTACOLO
    // ============================
    final List<String> immaginiSpettacolo = [
      'assets/icons/vestito.png',
      'assets/icons/vestito4.png',
      'assets/icons/vestito5.png',
      'assets/icons/fotom.png',
      'assets/icons/foto1.png',
      'assets/icons/lavoro7.png',
    ];

    // ============================
    // STRUTTURA PAGINA
    // ============================
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abiti da spettacolo'),
        backgroundColor:
        Colors.pink.shade200,
      ),

      // ============================
      // GALLERIA FOTO
      // ============================
      body: GridView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: immaginiSpettacolo.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),

        itemBuilder: (context, index) {

          return GestureDetector(

            // 👉 CLICK → apre galleria
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute( // cabbio queste codice
                  builder: (context) => FotoSpettacoloPage(
                    immagini: immaginiSpettacolo,
                    indiceIniziale: index,
                  ),
                ),
              );
            },

            // ============================
            // FOTO
            // ============================
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                immaginiSpettacolo[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
