import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:preguntados/src/data/models/response/AuthResponse.dart';
import 'package:preguntados/src/data/providers/AuthProvider.dart';

class AuthRepository {
  final AuthProvider _provider = Get.find<AuthProvider>();

  Future<AuthResponse> logIn({BuildContext context, String correo}) =>
      _provider.logIn(correo: correo, context: context);
}
