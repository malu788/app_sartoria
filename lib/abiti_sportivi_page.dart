import 'package:flutter/material.dart';
import 'articolo_page.dart';


/// ============================
/// PAGINA: ABITI SPORTIVI
/// ============================
class AbitiSportiviPage extends StatelessWidget {
const AbitiSportiviPage({super.key});

@override
Widget build(BuildContext context) {

/// ============================
/// LISTA PRODOTTI (DATI)
/// ============================
final List<Map<String, dynamic>> lavori = [

/// ============================
/// ARTICOLO 1
/// ============================
{
'titolo': 'Completo sportivo su misura',

'immagini': [
'assets/icons/lavoro1.png',
'assets/icons/lavoro2.png',
'assets/icons/lavoro6.png',
],

'descrizione':
'Completo sportivo su misura in jersey, elasticizzato, morbido e modellante.',

'prezzo': '€__',

'taglie': ['S', 'M', 'L', 'XL'],
  /// Colore
  'colori': ['Nero', 'Roso', 'Bianco'],
},

/// ============================
/// ARTICOLO 2
/// ============================
{
'titolo': 'Completo crop top + pantalone, su misura',

'immagini': [
'assets/icons/lavoro3.png',
'assets/icons/lavoro5.png',
'assets/icons/jersey.png',
],

'descrizione':
'Completo elasticizzato, comodo e modellante.',

'prezzo': '__',

'taglie': ['S', 'M', 'L'],
  'colori': ['Nero', 'Roso', 'Bianco'],
},

/// ============================
/// ARTICOLO 3
/// ============================
{
'titolo': 'Completo licra',

'immagini': [
'assets/icons/1000163127.png',
'assets/icons/1000163122.png',
  'assets/icons/1000163126.png'
],

'descrizione':
'Abito elasticizzato per danza sportiva.',

'prezzo': '__',

'taglie': ['S', 'M', 'L', 'XL'],

  'colori': ['Nero', 'Roso', 'Bianco'],
},
  {
    'titolo': 'Leggins sportivo donna',

    'immagini': [
      'assets/icons/foto120.jpg',
      'assets/icons/foto121.jpg',
      'assets/icons/foto123.jpg'
    ],

    'descrizione':
    'leggis sportivi vita alta, realizzati in tessuto elastico.',

    'prezzo': '__',

    'taglie': ['S', 'M', 'L', 'XL'],

    'colori': ['Nero', 'Roso', 'Bianco'],
  },



];

/// ============================
/// UI PAGINA
/// ============================
return Scaffold(

/// APPBAR
appBar: AppBar(
title: const Text('Abiti sportivi'),
backgroundColor: Colors.pink.shade200,
),

/// ============================
/// GRIGLIA PRODOTTI
/// ============================
body: GridView.builder(
padding: const EdgeInsets.all(16),
itemCount: lavori.length,

/// GRID
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 12,
mainAxisSpacing: 12,
childAspectRatio: 0.65,
),

/// COSTRUISCE OGNI CARD
itemBuilder: (context, index) {

/// PRENDE ARTICOLO
final lavoro = lavori[index];

/// LISTA IMMAGINI
final List<String> immagini =
List<String>.from(lavoro['immagini']);

return GestureDetector(

/// ============================
/// CLICK → VAI ALLA PAGINA DETTAGLIO
/// ============================
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => ArticoloPage(
titolo: lavoro['titolo'],
descrizione: lavoro['descrizione'],
immagini: immagini,
prezzo: lavoro['prezzo'],
taglie: List<String>.from(lavoro['taglie']),
  colori:
    List<String>.from(lavoro['colori']),
),
),
);
},

/// ============================
/// CARD PRODOTTO

child: Card(
elevation: 4,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),

child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

/// ============================
/// FOTO
/// ============================
Expanded(
child: ClipRRect(
borderRadius: const BorderRadius.vertical(
top: Radius.circular(16),
),

child: Image.asset(
immagini[0],
width: double.infinity,
fit: BoxFit.cover,
),
),
),

const SizedBox(height: 8),

/// ============================
/// TITOLO
/// ============================
Padding(
padding: const EdgeInsets.symmetric(horizontal: 8),
child: Text(
lavoro['titolo'],
maxLines: 2,
overflow:
  TextOverflow.ellipsis,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 14,
),
),
),

const SizedBox(height: 4),

/// ============================
/// PREZZO
/// ============================
Padding(
padding: const EdgeInsets.symmetric(horizontal: 8),
child: Text(
'Prezzo: ${lavoro['prezzo']}',
maxLines: 1,
overflow:
  TextOverflow.ellipsis,
style: const TextStyle(
fontSize: 15,
fontWeight: FontWeight.bold,
color: Colors.green,
),
),
),

const SizedBox(height: 8),
],
),
),
);
},
),
);
}
}
