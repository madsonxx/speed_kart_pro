import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/custom_text_field.dart';
import 'package:speed_kart_pro/app/modules/pilotos.dart';
import 'package:speed_kart_pro/app/modules/routes/app_pages.dart';

import '../../../controllers/pilotos_controller.dart';

class AddPilotos extends GetWidget<PilotosController> {
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
                        dicaText: 'Nomes',
                        controllerTexto: controller.nomesMaster,
                        label: 'Adicionar Nomes',
                        icon: Icons.person)),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
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
                            controller
                                .addPilotosMaster(controller.nomesMaster.text);
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
                itemCount: controller.listaPilotosMaster.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.listaPilotosMaster[index].nome),
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
          print(controller.listaPilotosMaster);
          Get.toNamed(AppPages.addGraduados, arguments: {
            'listaNomesMaster': controller.listaPilotosMaster,
          });
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
