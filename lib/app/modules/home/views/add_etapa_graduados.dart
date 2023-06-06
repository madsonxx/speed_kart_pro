import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/custom_text_field.dart';
import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modules/routes/app_pages.dart';

class EtapaGraduados extends GetWidget<EtapaController> {
  const EtapaGraduados({super.key});

  @override
  Widget build(BuildContext context) {
    //final pilotoCtrl = Get.put(PilotosController());
    final size = MediaQuery.of(context).size;
    //List<Pilotos> lista = [];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Pilotos Graduados'),
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
                        legenda: 'Participantes graduados',
                        dicaText: 'Nomes',
                        controllerTexto: controller.nomesGraduados,
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
                          if (controller.nomesGraduados.text.isNotEmpty) {
                            controller.listaBoolGraduados.add(true);
                            controller.addPilotosGraduados(
                                controller.nomesGraduados.text);
                            controller.addPilotosGraduadosEtapa(
                                controller.nomesGraduados.text);

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
                itemCount: controller.listaPilotosGraduadosGeral.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => CheckboxListTile(
                      value: controller.listaBoolGraduados[index] ?? false,
                      title: Text(
                          controller.listaPilotosGraduadosGeral[index].nome),
                      onChanged: (value) {
                        controller.listaBoolGraduados[index] = value!;
                        controller.listaBoolGraduados[index]
                            ? controller.addPilotosGraduadosEtapa(controller
                                .listaPilotosGraduadosGeral[index].nome)
                            : controller.removePilotosGraduadosEtapa(controller
                                .listaPilotosGraduadosGeral[index].nome);
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
          controller.addEtapa(
              int.parse(controller.numeroEtapaController.text),
              controller.dataEtapaController.text,
              int.parse(controller.numeroMasterController.text),
              int.parse(controller.numeroGraduadosController.text),
              controller.listaPilotosMasterEtapa,
              controller.listaPilotosGraduadosEtapa);
/*           for (var i = 0; i < controller.listaBoolMaster.length; i++) {
            controller.listaBoolMaster[i] = false;
          }
          for (var i = 0; i < controller.listaBoolGraduados.length; i++) {
            controller.listaBoolGraduados[i] = false;
          } */
          Get.toNamed(AppPages.homeRoute);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
