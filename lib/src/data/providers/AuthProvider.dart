import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../utils/AppConfig.dart';
import '../../utils/Constants.dart';
import '../../utils/Herramientas.dart';
import '../models/response/AuthResponse.dart';

class AuthProvider {
  Future<AuthResponse> logIn({String correo, BuildContext context}) async {
    try {
      AppConfig cfg = AppConfig.of(context);
      final Map<String, dynamic> respuesta = await Herramientas.requestBuilder(
          url: "${cfg.apiBaseUrl}login/",
          type: Constants.POST,
          body: {
            'correo': correo,
          },
          headers: {
            'Authorization': 'Basic ${base64Encode(utf8.encode('${cfg.usuario}:${cfg.password}'))}',
          },
          params: {});
      return AuthResponse.fromMap(respuesta);
    } catch (e) {
      return e;
    }
  }
}
