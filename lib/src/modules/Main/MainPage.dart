import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:get/get.dart';
import 'package:preguntados/src/utils/AppConfig.dart';
import 'package:preguntados/src/utils/Constants.dart';

import '../../themes/AppColors.dart';
import '../../themes/Strings.dart';
import '../../themes/Styles.dart';
import 'MainController.dart';

class MainPage extends StatelessWidget {
  var width, height;

  @override
  Widget build(BuildContext context) {
    AppConfig cfg = AppConfig.of(context);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GetBuilder<MainController>(
        id: 'main',
        builder: (_) => Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                title: Text(cfg.appTitle,
                    textAlign: TextAlign.center, style: Styles.header),
                centerTitle: true,
                elevation: 2,
                backgroundColor: AppColors.primary,
                leading: SizedBox(),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: AppColors.white,
                    ),
                    onPressed: () => _.cerrarSesion(),
                  ),
                ],
              ),
              body: Stack(
                children: <Widget>[
                  Container(
                    height: height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('${Constants.IMAGE_PATH}fondo.png'),
                          fit: BoxFit.none,
                          repeat: ImageRepeat.repeat),
                    ),
                  ),
                  _buildMain(_, context)
                ],
              ),
            ));
  }

  Widget _buildMain(MainController _, BuildContext context) {
    _.setContext(context);
    return Center(
      child: Container(
        width: width * .8,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 5.0,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(_.getUser().photoURL),
                      maxRadius: 50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _.getUser().displayName,
                      textAlign: TextAlign.center,
                      style: Styles.subtitle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${_.juego != null ? _.juego.puntaje : '0'}",
                      style: Styles.title,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: SpinningWheel(
                Image.asset('${Constants.IMAGE_PATH}ruleta.png'),
                width: 330,
                height: 330,
                initialSpinAngle: _.anguloInicial(),
                spinResistance: 0.6,
                canInteractWhileSpinning: false,
                dividers: 6,
                onUpdate: _.actualizar,
                onEnd: _.finalizar,
                secondaryImage: Image.asset('${Constants.IMAGE_PATH}punta.png'),
                secondaryImageHeight: 110,
                secondaryImageWidth: 110,
                shouldStartOrStop: _.wheelNotifier.stream,
              ),
              onTap: () {
                _.wheelNotifier.sink.add(_.girar());
              },
            ),
            const SizedBox(height: 30),
            Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 5.0,
                color: Colors.white,
                child: SizedBox(
                  width: width * .32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.pregunta,
                        style: Styles.subtitle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${_.juego != null ? _.juego.pregunta : '1'}',
                        style: Styles.pregunta,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
