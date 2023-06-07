import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/components/custom_text_field.dart';
import 'package:speed_kart_pro/app/components/theme/dark_theme.dart';
import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Adicionar Etapa'),
        leading: BackButton(
          onPressed: () => Get.back(),
        ),
      ),
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
                          controller.updateIndexEtapa(
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
