import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:speed_kart_pro/app/controllers/etapas_controller.dart';
import 'package:speed_kart_pro/app/modules/races/views/first_tab.dart';
import 'package:speed_kart_pro/app/modules/races/views/second_tab.dart';

class CardEtapa extends GetView<EtapaController> {
  const CardEtapa({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<EtapaController>();
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Etapa ${controller.indexEtapa}')),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: const BoxDecoration(),
              height: size.height,
              child: const Column(mainAxisSize: MainAxisSize.max, children: [
                TabBar(
                  tabs: [
                    Tab(
                      text: 'Master',
                      icon: Icon(
                        Icons.home,
                      ),
                    ),
                    Tab(
                      text: 'Graduados',
                      icon: Icon(Icons.home),
                    ),
                  ],
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: TabBarView(children: [
                      FirstTab(),
                      SecondTab(),
                    ])),
              ]),
            ),
          ),
        ));
  }
}
