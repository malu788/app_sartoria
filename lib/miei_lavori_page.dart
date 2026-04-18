import 'package:flutter/material.dart';

// ===============================
// PAGINA "I MIEI LAVORI"
// ===============================
class MieiLavoriPage extends StatelessWidget {
  const MieiLavoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lavori = [
      {
        'titolo': 'Abito da cerimonia',
        'descrizione': 'Realizzato su misura per evento speciale',
        'immagine': 'assets/icons/lavoro1.png',
      },
      {
        'titolo': 'Costume da danza',
        'descrizione': 'Creato per saggio di danza',
        'immagine': 'assets/icons/lavoro2.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('I miei lavori'),
        backgroundColor: const Color(0xFFF4A3BF),
      ),///
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: lavori.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.70, // 👈 QUESTA È LA CHIAVE

          ///
        ),
        itemBuilder: (context, index) {
          final lavoro = lavori[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FOTO DEL LAVORO
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    lavoro['immagine']!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lavoro['titolo']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        lavoro['descrizione']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}