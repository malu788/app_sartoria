/// =======================================================
/// MODELLO CLIENTE
/// questo file serve per salvare i dati di un cliente
/// =======================================================

class Cliente {


  /// nome del cliente
  String nome;

  /// misura del collo
  double collo;

  /// misura del spalle
  double spalle;

  /// misura del spalla singula
  double spalla_singula;

  /// misura del seno
  double seno;

  /// misura della vita
  double vita;

  /// misura del bacino
  double bacino;

  /// taglia (S, M, L, XL ecc)
  String taglia;

  /// Nota
String nota;
  /// =======================================================
  /// FUNZIONE SALVA CLIENTE
  /// questa funzione aggiunge un cliente nella lista
  /// =======================================================



  /// =======================================================
  /// COSTRUTTORE
  /// serve per creare un nuovo cliente con le misure
  /// =======================================================

  Cliente({
    required this.nome,
    required this.collo,
    required this.spalla_singula,
    required this.spalle,
    required this.seno,
    required this.vita,
    required this.bacino,
    required this.taglia,
    required this.nota,


  });

}
/// =======================================================
/// LISTA CLIENTI
/// questa lista funzionerà come agenda sartoria
/// =======================================================

List<Cliente> listaClienti = [];

void salvaCliente(Cliente cliente) {

  /// aggiungiamo il cliente alla lista agenda
  listaClienti.add(cliente);

}
