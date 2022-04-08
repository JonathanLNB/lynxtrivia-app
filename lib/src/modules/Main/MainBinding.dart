import 'package:get/get.dart';

import 'MainController.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController()); //Se encarga de cargar en el init nuestro controller en lugar de ponerlo en el Widget
  }
}