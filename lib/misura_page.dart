// ===============================
// 📄 PAGINA INSERIMENTO MISURE
// ===============================

// Importiamo il materiale grafico di Flutter
import 'package:flutter/material.dart';

// Creiamo la classe della pagina
class MisurePage extends StatelessWidget {

  // Costruttore base
  const MisurePage({super.key});

  // Metodo che costruisce la schermata
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // Barra in alto
      appBar: AppBar(
        title: const Text("Inserisci Misure"),
        backgroundColor: Colors.purple,
      ),

      // Corpo della pagina
      body: const Center(
        child: Text(
          "Qui inseriremo le misure",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}