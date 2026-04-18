import 'package:flutter/material.dart';

/// ============================
/// PAGINA GALLERIA FOTO SPETTACOLO
/// ============================
class FotoSpettacoloPage extends StatefulWidget {

  // ============================
  // LISTA IMMAGINI
  // ============================
  final List<String> immagini;
  final int
  indiceIniziale;

  const FotoSpettacoloPage({
    super.key,
    required this.immagini,
    required this.indiceIniziale,
  });

  @override
  State<FotoSpettacoloPage> createState() => _FotoSpettacoloPageState();
}

class _FotoSpettacoloPageState extends State<FotoSpettacoloPage> {


  // ============================
  // CONTROLLA PAGINA CORRENTE
  // ============================
  late PageController
  controller;

  int paginaCorrente = 0;
  // INIZIALIZA CONTROLLER
  @override
  void initState() {
    super.initState();

    paginaCorrente = widget.indiceIniziale;

    controller = PageController(
      initialPage: widget.indiceIniziale,
    );
  }
// NUOVO CODICE
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ============================
      // SFONDO NERO ELEGANTE
      // ============================
      backgroundColor: const Color(0xFFF2F2F2),

      appBar: AppBar(
        backgroundColor: const Color(0xFF6A1B2D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Galleria',
          style: TextStyle(color: Colors.white),
        ),
      ),

      // ============================
      // CONTENUTO GALLERIA
      // ============================
      body: Stack(
        children: [

          // ============================
          // PAGEVIEW (SCORRIMENTO FOTO)
          // ============================
          PageView.builder(
            controller:
            controller,

            itemCount: widget.immagini.length,
            onPageChanged: (index) {
              setState(() {
                paginaCorrente = index;
              });
            },
            itemBuilder: (context, index) {
              return Center(
                // SOSTITUICE  ARROTONDARE LEGGERAMENT LA FOTTO GALLRR
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16), // angoli morbidi
                  child: Image.asset(
                    widget.immagini[index],
                    fit: BoxFit.contain,
                  ),
                ),

              );
            },
          ),

          // ============================
          // INDICATORE FOTO (1 / 3)
          // ============================
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '${paginaCorrente + 1} / ${widget.immagini.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
