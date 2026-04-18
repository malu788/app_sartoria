import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChiSiamoPage extends StatefulWidget {
  const ChiSiamoPage({super.key});

  @override
  State<ChiSiamoPage> createState() => _ChiSiamoPageState();
}

class _ChiSiamoPageState extends State<ChiSiamoPage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 🔥 WhatsApp
  Future<void> apriWhatsApp() async {
    final Uri url = Uri.parse("https://wa.me/393911462781");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Errore apertura WhatsApp";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi siamo"),
      ),

      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                /// TITOLO
                const Text(
                  "Chi siamo",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/icons/panalone2.png',
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// TESTO
                const Text(
                  "MLVSartoria nasce da una passione profonda per la sartoria, costruita giorno dopo giorno con impegno, sacrificio e amore per i dettagli.\n\n"
                      "È il risultato di un sogno che cresce, si trasforma e prende vita attraverso ogni misura, ogni disegno e ogni creazione.\n\n"
                      "Dietro questa app non c’è solo lavoro, ma una storia fatta di fede, famiglia, sostegno e fiducia.\n\n"
                      "Nulla di tutto questo sarebbe stato possibile senza Dio, senza l’appoggio costante di mio marito, che ha sempre creduto in me, anche nei momenti più difficili, e senza mia figlia, fonte continua di ispirazione e forza.\n\n"
                  " Un ringraziamento speciale a mia mamma, sarta, da cui è iniziato tutto: da bambina la aiutavo nel suo lavoro, ed è lì che ho imparato ad amare questa arte, fatta di pazienza, cura e passione."
                  "Questo progetto non è solo mio: è la continuazione di una storia che vive ancora oggi. 💖"

                      "Questo progetto non è solo mio: è nostro. 💖",

                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 40),

                /// CONTATTI
                const Text(
                  "Contatti",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const Text("📧 mlvalenciaga24@gmail.com"),
                const SizedBox(height: 10),
                const Text("📞 391 146 2781"),

                const SizedBox(height: 30),

                /// BOTTONE WHATSAPP
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: apriWhatsApp,
                    icon: const Icon(Icons.chat),
                    label: const Text("Contattaci su WhatsApp"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),

                /// SPAZIO VUOTO SOTTO (IMPORTANTE)
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
