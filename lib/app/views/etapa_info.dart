import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/etapas_controller.dart';
import '../modulos/etapa.dart';

class EtapaInfo extends StatefulWidget {
  EtapaInfo({super.key});

  @override
  State<EtapaInfo> createState() => _EtapaInfoState();
}

class _EtapaInfoState extends State<EtapaInfo> {
  @override
  Widget build(BuildContext context) {
    final etapaCtrl = Get.put(EtapaController());

    //final Etapa etapa;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Etapa info'),
      ),
      body: Obx(() => etapaCtrl.existeEtapa.value
          ? ComEtapas(
              etapas: etapaCtrl.etapasInfo,
            )
          : const SemEtapas()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/addEtapa'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SemEtapas extends StatelessWidget {
  const SemEtapas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sem Etapas adicionadas'),
    );
  }
}

class ComEtapas extends StatelessWidget {
  const ComEtapas({super.key, required this.etapas});

  final List<Etapa> etapas;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resumo Geral',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Divider(),
          const ListTile(title: Text('Etapa: ')),
          const ListTile(title: Text('Data: ')),
          const Text('Etapas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
        ],
      ),
    );
  }
}
