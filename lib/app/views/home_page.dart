import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modulos/etapa.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final etapaCtrl = Get.put(EtapaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed Kart Fight'),
      ),
      body: Obx(() => etapaCtrl.existeEtapa.value
          ? ComEtapas(
              etapasLista: etapaCtrl.etapasInfo,
            )
          : const SemEtapas()),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.date_range_rounded),
          label: 'Etapas',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_motorsports_rounded), label: 'Pilotos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_rounded), label: 'Resultados'),
      ]),
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
  const ComEtapas({super.key, required this.etapasLista});

  final List<Etapa> etapasLista;
  @override
  Widget build(BuildContext context) {
    late List nomesMaster = Get.arguments['listaNomesMaster'];
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Etapas',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          /*...etapa.pilotos.map((e) => ListTile(
                onTap: () => {},
                title: Text('Etapa: ${etapa.etapaNumero}'),
                subtitle: Text('Data: ${etapa.data}'),
              )), */
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: etapasLista.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 8, bottom: 8, top: 10, right: 18),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red.shade700),
                      child: ListTile(
                        onTap: () {
                          print(nomesMaster);
                          Get.toNamed('/cardEtapa', arguments: {
                            'numeroEtapa': '${etapasLista[index].etapaNumero}',
                            'numeroMaster': '${etapasLista[index].master}',
                          });
                        },
                        leading: const Icon(
                          Icons.sports_motorsports_sharp,
                          size: 45,
                        ),
                        title: Text(
                          'Etapa ${etapasLista[index].etapaNumero}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Data ${etapasLista[index].data}',
                            style: const TextStyle(
                              fontSize: 16,
                            )),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onTap: () {
                            //EtapaController().removerEtapa(index);
                            etapasLista.removeAt(index);
                            if (etapasLista.isEmpty) {
                              EtapaController().existeEtapa.value = false;
                            }
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
