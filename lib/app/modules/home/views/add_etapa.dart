import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/custom_text_field.dart';
import 'package:speed_kart_pro/app/modules/home/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modules/routes/app_pages.dart';

class AddEtapa extends GetView<EtapaController> {
  const AddEtapa({super.key});

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

/*   Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController textEditingController =
              TextEditingController();
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: textEditingController,
                    validator: (value) {
                      return value!.isNotEmpty ? null : 'Invalid Field';
                    },
                    decoration:
                        const InputDecoration(hintText: 'Enter some Text'),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Okay'))
                ],
              ),
            ),
          );
        });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Etapa'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controllerTexto: controller.numeroEtapaController,
              dicaText: 'Numero etapa',
              label: 'Numero etapa',
              tipoTexto: TextInputType.number,
              icon: Icons.numbers,
            ),

            //Formulário Data Etapa
            CustomTextField(
                dicaText: 'Data Etapa',
                tipoTexto: TextInputType.datetime,
                controllerTexto: controller.dataEtapaController,
                label: 'Data Etapa',
                icon: Icons.calendar_month_outlined),

            //Numero Pilotos Master
            CustomTextField(
                dicaText: 'Master',
                tipoTexto: TextInputType.datetime,
                controllerTexto: controller.numeroMasterController,
                label: 'Nº Baterias Master',
                icon: Icons.people),

            //Numero Pilotos Graduados
            CustomTextField(
                dicaText: 'Graduados',
                tipoTexto: TextInputType.datetime,
                controllerTexto: controller.numeroGraduadosController,
                label: 'Nº Baterias Graduados',
                icon: Icons.people),

            //Botão Adicionar Etapa
            MaterialButton(
                color: Colors.blue,
                child: const Text(
                  'Adicionar Pilotos',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  controller.addEtapa(
                      controller.numeroEtapaController.text,
                      controller.dataEtapaController.text,
                      controller.numeroMasterController.text,
                      controller.numeroGraduadosController.text);
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
          ],
        )),
      ),
    );
  }
}
