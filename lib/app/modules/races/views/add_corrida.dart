import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/cosnt_texts.dart';

import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modules/pilotos.dart';

class AddRaceMaster extends GetView<EtapaController> {
  const AddRaceMaster({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int indexEtapa = controller.indexEtapa.value;
    int indexCorrida = controller.indexCorrida.value;
    int indexBateria = controller.indexBateria.value;

    List<Pilotos> dropDownValueList = [];
    List<String> dropDownValueListNames = [];
    for (int i = 0;
        i < controller.listaEtapas[indexEtapa].pilotosMasterEtapa.length;
        i++) {
      dropDownValueList.add(
          controller.listaEtapas[indexEtapa].pilotosMasterEtapa[indexBateria]);
    }
    /* var dropdownValue =
        controller.listaEtapas[index].pilotosMasterEtapa.first.obs;
 */
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Resultado'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Adicione os nomes as posições'),
            Obx(
              () => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller
                    .listaEtapas[indexEtapa].pilotosMasterEtapa.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posicoes[index]),
                    trailing: Obx(
                      () => DropdownButton<Pilotos>(
                        value: dropDownValueList[index],
                        isExpanded: false,
                        items: controller
                            .listaEtapas[controller.indexCorrida.value]
                            .pilotosMasterEtapa
                            .map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e.nome),
                          );
                        }).toList(),
                        onChanged: (Pilotos? value) {
                          dropDownValueList[index] = value!;
                          for (int i = 0; i < dropDownValueList.length; i++) {
                            print(dropDownValueList[i].nome);
                            dropDownValueListNames.insert(
                                i, dropDownValueList[i].nome);
                            controller.encontrarPiloto(
                                indexEtapa, dropDownValueList[i].nome);
                            print(controller.indexPiloto.value);
                            controller.adicionarPosicaoMaster(indexEtapa,
                                controller.indexPiloto.value, '${i++}');
                            print(controller
                                .listaEtapas[indexEtapa]
                                .pilotosMasterEtapa[
                                    controller.indexPiloto.value]
                                .posicoes);
                          }
                          print(dropDownValueListNames);
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          print(dropDownValueListNames);
          controller.adicionarCorridaMaster(
              controller.indexEtapa.value,
              controller.indexBateria.value,
              controller.indexCorrida.value,
              dropDownValueListNames);
        },
        /*  onPressed: () {
          for (int i = 0;
        i < controller.listaEtapas[index].pilotosMasterEtapa.length;
        i++) {
      dropDownValueListNames
          .add(controller.indexEtapa[index].pilotosMasterEtapa[i]);
    }
          controller.adicionarCorridaMaster(controller.indexEtapa.value, controller.indexBateria.value, controller.indexCorrida.value, nomes)
        }, */
      ),
    );
  }
}
