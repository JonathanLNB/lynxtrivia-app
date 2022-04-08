import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/Pregunta.dart';
import '../../modules/Main/MainController.dart';
import '../../themes/AppColors.dart';
import '../../themes/Styles.dart';
import 'PreguntaController.dart';

class PreguntaPage extends StatelessWidget {
  var width, height;

  PreguntaPage(this._controller, this.pregunta);

  Pregunta pregunta;
  MainController _controller;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GetBuilder<PreguntaController>(
      id: 'pregunta',
      init: PreguntaController(_controller, pregunta),
      builder: (_) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
              width: width * .8,
              alignment: Alignment.center,
              child: Wrap(children: [
                Card(
                    color: AppColors.categorias[pregunta.idcategoria - 1],
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            pregunta.pregunta,
                            textAlign: TextAlign.center,
                            style: Styles.titlePregunta,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(() => Text(
                                "${_.tiempo.value}",
                                textAlign: TextAlign.center,
                                style: Styles.timerPregunta,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          generarPreguntas(_)
                        ],
                      ),
                    ))
              ])),
        ),
      ),
    );
  }

  Column generarPreguntas(PreguntaController _) {
    Column preguntas = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        opcion(_, pregunta.opciona, 0),
        opcion(_, pregunta.opcionb, 1),
        opcion(_, pregunta.opcionc, 2),
        opcion(_, pregunta.opciond, 3),
      ],
    );
    preguntas.children.shuffle();

    return preguntas;
  }

  Widget opcion(PreguntaController _, String texto, int posicion) {
    return Container(
      margin: EdgeInsets.all(10),
      child: MaterialButton(
          onPressed: () {
            _.comprobarPregunta(posicion);
          },
          color: AppColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(texto,
                  textAlign: TextAlign.center,
                  style: Styles.opcionesPregunta(pregunta.idcategoria - 1)))),
    );
  }
}
