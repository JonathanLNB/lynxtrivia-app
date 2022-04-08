import 'package:get/get.dart';

import '../../data/models/Pregunta.dart';
import '../../modules/Main/MainController.dart';

class PreguntaController extends GetxController {
  PreguntaController(this._controller, this.pregunta);

  MainController _controller;
  Pregunta pregunta;
  RxInt tiempo = 15.obs;
  bool contar = true;

  Future<void> reducirTiempo() async {
    if (tiempo >= 0 && contar) {
      await Future.delayed(const Duration(seconds: 1));
      tiempo -= 1;
      reducirTiempo();
    } else {
      if (contar) comprobarPregunta(-1);
    }
  }

  void comprobarPregunta(int opcion) {
    contar = false;
    _controller.respuesta(pregunta.respuesta == opcion, tiempo.value);
  }

  @override
  void onReady() {
    reducirTiempo();
    super.onReady();
  }
}
