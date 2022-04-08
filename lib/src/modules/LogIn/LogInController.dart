import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:preguntados/src/data/models/response/AuthResponse.dart';
import 'package:preguntados/src/data/repositories/SessionManager.dart';
import 'package:preguntados/src/utils/Constants.dart';

import '../../data/repositories/AuthRepository.dart';
import '../../routes/AppRoutes.dart';
import '../../themes/Strings.dart';
import '../../utils/Herramientas.dart';

class LogInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final SessionManager _sessionManager = Get.find<SessionManager>();

  LogInController();

  @override
  void onReady() {
    super.onReady();
  }

  signInWithGoogle(BuildContext context) async {
    try {
      Herramientas.mostrarCargando();

      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential user = await _auth.signInWithCredential(credential);
      User currentUser = user.user;

      if (currentUser == null) {
        Get.back();
        cerrarSesion();
      } else {
        autenticarse(context);
      }
    } catch (e) {
      Get.back();
      Herramientas.mostrarModal(Strings.error, Strings.errorGenerico,
          Constants.FLARE, 'space.flr', () {
        Get.back();
      }, null);
    }
  }

  Future<void> autenticarse(BuildContext context) async {
    try {
      Herramientas.mostrarCargando();
      AuthResponse response = await _authRepository.logIn(
          context: context, correo: getUser().email);
      Get.back();
      if (response.success) {
        _sessionManager.setUser(response.data.user.toJson());
        _sessionManager.setAccessToken(response.data.token);
        Get.offNamed(AppRoutes.MAIN);
      } else {
        Herramientas.mostrarModal(
            Strings.error, Strings.errorSesion, Constants.FLARE, "space.flr",
            () {
          Get.back();
        }, null);
      }
    } catch (e) {
      Get.back();
      Herramientas.mostrarModal(
          Strings.error, Strings.errorGenerico, Constants.FLARE, "space.flr",
          () {
        Get.back();
      }, null);
    }
  }

  User getUser() {
    return _auth.currentUser;
  }

  void cerrarSesion() async {
    Herramientas.cerrarSesion();
  }
}
