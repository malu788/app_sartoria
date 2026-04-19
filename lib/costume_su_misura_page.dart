import 'package:flutter/material.dart';



class Abito {
  final String titolo;
  final List<String> immagini;

  Abito({required this.titolo, required this.immagini});
}

class CostumeSuMisuraPage extends StatelessWidget {
  CostumeSuMisuraPage({super.key});

  final List<Abito> abiti = [
    Abito(
      titolo: "Pantalone Palazzo",
      immagini: [
        "assets/icons/pantalonero.png",
        "assets/icons/panalone2.png",
        "assets/icons/pantalone4.png",
      ],
    ),
    Abito(
      titolo: "Vestito",
      immagini: [
        "assets/icons/vestitor.png",
        "assets/icons/vestito2.png",
        "assets/icons/vestitor3.png",
      ],
    ),
    Abito(
      titolo: "Giacca chanel",
      immagini: [
        "assets/icons/1000163120.png",
        "assets/icons/1000163121.png",
        "assets/icons/1000164205.png",
      ],
    ),
    Abito(
      titolo: "Giacca chanel",
      immagini: [
        "assets/icons/1000163620.png",
        "assets/icons/1000163768.png",
        "assets/icons/1000163769.png",
      ],
    ),

    Abito(
      titolo: "Gonna pantalone corta",
      immagini: [
        "assets/icons/1000164331.png",
        "assets/icons/1000164356.png",
        "assets/icons/1000165029.png",
      ],
    ),

    Abito(
      titolo: "Gonna verde",
      immagini: [
        "assets/icons/gonna.png",
        "assets/icons/gonna_profilo.png",
        "assets/icons/gonna3.png",
      ],
    ),

    Abito(
      titolo: "Abbigliamento",
      immagini: [
        "assets/icons/100.png",
        "assets/icons/1000164402.png",
        "assets/icons/1000164403.png",
      ],
    ),
    /// foto nini
    Abito(
      titolo: "Pantalone palazzo beige",
      immagini: [
        "assets/icons/palazzobeige1.png",
        "assets/icons/palazzobeige2.png",
        "assets/icons/palazzobeige3.png",
      ],
    ),
    Abito(
      titolo: "Vestito argento",
      immagini: [
        "assets/icons/abito1.png",
        "assets/icons/abito2.png",
        "assets/icons/abito3.png",
      ],
    ),
    Abito(
      titolo: "Pantalone con body allacciato",
      immagini: [
        "assets/icons/pantalonemaglietta1.png",
        "assets/icons/pantalonemaglietta2.png",
        "assets/icons/pantalonemaglitta3.png",
      ],
    ),
    Abito(
      titolo: "Collezione-Denim",
      immagini: [
        "assets/icons/chanel3.jpg",
        "assets/icons/chanel2.jpg",
        "assets/icons/chanel4.jpg",
        "assets/icons/chanel1.jpg",
      ],
    ),


    Abito(
      titolo: "l"
          "Completo Atelier Blu",
      immagini: [
        "assets/icons/Foto125.png",
        "assets/icons/foto126.png",
        "assets/icons/foto127.png",

      ],
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Abiti su misura")),
      body: ListView.builder(
        itemCount: abiti.length,
        itemBuilder: (context, index) {
          final abito = abiti[index];

          return Card(
            margin: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: abito.immagini.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ZoomPage(
                                images: abito.immagini,
                                initialIndex: i,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            abito.immagini[i],
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    abito.titolo,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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

class ZoomPage extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const ZoomPage({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        controller: PageController(initialPage: initialIndex),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: Image.asset(images[index]),
          );
        },
      ),
    );
  }
}

