import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/views/add_etapa.dart';
import 'package:speed_kart_pro/app/views/add_etapa_graduados.dart';
import 'package:speed_kart_pro/app/views/add_pilotos.dart';
import 'package:speed_kart_pro/app/views/cards_etapa/Corrida/card_corrida.dart';
import 'package:speed_kart_pro/app/views/cards_etapa/card_etapa.dart';
import 'package:speed_kart_pro/app/views/classification_screen.dart';
import 'package:speed_kart_pro/app/views/home_page.dart';
import 'package:speed_kart_pro/races_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            color: Colors.grey,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
          ),
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.transparent)),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/paginaInicial',
      color: Colors.black,
      getPages: [
        GetPage(name: '/paginaInicial', page: () => const HomeScreen()),
        GetPage(name: '/pagina1', page: () => const RaceScreen()),
        GetPage(name: '/pagina2', page: () => const Classification()),
        GetPage(name: '/addEtapa', page: () => const AddEtapa()),
        GetPage(name: '/addMaster', page: () => const AddPilotos()),
        GetPage(name: '/addGraduados', page: () => const EtapaGraduados()),
        GetPage(name: '/cardEtapa', page: () => const CardEtapa()),
        GetPage(name: '/cardRace', page: () => const RaceCard()),
      ],
    );
  }
}
