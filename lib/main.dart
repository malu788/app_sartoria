import 'package:flutter/material.dart';
import 'riparazione_page.dart';
import 'misure_page.dart';
import 'nota_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ===============================
// IMPORT DELLE PAGINE
// ===============================

import 'danza_costumi_page.dart';
import 'chi_siamo.dart';
import 'costume_su_misura_page.dart';
import 'cliente.dart';
import 'package:firebase_core/firebase_core.dart';




class AgendaNota extends StatelessWidget {
  const AgendaNota({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Agenda "),
      ),

      body: ListView.builder(

        itemCount: listaClienti.length,

        itemBuilder: (context, index) {

          final cliente = listaClienti[index];

          return ListTile(

            title: Text(cliente.nome),

            subtitle: Text(
                "Collo: ${cliente.collo}\n "
                "spalle: ${cliente.spalle}\n "
                    "Spalla singula: ${cliente.spalla_singula}\n "

                    "Seno: ${cliente.seno}\n "
                    "Vita: ${cliente.vita}\n "
                    "Bacino: ${cliente.bacino}\n"
            ),

          );

        },

      ),

    );

  }

}














//////////////////////////////////////////////////
Future<void> main() async {
  runApp(const MyApp());
}

// ===============================
// APP PRINCIPALE
// ===============================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MLV ',

      // TEMA APP
      theme: ThemeData(
        primaryColor: const Color(0xFFF4A3BF),
        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4A3BF),
          foregroundColor: Colors.white,
        ),
      ),

      home: const HomePage(),
    );
  }
}

// ===============================
// HOME PAGE
// ===============================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ===============================
      // APP BAR
      // ===============================
      appBar: AppBar(
        title: const Text('MLV '),
        centerTitle: true,
      ),

      // ===============================
      // CONTENUTO
      // ===============================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // ===============================
            // LOGO
            // ===============================
            Image.asset(
              'assets/icons/Logo.png',
              height: 120,
            ),

            const SizedBox(height: 20),

            // ===============================
            // SOTTOTITOLO
            // ===============================
            const Text(
              'Sartoria per abiti su misura, danza e costumi',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 30),

            // ===============================
            // BOTTONI MENU
            // ===============================

            // COSTUME SU MISURA
            _menuButton(
              context,
              testo: 'Costume su misura',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CostumeSuMisuraPage(),
                  ),
                );
              },
            ),

            // RIPARAZIONI
            _menuButton(
              context,
              testo: 'Riparazioni sartoriali',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  RiparazionePage(),
                  ),
                );
              },
            ),

            // DANZA E COSTUMI
            _menuButton(
              context,
              testo: 'Danza e costumi',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DanzaCostumiPage(),
                  ),
                );
              },
            ),

            // Copia questo blocco per il pulsante Agenda Nota
            _menuButton(
              context,
              testo: 'Agenda Nota',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotaPage()),
                );
              },
            ),
            const SizedBox(height: 12), // Spazio tra i bottoni




            ////////////////////////////////////////////
            //BUTTONE MISURE
            _menuButton(
              context,
              testo: 'Guida alle misure',
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  MisurePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 12),


            // CHI SIAMO
            _menuButton(
              context,
              testo: 'Chi siamo / Contatti',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChiSiamoPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 50),


          ],


        ),
      ),
    );
  }
}

// ===============================
// BOTTONE RIUTILIZZABILE
// ===============================
Widget _menuButton(
    BuildContext context, {
      required String testo,
      required VoidCallback onTap,
    })
{
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),

    child: SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF4A3BF),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        onPressed: onTap,

        child: Text(
          testo,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
