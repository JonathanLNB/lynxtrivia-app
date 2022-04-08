import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../routes/AppRoutes.dart';
import '../../utils/AppConfig.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Random random = new Random();
  RxDouble opacity = 0.0.obs;
  Timer _timer;

  SplashController();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    try {
      inciarTimer();
      final User auth = _auth.currentUser;
      await Future.delayed(Duration(seconds: 4));
      if (auth != null) {
          Get.offNamed(AppRoutes.MAIN);
      } else {
        Get.offNamed(AppRoutes.LOGIN);
      }
    } catch (e) {
      print(e);
    }
  }

  void newAngle() {
    opacity.value += opacity.value < 1.0 ? 0.2 : 0;
    print(opacity.value);
  }

  void cerrarSesion() async {
    _auth.signOut();
  }

  void inciarTimer() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 25),
      (Timer timer) {
        newAngle();
      },
    );
  }

  @override
  void onClose() {
    try {
      _timer.cancel();
    } catch (e) {
      print(e);
    }
    super.onClose();
  }
}
