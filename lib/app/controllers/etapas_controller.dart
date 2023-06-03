import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/modules/corrida.dart';
import 'package:speed_kart_pro/app/modules/etapa.dart';
import 'package:speed_kart_pro/app/modules/pilotos.dart';

class EtapaController extends GetxController {
  RxList<Etapa> etapasInfo = RxList<Etapa>([]);
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

  var existeEtapa = false.obs;
  //var indexCorrida = 0.obs;
  int indexEtapa = 0;
  //var indexEtapa = 0.obs;

  late Etapa etapas;
  late Pilotos pilotos;
  late Corrida corrida;

  var itemCount = 0.obs;
  var nMaster = 0.obs;
  var nGraduados = 0.obs;

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
    itemCountMaster.value = listaPilotosGraduadosGeral.length;
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
    print(index);
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

  void addNome(String nome) {
    nomeParametro.value = nome;
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

  void addIndex(int numeroEtapa) {
    indexEtapa = numeroEtapa;
  }

  void updateIindex(var cardID) {
    indexEtapa = etapasInfo[cardID].etapaNumero;
    nMaster.value = etapasInfo[cardID].master;
    nGraduados.value = etapasInfo[cardID].graduados;
  }

  void sortearBaterias() {
    //etapasInfo[indexEtapa].length nMaster.value
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