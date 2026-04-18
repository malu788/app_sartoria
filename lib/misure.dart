/// ===============================
/// CLASSE MISURE CLIENTE
/// ===============================
/// questa classe contiene tutte le misure
/// che servono per creare il cartamodello

class Misure {
  /// misure collo
  final double collo;

  /// misure  manica corta

  double corta;

  /// circonferenza torace
  double torace;

  /// circonferenza vita
  double vita;

  /// circonferenza bacino
  double bacino;

  /// altezza torace
  double altezzaTorace;

  /// altezza vita
  double altezzaVita;

  /// altezza bacino
  double altezzaBacino;

  /// costruttore della classe
  Misure({
    required this. collo,
    required this.corta,

    required this.torace,
    required this.vita,
    required this.bacino,
    required this.altezzaTorace,
    required this.altezzaVita,
    required this.altezzaBacino,
  });
}