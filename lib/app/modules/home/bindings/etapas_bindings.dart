import 'package:get/get.dart';
import 'package:speed_kart_pro/app/controllers/pilotos_controller.dart';

class Etapabinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilotosController>(() => PilotosController());
  }
}