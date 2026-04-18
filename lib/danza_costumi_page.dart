import 'package:flutter/material.dart';

import 'abiti_spettacol_page.dart';
import 'abiti_sportivi_page.dart';
import 'costume_su_misura_page.dart';

class DanzaCostumiPage extends StatelessWidget {
  const DanzaCostumiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danza e Costumi'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // 1️⃣ DANZA E SPETTACOLO
          ListTile(
            title: const Text('Danza e spettacolo'),
            subtitle: const Text('Costumi danza, saggi, spettacoli'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AbitiSpettacoloPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 8),

          // 2️⃣ ABITI SPORTIVI
          ListTile(
            title: const Text('Abiti sportivi'),
            subtitle: const Text('Danza sportiva, gare, allenamenti'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AbitiSportiviPage(),
                ),
              );
            },
          ),

          const SizedBox(height: 8),

          // 3️⃣ COSTUMI SU MISURA
          ListTile(
            title: const Text('Costumi su misura'),
            subtitle: const Text('Creazioni personalizzate'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  CostumeSuMisuraPage(),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
