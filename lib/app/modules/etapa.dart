class Etapa {
  late int etapaNumero;
  late String data;
  late int master;
  late int graduados;
  late List<String> pilotos;

  Etapa(
      {required this.etapaNumero,
      required this.data,
      required this.graduados,
      required this.master,
      this.pilotos = const []});

  @override
  String toString() {
    // TODO: implement toString
    return 'Etapa $etapaNumero, data $data, Numero de participantes Master $master,Numero de participantes Master $graduados ';
  }
}
