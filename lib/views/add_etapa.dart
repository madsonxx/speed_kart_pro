import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/controllers/etapas_controller.dart';

import '../controllers/pilotos_controller.dart';
import '../src/components/custom_text_field.dart';

class AddEtapa extends StatefulWidget {
  const AddEtapa({super.key});

  @override
  State<AddEtapa> createState() => _AddEtapaState();
}

class _AddEtapaState extends State<AddEtapa> {
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
    final etapaCtrl = Get.put(EtapaController());
    final pilotoCtrl = Get.put(PilotosController());

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
              controllerTexto: etapaCtrl.numeroEtapaController,
              dicaText: 'Numero etapa',
              label: 'Numero etapa',
              tipoTexto: TextInputType.number,
              icon: Icons.numbers,
            ),

            //Formulário Data Etapa
            CustomTextField(
                dicaText: 'Data Etapa',
                tipoTexto: TextInputType.datetime,
                controllerTexto: etapaCtrl.dataEtapaController,
                label: 'Data Etapa',
                icon: Icons.calendar_month_outlined),

            //Numero Pilotos Master
            CustomTextField(
                dicaText: 'Master',
                tipoTexto: TextInputType.datetime,
                controllerTexto: etapaCtrl.numeroMasterController,
                label: 'Nº Baterias Master',
                icon: Icons.people),

            //Numero Pilotos Graduados
            CustomTextField(
                dicaText: 'Graduados',
                tipoTexto: TextInputType.datetime,
                controllerTexto: etapaCtrl.numeroGraduadosController,
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
                  etapaCtrl.addEtapa(
                      etapaCtrl.numeroEtapaController.text,
                      etapaCtrl.dataEtapaController.text,
                      etapaCtrl.numeroMasterController.text,
                      etapaCtrl.numeroGraduadosController.text);
                  Get.toNamed('/addMaster');
                  pilotoCtrl.clear();
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
