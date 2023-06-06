import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/custom_text_field.dart';
import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modules/routes/app_pages.dart';

class AdicionarBaterias extends GetView<EtapaController> {
  const AdicionarBaterias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Etapa')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),

                  Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {},
                    ),
                  ),
                  CustomTextField(
                    legenda: 'Numero da Etapa',
                    controllerTexto: controller.numeroEtapaController,
                    dicaText: 'Numero etapa',
                    label: 'Numero etapa',
                    tipoTexto: TextInputType.number,
                    icon: Icons.numbers,
                  ),

                  //Formulário Data Etapa

                  CustomTextField(
                      legenda: 'Data da Etapa',
                      dicaText: 'Data Etapa',
                      tipoTexto: TextInputType.datetime,
                      controllerTexto: controller.dataEtapaController,
                      label: 'Data Etapa',
                      icon: Icons.calendar_month_outlined),

                  //Numero Pilotos Master
                  CustomTextField(
                    legenda: 'Nº de Corridas Preliminares Master',
                    dicaText: 'Master',
                    tipoTexto: TextInputType.datetime,
                    controllerTexto: controller.numeroMasterController,
                    label: 'Nº Baterias Master',
                    icon: Icons.people,
                    iconSize: 16,
                  ),

                  //Numero Pilotos Graduados

                  CustomTextField(
                    legenda: 'Nº de Corridas Preliminares Graduados',
                    dicaText: 'Graduados',
                    tipoTexto: TextInputType.datetime,
                    controllerTexto: controller.numeroGraduadosController,
                    label: 'Nº Baterias Graduados',
                    icon: Icons.people,
                    iconSize: 16,
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  //Botão Adicionar Etapa
                  Center(
                    child: MaterialButton(
                        color: Colors.blue,
                        child: const Text(
                          'Adicionar Pilotos',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.addIndex(
                              int.parse(controller.numeroEtapaController.text));

                          Get.toNamed(AppPages.addMaster);
                        }
                        /* () async {
                    await showInformationDialog(context);
                    etapaCtrl
                        .gravarEtapa(Etapa(etapaNumero: '05', data: '21/05/23'));
                    etapaCtrl.addProfissao(
                        'Piloto: ${etapaCtrl.etapa.value.pilotos.length + 1}');
                    Get.toNamed('/paginaInicial');
                  }, */
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
