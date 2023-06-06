import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modules/routes/app_pages.dart';

class HomeScreen extends GetView<EtapaController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed Kart Fight'),
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Etapas',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            /*...etapa.pilotos.map((e) => ListTile(
                onTap: () => {},
                title: Text('Etapa: ${etapa.etapaNumero}'),
                subtitle: Text('Data: ${etapa.data}'),
              )), */
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.listaEtapas.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 8, bottom: 8, top: 10, right: 18),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red.shade500),
                        child: ListTile(
                          onTap: () {
                            controller.updateIindex(index);
                            print(controller
                                .listaEtapas[index].pilotosMasterEtapa);
                            //controller.findIndex(index);
                            Get.toNamed(AppPages.cardEtapa);
                          },
                          leading: const Icon(
                            Icons.sports_score,
                            size: 45,
                          ),
                          title: Text(
                            'Etapa ${controller.listaEtapas[index].etapaNumero}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                              Text('Data ${controller.listaEtapas[index].data}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  )),
                          trailing: GestureDetector(
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onTap: () {
                              //EtapaController().removerEtapa(index);
                              controller.listaEtapas.removeAt(index);
                              if (controller.listaEtapas.isEmpty) {
                                EtapaController().existeEtapa.value = false;
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.date_range_rounded),
          label: 'Etapas',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_motorsports_rounded), label: 'Pilotos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_rounded), label: 'Resultados'),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
        onPressed: () => Get.toNamed(AppPages.addEtapa),
        child: const Icon(Icons.add),
      ),
    );
  }
}
