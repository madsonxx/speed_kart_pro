import 'package:get/get.dart';
import 'package:speed_kart_pro/app/modules/home/controllers/etapas_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EtapaController>(() => EtapaController());
  }
}
