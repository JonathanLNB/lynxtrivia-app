import 'package:get/get.dart';

import 'SplashController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController()); //Se encarga de cargar en el init nuestro controller en lugar de ponerlo en el Widget
  }
}
