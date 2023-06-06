import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/list_posicoes.dart';
import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modules/pilotos.dart';

class AddRaceMaster extends GetView<EtapaController> {
  const AddRaceMaster({super.key});

  @override
  Widget build(BuildContext context) {
    int index = controller.indexCorrida.value;
    var dropdownValue =
        controller.listaEtapas[index].pilotosMasterEtapa.first.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Resultado'),
      ),
      body: SizedBox(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Adicione os nomes as posições'),
          Expanded(
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:
                    controller.listaEtapas[index].pilotosMasterEtapa.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posicoes[index]),
                    trailing: Obx(
                      () => DropdownButton<Pilotos>(
                        value: dropdownValue.value,
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
                          dropdownValue.value = value!;
                          print(value);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
