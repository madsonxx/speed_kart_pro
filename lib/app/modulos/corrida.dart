class Corrida {
  late String data;
  late List<String> pilotos;

  var posicoes = {
    'primeiro': 20,
    'segundo': 16,
    'terceiro': 14,
    'quarto': 12,
    'quinto': 10,
    'sexto': 8,
    'setimo': 6,
    'oitavo': 4,
    'nono': 2,
    'decimo': 1
  };

  Corrida({required this.data, this.pilotos = const []});

  @override
  String toString() {
    // TODO: implement toString
    return 'Etapa';
  }
}
