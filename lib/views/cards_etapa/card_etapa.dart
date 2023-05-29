import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/controllers/corridas_controller.dart';
import 'package:speed_kart_pro/controllers/pilotos_controller.dart';
import 'package:speed_kart_pro/views/cards_etapa/tabs/first_tab.dart';
import 'package:speed_kart_pro/views/cards_etapa/tabs/second_tab.dart';

class CardEtapa extends StatelessWidget {
  const CardEtapa({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    late String etapa = Get.arguments['numeroEtapa'];

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(child: Text('Etapa ${etapa}')),
          ),
          body: Container(
            decoration: const BoxDecoration(),
            height: size.height,
            child: const Column(children: [
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
              Expanded(child: TabBarView(children: [FirstTab(), SecondTab()])),
            ]),
          ),
        ));
  }
}
