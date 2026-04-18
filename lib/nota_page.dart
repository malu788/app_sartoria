import 'package:flutter/material.dart';
import 'archivio_page.dart';
import 'database_helper.dart';
import 'istruzioni_page.dart';
import 'Cartamodellopage.dart';

class NotaPage extends StatefulWidget {
  final Map<String, dynamic>? clientePerModifica;
  const NotaPage({super.key, this.clientePerModifica});

  @override
  State<NotaPage> createState() => _NotaPageState();
}

class _NotaPageState extends State<NotaPage> {
  // --- CONTROLLER ---
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _colloController = TextEditingController();
  final TextEditingController _manicaLungaController = TextEditingController();
  final TextEditingController _manicaCortaController = TextEditingController();
  final TextEditingController _spalleTotalController = TextEditingController();
  final TextEditingController _senoController = TextEditingController();
  final TextEditingController _separazioneController = TextEditingController();
  final TextEditingController _altezzaBustoController = TextEditingController();
  final TextEditingController _talleDelanteroController = TextEditingController();
  final TextEditingController _talleTraseroController = TextEditingController();
  final TextEditingController _vitaController = TextEditingController();
  final TextEditingController _bacinoController = TextEditingController();
  final TextEditingController _altezzaBacinoController = TextEditingController();
  final TextEditingController _lunghezzaTotaleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  double _resCollo = 0; double _resSeno = 0; double _resSep = 0;
  double _resVita = 0; double _resBacino = 0;

  @override
  void initState() {
    super.initState();
    if (widget.clientePerModifica != null) {
      final c = widget.clientePerModifica!;
      _nomeController.text = c['nome']?.toString() ?? '';
      _colloController.text = c['collo']?.toString() ?? '';
      _manicaLungaController.text = c['manica_lunga']?.toString() ?? '';
      _manicaCortaController.text = c['manica_corta']?.toString() ?? '';
      _spalleTotalController.text = c['spalle_total']?.toString() ?? '';
      _senoController.text = c['seno']?.toString() ?? '';
      _separazioneController.text = c['separazione_busto']?.toString() ?? '';
      _altezzaBustoController.text = c['altezza_busto']?.toString() ?? '';
      _talleDelanteroController.text = c['talle_delantero']?.toString() ?? '';
      _talleTraseroController.text = c['talle_trasero']?.toString() ?? '';
      _vitaController.text = c['vita']?.toString() ?? '';
      _bacinoController.text = c['bacino']?.toString() ?? '';
      _altezzaBacinoController.text = c['altezza_bacino']?.toString() ?? '';
      _lunghezzaTotaleController.text = c['lunghezza_totale']?.toString() ?? '';
      _noteController.text = c['note']?.toString() ?? '';
      _aggiornaCalcoli();
    }
  }

  void _aggiornaCalcoli() {
    setState(() {
      _resCollo = (double.tryParse(_colloController.text) ?? 0) / 6;
      _resSeno = (double.tryParse(_senoController.text) ?? 0) / 4;
      _resSep = (double.tryParse(_separazioneController.text) ?? 0) / 2;
      _resVita = (double.tryParse(_vitaController.text) ?? 0) / 4;
      _resBacino = (double.tryParse(_bacinoController.text) ?? 0) / 4;
    });
  }

  void _salvaDati() async {
    if (_nomeController.text.isEmpty) return;
    Map<String, dynamic> dati = {
      'nome': _nomeController.text, 'collo': _colloController.text,
      'manica_lunga': _manicaLungaController.text, 'manica_corta': _manicaCortaController.text,
      'spalle_total': _spalleTotalController.text, 'seno': _senoController.text,
      'separazione_busto': _separazioneController.text, 'altezza_busto': _altezzaBustoController.text,
      'talle_delantero': _talleDelanteroController.text, 'talle_trasero': _talleTraseroController.text,
      'vita': _vitaController.text, 'bacino': _bacinoController.text,
      'altezza_bacino': _altezzaBacinoController.text, 'lunghezza_totale': _lunghezzaTotaleController.text,
      'note': _noteController.text,
    };
    if (widget.clientePerModifica != null) {
      dati['id'] = widget.clientePerModifica!['id'];
      await DatabaseHelper.instance.aggiorna(dati);
    } else {
      await DatabaseHelper.instance.inserisci(dati);
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Misure Sartoria"), backgroundColor: const Color(0xFFE9A9BC)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // --- 1. FOTO CON ZOOM ---
            const Text("DIAGRAMMA TECNICO", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              height: 300,
              decoration: BoxDecoration(border: Border.all(color: Colors.pink.shade100), borderRadius: BorderRadius.circular(15)),
              child: InteractiveViewer(
                maxScale: 5.0,
                child: Image.asset('assets/icons/misura.png', fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 20),

            // --- 2. SPAZIO PER LE ISTRUZIONI ---

            const SizedBox(height: 25),

            // --- 3. CAMPI MISURE ---
            _buildCampo("Nome Cliente", _nomeController, isNum: false),
            _buildCalcolo("Collo (cm)", _colloController, 6, (v) => _aggiornaCalcoli(), _resCollo),
            _buildCampo("Manica Lunga (cm)", _manicaLungaController),
            _buildCampo("Manica Corta (cm)", _manicaCortaController),
            _buildCampo("Spalle total (cm)", _spalleTotalController),
            _buildCalcolo("Circonferenza seno (cm)", _senoController, 4, (v) => _aggiornaCalcoli(), _resSeno),
            _buildCalcolo("Separazione Busto (cm)", _separazioneController, 2, (v) => _aggiornaCalcoli(), _resSep),
            _buildCampo("Altezza busto (cm)", _altezzaBustoController),
            _buildCampo("Talle delantero (cm)", _talleDelanteroController),
            _buildCampo("Talle trasero (cm)", _talleTraseroController),
            _buildCalcolo("Circonferenza vita (cm)", _vitaController, 4, (v) => _aggiornaCalcoli(), _resVita),
            _buildCalcolo("Circonferenza Bacino (cm)", _bacinoController, 4, (v) => _aggiornaCalcoli(), _resBacino),
            _buildCampo("Altezza bacino (cm)", _altezzaBacinoController),
            _buildCampo("Lunghezza total (cm)", _lunghezzaTotaleController),
            _buildCampo("Note", _noteController, isNum: false),

            const SizedBox(height: 30),
// 1. BOTTONE SALVA SCHEDA (Rosa)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE9A9BC),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: _salvaDati,
              icon: const Icon(Icons.save, color: Colors.white),
              label: const Text("SALVA SCHEDA",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 15),

            // 2. BOTTONE ARCHIVIO (Bianco con bordo rosa)
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE9A9BC), width: 2),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ArchivioPage()));
              },
              icon: const Icon(Icons.inventory_2_outlined, color: Color(0xFFE9A9BC)),
              label: const Text("VAI ALL'ARCHIVIO",
                  style: TextStyle(color: Color(0xFFE9A9BC), fontSize: 16, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 15),

            // 3. BOTTONE CONTINUA PER ISTRUZIONI (Ora Rosa!)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE9A9BC),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IstruzioniPage()),
                );
              },
              icon: const Icon(Icons.help_outline, color: Colors.white),
              label: const Text("CONTINUA PER ISTRUZIONI",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 15),  /// CAMBIO 10

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE9A9BC),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartamodelloPage()));
              },
              icon: const Icon(Icons.architecture, color: Colors.white),
              label: const Text("GENERA CARTAMODELLO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),

            /// FINISCE BUCARTAMODELLO
          ],
        ),
      ),
    );
  }

  // --- FUNZIONI DI SUPPORTO (Riparate per togliere l'errore) ---
  Widget _buildCampo(String label, TextEditingController cont, {bool isNum = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          TextField(
            controller: cont,
            keyboardType: isNum ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              filled: true, fillColor: Colors.grey[100],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalcolo(String label, TextEditingController cont, int div, Function(String) onCh, double res) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          TextField(
            controller: cont,
            onChanged: onCh,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true, fillColor: Colors.grey[100],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            ),
          ),
          if (res > 0)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("✂️ Risultato /$div = ${res.toStringAsFixed(2)} cm",
                  style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }
}

