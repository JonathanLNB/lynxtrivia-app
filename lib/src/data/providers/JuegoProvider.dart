import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:preguntados/src/data/models/response/JuegoResponse.dart';
import 'package:preguntados/src/data/repositories/SessionManager.dart';

import '../../utils/AppConfig.dart';
import '../../utils/Constants.dart';
import '../../utils/Herramientas.dart';
import '../models/response/PreguntaResponse.dart';

class JuegoProvider {
  final SessionManager _sessionManager =
  Get.find<SessionManager>();

  Future<JuegoResponse> obtenerJuego({BuildContext context}) async {
    try {
      String token = await _sessionManager.getAccessToken();
      AppConfig cfg = AppConfig.of(context);
      final Map<String, dynamic> respuesta = await Herramientas.requestBuilder(
          url: "${cfg.apiBaseUrl}game/",
          type: Constants.GET,
          body: {},
          headers: {
            'Authorization': 'Bearer $token',
          },
          params: {});
      return JuegoResponse.fromMap(respuesta);
    } catch (e) {
      return e;
    }
  }

  Future<JuegoResponse> actualizarJuego({BuildContext context, int puntaje, int pregunta}) async {
    try {
      String token = await _sessionManager.getAccessToken();
      AppConfig cfg = AppConfig.of(context);
      final Map<String, dynamic> respuesta = await Herramientas.requestBuilder(
          url: "${cfg.apiBaseUrl}game/",
          type: Constants.PATCH,
          body: {
            "puntaje": puntaje,
            "pregunta": pregunta,
          },
          headers: {
            'Authorization': 'Bearer $token',
          },
          params: {});
      return JuegoResponse.fromMap(respuesta);
    } catch (e) {
      return e;
    }
  }

  Future<JuegoResponse> eliminarJuego({BuildContext context}) async {
    try {
      String token = await _sessionManager.getAccessToken();
      AppConfig cfg = AppConfig.of(context);
      final Map<String, dynamic> respuesta = await Herramientas.requestBuilder(
          url: "${cfg.apiBaseUrl}game/",
          type: Constants.DELETE,
          body: {},
          headers: {
            'Authorization': 'Bearer $token',
          },
          params: {});
      return JuegoResponse.fromMap(respuesta);
    } catch (e) {
      return e;
    }
  }

  Future<PreguntaResponse> obtenerPregunta({BuildContext context, int idCategoria}) async {
    try {
      String token = await _sessionManager.getAccessToken();
      AppConfig cfg = AppConfig.of(context);
      final Map<String, dynamic> respuesta = await Herramientas.requestBuilder(
          url: "${cfg.apiBaseUrl}question/$idCategoria",
          type: Constants.GET,
          body: {},
          headers: {
            'Authorization': 'Bearer $token',
          },
          params: {});
      return PreguntaResponse.fromMap(respuesta);
    } catch (e) {
      return e;
    }
  }
}