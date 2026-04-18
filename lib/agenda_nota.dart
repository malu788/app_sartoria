import 'package:flutter/material.dart';

/// =======================================
/// PAGINA AGENDA NOTE CLIENTE
/// =======================================

class AgendaNota extends StatelessWidget {
  const AgendaNota({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Agenda Nota Cliente"),
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// titolo pagina
            const Text(
              "Pagina Agenda Nota",
              style: TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 20),

            /// Nome Cliente
            const Text(
              "Nome Cliente",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// campo dove scrivere
            TextField(
              decoration: const InputDecoration(
                hintText: "Scrivi nome cliente",
                border: OutlineInputBorder(),
              ),
            ),

          ],
        ),
      ),


    );
  }
}
