import 'package:get/get.dart';

import 'LogInController.dart';

class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController()); //Se encarga de cargar en el init nuestro controller en lugar de ponerlo en el Widget
  }
}