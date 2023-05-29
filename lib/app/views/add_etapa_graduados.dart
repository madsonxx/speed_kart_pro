import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pilotos_controller.dart';

class EtapaGraduados extends StatelessWidget {
  const EtapaGraduados({super.key});

  @override
  Widget build(BuildContext context) {
    final pilotoCtrl = Get.put(PilotosController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('ilotos Graduados'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          TextField(
            controller: pilotoCtrl.nomesGraduados,
          ),
          Obx(() => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: pilotoCtrl.listaPilotosGraduados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(pilotoCtrl.listaPilotosGraduados[index].nome),
                  );
                },
              ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (pilotoCtrl.nomesMaster.text.isNotEmpty) {
            pilotoCtrl.addPilotosGraduados(pilotoCtrl.nomesMaster.text);
          }
        },
        child: Text('Ir Para Pilotos Graduados'),
      ),
    );
  }
}
