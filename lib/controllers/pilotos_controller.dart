import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modulos/pilotos.dart';

class PilotosController {
  RxList<Pilotos> listaPilotosGraduados = RxList<Pilotos>();
  RxList<Pilotos> listaPilotosMaster = RxList<Pilotos>();
  RxList<Pilotos> listaEtapaGraduados = RxList<Pilotos>();
  RxList<Pilotos> listaEtapaMaster = RxList<Pilotos>();
  TextEditingController quantidadePilotosMaster = TextEditingController();
  TextEditingController quantidadePilotosGraduados = TextEditingController();
  TextEditingController nomesMaster = TextEditingController();
  TextEditingController nomesGraduados = TextEditingController();

  late Pilotos pilotos;
  var existemPilotos = false.obs;
  var itemCountMaster = 0.obs;
  var itemCountGraduados = 0.obs;
  var pontuacaoEtapa = 0.obs;
  var pontuacaoGeral = 0.obs;

  void addPilotosMaster(String nomes) {
    pilotos = Pilotos(nome: nomes);
    listaPilotosMaster.add(pilotos);
    itemCountMaster.value = listaPilotosMaster.length;
    existemPilotos.value = true;
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
  }
}

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