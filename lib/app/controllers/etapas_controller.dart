import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/modules/corrida.dart';
import 'package:speed_kart_pro/app/modules/etapa.dart';
import 'package:speed_kart_pro/app/modules/pilotos.dart';

class EtapaController extends GetxController {
  RxList<Etapa> listaEtapas = RxList<Etapa>([]);
  RxList<Pilotos> listaPilotosGraduadosGeral = RxList<Pilotos>([]);
  RxList<Pilotos> listaPilotosMasterGeral = RxList<Pilotos>([]);

  RxList<List<Pilotos>> listaPilotosGraduados = RxList<List<Pilotos>>([]);
  RxList<List<Pilotos>> listaPilotosMaster = RxList<List<Pilotos>>([]);

  RxList<Pilotos> listaPilotosMasterEtapa = RxList<Pilotos>([]);
  RxList<Pilotos> listaPilotosGraduadosEtapa = RxList<Pilotos>([]);

  RxList<Pilotos> listaEtapaMaster = RxList<Pilotos>([]);
  RxList<Corrida> corridas = RxList<Corrida>([]);

  RxList listaBoolMaster = RxList([]);
  RxList listaBoolGraduados = RxList([]);

  TextEditingController numeroEtapaController = TextEditingController();
  TextEditingController dataEtapaController = TextEditingController();
  TextEditingController numeroMasterController = TextEditingController();
  TextEditingController numeroGraduadosController = TextEditingController();

  TextEditingController nomesMaster = TextEditingController();
  TextEditingController nomesGraduados = TextEditingController();
  TextEditingController posController = TextEditingController();

  TextEditingController popUpNumeroParticipantesEtapa = TextEditingController();

  var existeEtapa = false.obs;
  var indexBateria = 0.obs;
  var indexEtapa = 0.obs;
  var indexCorrida = 0.obs;
  var numeroEtapa = 0.obs;
  var numeroBateria = 0.obs;

  late Etapa etapas;
  late Pilotos pilotos;
  late Corrida corrida;

  RxList numeroParticipantesCorridaMaster = RxList([]);
  RxList numeroParticipantesCorridaGraduados = RxList([]);

  var itemCount = 0.obs;
  var nMaster = 0.obs;
  var nGraduados = 0.obs;
  var numeroParticipantesBateria = 0.obs;

  var existemPilotos = false.obs;
  var itemCountMaster = 0.obs;
  var itemCountGraduados = 0.obs;
  var pontuacaoEtapa = 0.obs;
  var pontuacaoGeral = 0.obs;

  var nomeParametro = ''.obs;

  var existemPontos = true.obs;
  RxBool isChecked = false.obs;

  void addPilotosMaster(String nomes) {
    pilotos = Pilotos(nome: nomes);
    listaPilotosMasterGeral.add(pilotos);
    itemCountMaster.value = listaPilotosMasterGeral.length;

    update();
  }

  void addPilotosGraduados(String nomes) {
    pilotos = Pilotos(nome: nomes);
    listaPilotosGraduadosGeral.add(pilotos);
    itemCountGraduados.value = listaPilotosGraduadosGeral.length;
    nomesGraduados.clear();
    update();
  }

  void addPilotosMasterEtapa(String nomes) {
    pilotos = Pilotos(nome: nomes);
    listaPilotosMasterEtapa.add(pilotos);
    existemPilotos.value = true;
    nomesMaster.clear();
    update();
  }

  void removePilotosMasterEtapa(String nome) {
    int index =
        listaPilotosMasterEtapa.indexWhere((Pilotos) => Pilotos.nome == nome);
    listaPilotosMasterEtapa.removeAt(index);
    update();
  }

  void addPilotosGraduadosEtapa(String nomes) {
    pilotos = Pilotos(nome: nomes);
    listaPilotosGraduadosEtapa.add(pilotos);
    existemPilotos.value = true;
    nomesGraduados.clear();
    update();
  }

  void removePilotosGraduadosEtapa(String nome) {
    int index = listaPilotosGraduadosEtapa
        .indexWhere((Pilotos) => Pilotos.nome == nome);
    listaPilotosGraduadosEtapa.removeAt(index);
    update();
  }

/*   void gravarEtapa(Etapa pEtapa) {
    existeEtapa.value = true;
    etapa.value = pEtapa;
  }
 */
  void addEtapa(
      int etapaNumber,
      String data,
      int numeroMaster,
      int numeroGraduados,
      List<Pilotos> nomesMaster,
      List<Pilotos> nomesGraduados) {
    etapas = Etapa(
      etapaNumero: etapaNumber,
      data: data,
      master: numeroMaster,
      graduados: numeroGraduados,
      pilotosGraduadosEtapa: nomesGraduados,
      pilotosMasterEtapa: nomesMaster,
    );
    listaEtapas.add(etapas);
    itemCount.value = listaEtapas.length;
    existeEtapa.value = true;

    numeroEtapaController.clear();
    dataEtapaController.clear();
    numeroMasterController.clear();
    numeroGraduadosController.clear();
  }

  void removerEtapa(int index) {
    listaEtapas.removeAt(index);
    itemCount.value = listaEtapas.length;
    if (listaEtapas.isEmpty) {
      existeEtapa.update((val) {
        false;
      });
    }
  }

  void adicionarCorridaMaster(
      int indexEtapa, int indexBateria, int indexCorrida, List<String> nomes) {
    int index =
        listaEtapas.indexWhere((Etapa) => Etapa.etapaNumero == indexEtapa);
    listaEtapas[index].corridasMasterEtapa.add(Corrida(
        corridaInfo: 'Bateria $indexBateria, Corrida $indexCorrida',
        classificacao: nomes));
  }

  void updateIndexEtapa(int numeroEtapa) {
    indexEtapa.value = numeroEtapa;
  }

  void updateIndexBateria(int numeroBateria) {
    indexBateria.value = numeroBateria;
  }

  void updateIindexCorrida(var idxCorrida) {
    indexCorrida.value = idxCorrida;
  }

  void adicionarNumeroPilotosBateria(int nParticipantes) {
    numeroParticipantesBateria.value = nParticipantes;
  }

  void encontrarEtapaNumero(var cardID) {
    numeroEtapa.value = listaEtapas[cardID].etapaNumero;
    nMaster.value = listaEtapas[cardID].master;
    nGraduados.value = listaEtapas[cardID].graduados;
  }

  void encontrarBateriaNumero(int nBateria) {
    numeroBateria.value = nBateria + 1;
  }
/*   void findIndex(int etapaID) {
    indexCorrida.value =
        etapasInfo.indexWhere((Etapa) => Etapa.etapaNumero == '$etapaID');
    print(indexCorrida.value);
  } */
}



/*   void mudarIdade(String data) {
    etapa.update((val) {
      val!.data = data;
    });
  } */

/*   void addProfissao(String profissa) {
    etapa.update((val) {
      val!.pilotos = [...val.pilotos, profissa];
    });
  } */

  /*
  var existeEtapa = false.obs;
  late Etapa etapas;
  var itemCount = 0.obs;

   void gravarEtapa(Etapa pEtapa) {
    existeEtapa.value = true;
    etapa.value = pEtapa;
  }

  void addEtapa(String etapaNumber, String data) {
    etapas = Etapa(etapaNumero: etapaNumber, data: data);
    etapasInfo.add(etapas);
    itemCount.value = etapasInfo.length;
    existeEtapa.value = true;
    numeroEtapaController.clear();
    dataEtapaController.clear();
  }

  void removerEtapa(int index) {
    etapasInfo.removeAt(index);
    itemCount.value = etapasInfo.length;
    if (etapasInfo.isEmpty) {
      existeEtapa.update((val) {
        false;
      });
    }
  }
} */