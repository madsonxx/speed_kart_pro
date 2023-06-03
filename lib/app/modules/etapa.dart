import 'package:speed_kart_pro/app/modules/pilotos.dart';

class Etapa {
  late int etapaNumero;
  late String data;
  late int master;
  late int graduados;
  late List<Pilotos> pilotosMasterEtapa;
  late List<Pilotos> pilotosGraduadosEtapa;

  Etapa(
      {required this.etapaNumero,
      required this.data,
      required this.graduados,
      required this.master,
      required this.pilotosMasterEtapa,
      required this.pilotosGraduadosEtapa});

  @override
  String toString() {
    // TODO: implement toString
    return 'Etapa $etapaNumero, data $data, Numero de participantes Master $master,Numero de participantes Master $graduados ';
  }
}
