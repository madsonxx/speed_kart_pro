import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modules/routes/app_pages.dart';

class RaceCard extends GetView<EtapaController> {
  const RaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    @override
    Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Adicione o numero de participantes'),
              content: TextField(
                keyboardType: TextInputType.number,
                controller: controller.popUpNumeroParticipantesEtapa,
                //autofocus: true,
                decoration: InputDecoration(hintText: 'Nº de Participantes'),
              ),
              actions: [
                TextButton(
                  child: Text('Adicionar'),
                  onPressed: () {
                    controller.numeroParticipantesBateria.value = int.parse(
                        controller.popUpNumeroParticipantesEtapa.text);
                    print(controller.popUpNumeroParticipantesEtapa.text);
                    print(controller.numeroParticipantesBateria);
                    Get.toNamed(AppPages.addCorrida);
                  },
                )
              ],
            ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Bateria ${controller.numeroBateria.value}'), //add variavel numero corrida.
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              //Condicional Tem resultado Sim> Mostrar resultados. Não>Mostrar participantes com checkbox pra escolher quem vai correr.
              const Text('Resultados: '),
              Row(
                children: [
                  const Text('Bateria Regular'),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                      color: Colors.blue,
                      child: const Text(
                        'Adicionar resultado',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        controller.updateIindexCorrida(0);

                        //openDialog();
                        Get.toNamed(AppPages.addCorrida);

                        print(controller.indexCorrida.value);
                        //Adicionar karts e sortear eles com os nomes dos pilotos do lado, e os karts de troca em baixo, em ordem.
                      }),
                ],
              ),
              SizedBox(
                height: 300,
              ),
              Row(
                children: [
                  const Text('Bateria Invertida'),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                      color: Colors.blue,
                      child: const Text(
                        'Adicionar resultado',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        controller.updateIindexCorrida(1);
                        openDialog();

                        print(controller.indexCorrida.value);
                        //Adicionar karts e sortear eles com os nomes dos pilotos do lado, e os karts de troca em baixo, em ordem.
                      }),
                ],
              ),

              /* ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.listaPilotosMaster.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.listaPilotosMaster[index].nome),
                  );
                },
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
