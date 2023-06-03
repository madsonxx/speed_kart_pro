import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/controllers/corridas_controller.dart';
import 'package:speed_kart_pro/app/controllers/pilotos_controller.dart';
import 'package:speed_kart_pro/app/modules/home/controllers/etapas_controller.dart';

class FirstTab extends GetView<PilotosController> {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    //late Etapa etapa = etapaCtrl.etapasInfo[nMaster];
    Get.find<EtapaController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: EtapaController().nMaster.value,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 8, bottom: 8, top: 10, right: 18),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red.shade700),
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.sports_motorsports_sharp,
                      size: 45,
                    ),
                    title: Text(
                      'Corrida ${index + 1}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Resultados}',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    trailing: GestureDetector(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Center(
          child: MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Adicionar Pilotos',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {}),
        ),
        Obx(
          () => controller.existemPilotos.value
              ? Column(
                  children: [
                    Text(
                      'Pódio: ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('Primeiro: '),
                    Text('Segundo: '),
                    Text('Terceiro: '),
                  ],
                )
              : const SizedBox(
                  height: 50,
                ),
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: controller.listaPilotosMaster.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.listaPilotosMaster[index].nome),
            );
          },
        ),
      ],
    );
  }
}

/*         Obx(
          () => ListView.builder(
            itemCount: nMaster,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 8, bottom: 8, top: 10, right: 18),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red.shade700),
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.sports_motorsports_sharp,
                      size: 45,
                    ),
                    title: Text(
                      'Corrida ${index}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Resultados}',
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                    trailing: GestureDetector(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              );
            }),
          ),
        ), */