import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/custom_text_field.dart';
import 'package:speed_kart_pro/app/modulos/pilotos.dart';

import '../controllers/pilotos_controller.dart';

class AddPilotos extends StatelessWidget {
  const AddPilotos({super.key});

  @override
  Widget build(BuildContext context) {
    final pilotoCtrl = Get.put(PilotosController());
    final size = MediaQuery.of(context).size;
    List<Pilotos> lista = [];

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
                        controllerTexto: pilotoCtrl.nomesMaster,
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
                          if (pilotoCtrl.nomesMaster.text.isNotEmpty) {
                            pilotoCtrl
                                .addPilotosMaster(pilotoCtrl.nomesMaster.text);
                            lista = pilotoCtrl.listaPilotosMaster;
                            print(lista);
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
                itemCount: pilotoCtrl.listaPilotosMaster.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(pilotoCtrl.listaPilotosMaster[index].nome),
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
          Get.toNamed('/addGraduados', arguments: {
            'listaNomesMaster': lista,
          });
          print(Get.arguments['listaNomeMaster']);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
