import 'package:get/get.dart';
import 'package:speed_kart_pro/app/modules/etapas/views/card_etapa.dart';
import 'package:speed_kart_pro/app/modules/home/bindings/home_bindings.dart';
import 'package:speed_kart_pro/app/modules/home/views/add_etapa.dart';
import 'package:speed_kart_pro/app/modules/home/views/add_etapa_graduados.dart';
import 'package:speed_kart_pro/app/modules/home/views/add_piloto_master.dart';
import 'package:speed_kart_pro/app/modules/home/views/home_page.dart';

import 'package:speed_kart_pro/app/modules/races/views/card_corrida.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const homeRoute = Routes.HOME;
  static const addEtapa = Routes.ADDETAPA;
  static const addMaster = Routes.ADDMASTER;
  static const cardEtapa = Routes.CARDEPETA;
  static const addGraduados = Routes.ADDGRADUADOS;
  static const cardCorrida = Routes.CARDCORRIDA;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.ADDETAPA,
        page: () => const AddEtapa(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.ADDMASTER,
        page: () => const AddPilotos(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.ADDGRADUADOS,
        page: () => const EtapaGraduados(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.CARDETAPA,
        page: () => const CardEtapa(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.CARDCORRIDA,
        page: () => const RaceCard(),
        binding: HomeBinding()),
  ];
}
