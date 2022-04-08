import 'package:flutter/cupertino.dart';

import '../utils/Constants.dart';
import 'AppColors.dart';

class Styles {
  static TextStyle login = const TextStyle(
      color: AppColors.white,
      fontSize: 14.0,
      fontFamily: Constants.GOOGLESANS,
      fontWeight: FontWeight.w400);

  static TextStyle header = const TextStyle(
      color: AppColors.white,
      fontSize: 25.0,
      fontFamily: Constants.GOOGLESANS,
      fontWeight: FontWeight.w400);

  static TextStyle title = const TextStyle(
      color: AppColors.primary,
      fontSize: 25.0,
      fontFamily: Constants.GOOGLESANS,
      fontWeight: FontWeight.w400);

  static TextStyle subtitle = const TextStyle(
      color: AppColors.primary,
      fontSize: 20.0,
      fontFamily: Constants.GOOGLESANS,
      fontWeight: FontWeight.w400);

  static TextStyle pregunta = const TextStyle(
      color: AppColors.green,
      fontSize: 40.0,
      fontFamily: Constants.GOOGLESANS,
      fontWeight: FontWeight.w400);

  static TextStyle titlePregunta = const TextStyle(
      fontSize: 25,
      fontFamily: Constants.GOOGLESANS,
      fontWeight: FontWeight.bold,
      color: AppColors.white);

  static TextStyle timerPregunta = const TextStyle(
      fontSize: 15,
      fontFamily: Constants.GOOGLESANS,
      color: AppColors.white);

  static TextStyle opcionesPregunta(categoria) => TextStyle(
      fontSize: 22,
      fontFamily: Constants.GOOGLESANS,
      color: AppColors.categorias[categoria]);

  static TextStyle titleModal = const TextStyle(
      fontSize: 22,
      fontFamily: Constants.GOOGLESANS,
      fontWeight: FontWeight.bold,
      color: AppColors.primary);

  static TextStyle descriptionModal = const TextStyle(
      fontSize: 15,
      fontFamily: Constants.GOOGLESANS,
      color: AppColors.secundary);
}
