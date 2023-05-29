import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/modulos/etapa.dart';

class EtapaController extends GetxController {
  RxList<Etapa> etapasInfo = RxList<Etapa>([]);
  TextEditingController numeroEtapaController = TextEditingController();
  TextEditingController dataEtapaController = TextEditingController();
  TextEditingController numeroMasterController = TextEditingController();
  TextEditingController numeroGraduadosController = TextEditingController();

  var existeEtapa = false.obs;
  late Etapa etapas;
  var itemCount = 0.obs;
  var nMaster = 0.obs;
  var nGraduados = 0.obs;

/*   void gravarEtapa(Etapa pEtapa) {
    existeEtapa.value = true;
    etapa.value = pEtapa;
  }
 */
  void addEtapa(String etapaNumber, String data, String numeroMaster,
      String numeroGraduados) {
    etapas = Etapa(
        etapaNumero: etapaNumber,
        data: data,
        master: numeroMaster,
        graduados: numeroGraduados);
    etapasInfo.add(etapas);
    itemCount.value = etapasInfo.length;
    nMaster.value = int.parse(numeroMaster);
    nGraduados.value = int.parse(numeroGraduados);
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