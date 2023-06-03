import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';

class RaceCard extends GetView<EtapaController> {
  const RaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Corrida 1'), //add variavel numero corrida.
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                    'Sortear Karts',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //Adicionar karts e sortear eles com os nomes dos pilotos do lado, e os karts de troca em baixo, em ordem.
                  }),
              //Condicional Tem resultado Sim> Mostrar resultados. Não>Mostrar participantes com checkbox pra escolher quem vai correr.
              const Text('Resultados: '),
              const Text('Primeiro: '),
              const Text('Segundo: '),
              const Text('Terceiro: '),
              //Botão Adicionar Punição

              const Text('Participantes: '),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.listaPilotosMaster.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.listaPilotosMaster[index].nome),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
