class Etapa {
  late String etapaNumero;
  late String data;
  late String master;
  late String graduados;
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
