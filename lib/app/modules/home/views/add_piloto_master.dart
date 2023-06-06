import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/custom_text_field.dart';
import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';

import 'package:speed_kart_pro/app/modules/routes/app_pages.dart';

class AddPilotos extends GetWidget<EtapaController> {
  const AddPilotos({super.key});

  @override
  Widget build(BuildContext context) {
    //final pilotoCtrl = Get.put(PilotosController());
    final size = MediaQuery.of(context).size;
    //List<Pilotos> lista = [];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Pilotos Master'),
        leading: BackButton(
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(children: [
            const Padding(
                padding: EdgeInsets.only(
              bottom: 24,
              right: 12,
            )),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: CustomTextField(
                        legenda: 'Participantes da Master',
                        dicaText: 'Nomes',
                        controllerTexto: controller.nomesMaster,
                        label: 'Adicionar Nomes',
                        icon: Icons.sports_motorsports_sharp)),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: InkWell(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 0.5, color: Colors.white)),
                      child: IconButton(
                        onPressed: () {
                          if (controller.nomesMaster.text.isNotEmpty) {
                            controller.listaBoolMaster.add(true);
                            controller
                                .addPilotosMaster(controller.nomesMaster.text);
                            controller.addPilotosMasterEtapa(
                                controller.nomesMaster.text);

                            print(controller.listaPilotosMasterEtapa);
                          }
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Obx(
              () => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.listaPilotosMasterGeral.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => CheckboxListTile(
                      value: controller.listaBoolMaster[index] ?? false,
                      title:
                          Text(controller.listaPilotosMasterGeral[index].nome),
                      onChanged: (value) {
                        controller.listaBoolMaster[index] = value!;
                        controller.listaBoolMaster[index]
                            ? controller.addPilotosMasterEtapa(
                                controller.listaPilotosMasterGeral[index].nome)
                            : controller.removePilotosMasterEtapa(
                                controller.listaPilotosMasterGeral[index].nome);
                        print(index);
                        print(controller.listaBoolMaster[index]);
                        print(controller.listaPilotosMasterEtapa);
                      },
                    ),
                  );
                },
              ),
            ),

            /* SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                onPressed: () {
                  Get.toNamed('/addGraduados');
                },
                child: const Text('Adicionar Pilotos'),
              ),
            ) */
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(controller.listaPilotosMasterEtapa);
          Get.toNamed(AppPages.addGraduados);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
