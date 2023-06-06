import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modules/routes/app_pages.dart';

class FirstTab extends GetView<EtapaController> {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    //late Etapa etapa = etapaCtrl.etapasInfo[nMaster];

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.nMaster.value,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 8, bottom: 8, top: 10, right: 18),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red.shade700),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(AppPages.cardCorrida);
                      },
                      leading: const Icon(
                        Icons.sports_score,
                        size: 45,
                      ),
                      title: Text(
                        'Bateria ${index + 1}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Resultados',
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 50,
                  ),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.listaPilotosMasterEtapa.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.listaPilotosMasterEtapa[index].nome),
              );
            },
          ),
        ],
      ),
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