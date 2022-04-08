import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:preguntados/src/modules/SplashScreen/SplashBinding.dart';
import 'package:preguntados/src/modules/SplashScreen/SplashPage.dart';
import 'package:preguntados/src/routes/AppPages.dart';
import 'package:preguntados/src/utils/AppConfig.dart';
import 'package:preguntados/src/utils/InyeccionDependencias.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LynxTrivia());
}

class LynxTrivia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InyeccionDependencias.init();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return AppConfig(
        appTitle: "Semana Lince",
        apiBaseUrl: "http://192.168.1.79:8002/api/",
        usuario: 'admin',
        password: 'supersecret',
        child: GetMaterialApp(
          theme: Theme.of(context).copyWith(
              appBarTheme: Theme.of(context)
                  .appBarTheme
                  .copyWith(systemOverlayStyle: SystemUiOverlayStyle.light)),
          title: "Semana Lince",
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: SplashPage(),
          ),
          initialBinding: SplashBinding(),
          getPages: AppPages.pages,
        ));
  }
}
