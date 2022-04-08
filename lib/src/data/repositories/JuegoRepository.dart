import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preguntados/src/data/models/response/JuegoResponse.dart';
import 'package:preguntados/src/data/models/response/PreguntaResponse.dart';
import 'package:preguntados/src/data/providers/JuegoProvider.dart';

class JuegoRepository {
  final JuegoProvider _provider = Get.find<JuegoProvider>();

  Future<JuegoResponse> obtenerJuego({BuildContext context}) =>
      _provider.obtenerJuego(context: context);

  Future<JuegoResponse> actualizarJuego({BuildContext context, int puntaje, int pregunta}) =>
      _provider.actualizarJuego(context: context, pregunta: pregunta, puntaje: puntaje);

  Future<JuegoResponse> eliminarJuego({BuildContext context}) =>
      _provider.eliminarJuego(context: context);

  Future<PreguntaResponse> obtenerPregunta(
          {BuildContext context, int idCategoria}) =>
      _provider.obtenerPregunta(idCategoria: idCategoria, context: context);
}
