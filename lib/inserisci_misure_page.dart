import 'package:flutter/material.dart';

class InserisciMisurePage extends StatefulWidget {
  const InserisciMisurePage({super.key});

  @override
  State<InserisciMisurePage> createState() => _InserisciMisurePageState();
}

class _InserisciMisurePageState extends State<InserisciMisurePage> {

  final colloController = TextEditingController();
  final senoController = TextEditingController();
  final vitaController = TextEditingController();
  final bacinoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inserisci Misure"),
        centerTitle: true,
      ),

      // 🔥 evita errore giallo (overflow)
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              const Text(
                "Inserisci le tue misure",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              _campo(colloController, "Collo (cm)"),
              const SizedBox(height: 15),

              _campo(senoController, "Seno (cm)"),
              const SizedBox(height: 15),

              _campo(vitaController, "Vita (cm)"),
              const SizedBox(height: 15),

              _campo(bacinoController, "Bacino (cm)"),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    double collo = double.tryParse(colloController.text) ?? 0;
                    double seno = double.tryParse(senoController.text) ?? 0;
                    double vita = double.tryParse(vitaController.text) ?? 0;
                    double bacino = double.tryParse(bacinoController.text) ?? 0;

                    Navigator.pop(context, {
                      "collo": collo,
                      "seno": seno,
                      "vita": vita,
                      "bacino": bacino,
                    });
                  },

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    "Continua",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              // ✅ spazio sotto
              const SizedBox(height: 60),

            ],
          ),
        ),
      ),
    );
  }

  // ✅ CAMPO INPUT (IMPORTANTISSIMO → risolve errore)
  Widget _campo(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
