import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../themes/AppColors.dart';
import '../../themes/Strings.dart';
import '../../themes/Styles.dart';
import '../../utils/Constants.dart';
import 'LogInController.dart';

class LogInPage extends StatelessWidget {
  final FocusNode _passwordF = FocusNode();
  final FocusNode _correoF = FocusNode();

  var width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GetBuilder<LogInController>(
        builder: (_) => Scaffold(
              resizeToAvoidBottomInset: false,
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
                  _buildLogIn(_, context),
                ],
              ),
            ));
  }

  Widget _buildLogIn(LogInController _, BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: height * .6,
        child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 5.0,
            color: Colors.white,
            child: Container(
                width: 300,
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      '${Constants.IMAGE_PATH}logo.png',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(Strings.bienvenido,
                        textAlign: TextAlign.center, style: Styles.title),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                        onPressed: () {
                          _.signInWithGoogle(context);
                        },
                        color: AppColors.secundary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Container(
                            width: width,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(Strings.iniciarG,
                                textAlign: TextAlign.center,
                                style: Styles.login))),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ))),
      ),
    );
  }
}
