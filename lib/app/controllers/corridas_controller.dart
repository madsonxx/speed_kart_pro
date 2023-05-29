import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_kart_pro/app/modulos/corrida.dart';

class RaceController extends GetxController {
  RxList<Corrida> corridas = RxList<Corrida>([]);
  TextEditingController posController = TextEditingController();

  late Corrida corrida;
  var existemPontos = true.obs;
}
