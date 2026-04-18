import 'package:flutter/material.dart';
import 'disegno_vestito.dart';
import 'misure.dart';

/// ===============================
/// PAGINA ANTEPRIMA TAGLIA S
/// ===============================

class AnteprimaTagliaSPage extends StatelessWidget {
  const AnteprimaTagliaSPage({super.key});

  @override
  Widget build(BuildContext context) {

    /// ===============================
    /// MISURE TAGLIA S
    /// ===============================
    double collo =  40;
    double seno = 88; // seno taglia S
    double vita = 70; // vita taglia S
    double bacino = 96; // bacino taglia S

    return Scaffold(
      appBar: AppBar(
        title: const Text("Anteprima Taglia S"),
      ),


    );
  }
}


