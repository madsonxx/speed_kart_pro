import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/modules/corrida.dart';
import 'package:speed_kart_pro/app/modules/etapa.dart';
import 'package:speed_kart_pro/app/modules/pilotos.dart';

class EtapaController extends GetxController {
  RxList<Etapa> etapasInfo = RxList<Etapa>([]);
  RxList<Pilotos> listaPilotosGraduados = RxList<Pilotos>([]);
  RxList<Pilotos> listaPilotosMaster = RxList<Pilotos>([]);
  RxList<Pilotos> listaEtapaGraduados = RxList<Pilotos>([]);
  RxList<Pilotos> listaEtapaMaster = RxList<Pilotos>([]);
  RxList<Corrida> corridas = RxList<Corrida>([]);
  TextEditingController numeroEtapaController = TextEditingController();
  TextEditingController dataEtapaController = TextEditingController();
  TextEditingController numeroMasterController = TextEditingController();
  TextEditingController numeroGraduadosController = TextEditingController();
  TextEditingController quantidadePilotosMaster = TextEditingController();
  TextEditingController quantidadePilotosGraduados = TextEditingController();
  TextEditingController nomesMaster = TextEditingController();
  TextEditingController nomesGraduados = TextEditingController();
  TextEditingController posController = TextEditingController();

  var existeEtapa = false.obs;
  //var indexCorrida = 0.obs;
  int indexEtapa = 0;
  //var indexEtapa = 0.obs;

  late Etapa etapas;
  var itemCount = 0.obs;
  var nMaster = 0.obs;
  var nGraduados = 0.obs;
  late Pilotos pilotos;
  var existemPilotos = false.obs;
  var itemCountMaster = 0.obs;
  var itemCountGraduados = 0.obs;
  var pontuacaoEtapa = 0.obs;
  var pontuacaoGeral = 0.obs;
  late Corrida corrida;
  var existemPontos = true.obs;

  void addPilotosMaster(String nomes) {
    pilotos = Pilotos(nome: nomes);
    listaPilotosMaster.add(pilotos);
    itemCountMaster.value = listaPilotosMaster.length;
    existemPilotos.value = true;
    nomesMaster.clear();
    update();
  }

  void clear() {
    nomesMaster.clear();
    nomesGraduados.clear();
  }

  void addPilotosGraduados(String nomes) {
    pilotos = Pilotos(nome: nomes);
    listaPilotosGraduados.add(pilotos);
    itemCountMaster.value = listaPilotosGraduados.length;
    existemPilotos.value = true;
    nomesGraduados.clear();
    update();
  }

/*   void gravarEtapa(Etapa pEtapa) {
    existeEtapa.value = true;
    etapa.value = pEtapa;
  }
 */
  void addEtapa(
      int etapaNumber, String data, int numeroMaster, int numeroGraduados) {
    etapas = Etapa(
        etapaNumero: etapaNumber,
        data: data,
        master: numeroMaster,
        graduados: numeroGraduados);
    etapasInfo.add(etapas);
    itemCount.value = etapasInfo.length;
    existeEtapa.value = true;

    numeroEtapaController.clear();
    dataEtapaController.clear();
    numeroMasterController.clear();
    numeroGraduadosController.clear();
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

  void updateIindex(var cardID) {
    indexEtapa = etapasInfo[cardID].etapaNumero;
    nMaster.value = etapasInfo[cardID].master;
    nGraduados.value = etapasInfo[cardID].graduados;
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