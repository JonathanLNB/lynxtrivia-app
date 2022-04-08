import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preguntados/src/components/Pregunta/PreguntaPage.dart';
import 'package:preguntados/src/data/models/response/JuegoResponse.dart';
import 'package:preguntados/src/data/models/response/PreguntaResponse.dart';
import 'package:preguntados/src/data/repositories/JuegoRepository.dart';
import '../../data/models/Juego.dart';
import '../../themes/Strings.dart';
import '../../utils/Constants.dart';
import '../../utils/Herramientas.dart';

class MainController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StreamController wheelNotifier = StreamController<double>();
  final JuegoRepository _juegoRepository = Get.find<JuegoRepository>();

  BuildContext context;
  Juego juego;
  bool giro = false;
  bool primeraVez = true;

  void cerrarSesion() async {
    Herramientas.cerrarSesion();
  }

  double anguloInicial() => Random().nextDouble() * pi * 2;

  double girar() {
    giro = true;
    return (Random().nextDouble() * 6000) + 6000;
  }

  void setContext(BuildContext context) {
    this.context = context;
    if (primeraVez) _init(context);
  }

  void actualizar(int idCategoria) {
    print("Categoría: ${Strings.categorias[idCategoria - 1]}");
  }

  void finalizar(int idCategoria) {
    print("Posición: ${idCategoria - 1}");
    print("Categoría: ${Strings.categorias[idCategoria - 1]}");
    if (giro) {
      obtenerPregunta(idCategoria);
    }
    giro = false;
  }

  void respuesta(bool correcto, int tiempoRestante) {
    Get.back();
    if (correcto) {
      int puntajeObtenido = tiempoRestante * 1000;
      juego.puntaje += puntajeObtenido;
      if (juego.pregunta < 10) {
        juego.pregunta += 1;
        Herramientas.mostrarModal(Strings.exito, "Conseguiste $puntajeObtenido",
            Constants.GIF, "check.gif", actualizarPuntaje, null);
        update(['main']);
      } else {
        Herramientas.mostrarModal(Strings.exito, Strings.felicidades,
            Constants.GIF, "gracias.gif", eliminarJuego, null);
      }
    } else {
      Herramientas.mostrarModal(Strings.error, Strings.vuelveIntentar,
          Constants.GIF, "error.gif", actualizarPuntaje, null);
    }
  }

  Future<void> obtenerPregunta(int idCategoria) async {
    try {
      PreguntaResponse response = await _juegoRepository.obtenerPregunta(
          context: context, idCategoria: idCategoria);
      if (response.success) {
        Get.dialog(PreguntaPage(this, response.data));
      } else {
        Herramientas.mostrarModal(
            Strings.error, Strings.errorGenerico, Constants.FLARE, 'space.flr',
            () {
          Get.back();
        }, null);
      }
    } catch (e) {
      Herramientas.mostrarModal(
          Strings.error, Strings.errorGenerico, Constants.FLARE, 'space.flr',
          () {
        Get.back();
      }, null);
    }
  }

  Future<void> actualizarPuntaje() async {
    Get.back();
    try {
      JuegoResponse response = await _juegoRepository.actualizarJuego(
          context: context, puntaje: juego.puntaje, pregunta: juego.pregunta);
      if (!response.success) {
        Herramientas.mostrarModal(
            Strings.error, Strings.errorGenerico, Constants.FLARE, 'space.flr',
            () {
          Get.back();
        }, null);
      }
    } catch (e) {
      print("Error: ${e}");
      Herramientas.mostrarModal(
          Strings.error, Strings.errorGenerico, Constants.FLARE, 'space.flr',
          () {
        Get.back();
      }, null);
    }
  }

  Future<void> eliminarJuego() async {
    Get.back();
    try {
      JuegoResponse response =
          await _juegoRepository.eliminarJuego(context: context);
      if (response.success) {
        _init(context);
      } else {
        Herramientas.mostrarModal(
            Strings.error, Strings.errorGenerico, Constants.FLARE, 'space.flr',
            () {
          Get.back();
        }, null);
      }
    } catch (e) {
      print("Error: ${e}");
      Herramientas.mostrarModal(
          Strings.error, Strings.errorGenerico, Constants.FLARE, 'space.flr',
          () {
        Get.back();
      }, null);
    }
  }

  Future<void> _init(BuildContext context) async {
    primeraVez = false;
    try {
      JuegoResponse response =
          await _juegoRepository.obtenerJuego(context: context);
      if (response.success) {
        juego = response.data;
        update(['main']);
      } else {
        Herramientas.mostrarModal(
            Strings.error, Strings.errorGenerico, Constants.FLARE, 'space.flr',
            () {
          Get.back();
        }, null);
      }
    } catch (e) {
      print("Error: ${e}");
      Herramientas.mostrarModal(
          Strings.error, Strings.errorGenerico, Constants.FLARE, 'space.flr',
          () {
        Get.back();
      }, null);
    }
  }

  User getUser() {
    return _auth.currentUser;
  }
}
