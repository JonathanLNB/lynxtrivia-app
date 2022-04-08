import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetX;
import 'package:giff_dialog/giff_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:requests/requests.dart';

import '../data/repositories/SessionManager.dart';
import '../global_widgets/ProgressBar.dart';
import '../routes/AppRoutes.dart';
import '../themes/Strings.dart';
import '../themes/Styles.dart';
import 'Constants.dart';

class Herramientas {
  static Future<Map<String, dynamic>> requestBuilder(
      {String url,
      String type,
      Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> params}) async {
    Future<Map<String, dynamic>> getData() async {
      Response r;
      String bodyResponse;
      try {
        switch (type) {
          case Constants.GET:
            r = await Requests.get(url,
                timeoutSeconds: 60,
                headers: headers,
                verify: false,
                queryParameters: params);
            break;
          case Constants.POST:
            r = await Requests.post(url,
                body: body,
                bodyEncoding: RequestBodyEncoding.JSON,
                headers: headers,
                timeoutSeconds: 60,
                verify: false,
                queryParameters: params);
            break;
          case Constants.PATCH:
            r = await Requests.patch(url,
                headers: headers,
                bodyEncoding: RequestBodyEncoding.JSON,
                body: body,
                timeoutSeconds: 60,
                verify: false,
                queryParameters: params);
            break;
          case Constants.PUT:
            r = await Requests.put(url,
                headers: headers,
                bodyEncoding: RequestBodyEncoding.JSON,
                body: body,
                timeoutSeconds: 60,
                verify: false,
                queryParameters: params);
            break;
          case Constants.DELETE:
            r = await Requests.delete(url,
                headers: headers,
                timeoutSeconds: 60,
                verify: false,
                queryParameters: params);
            break;
        }
        r.raiseForStatus();
        bodyResponse = r.content();
        Map<String, dynamic> data = jsonDecode(bodyResponse);
        return data;
      } catch (e) {
        print(e);
        print(r.content());
        if (e is HTTPException) {
          HTTPException exception = e;
          if (exception.response.statusCode == 401) {
            mostrarModal(Strings.error, Strings.sinAutorizacion,
                Constants.FLARE, 'space.flr', () {
              GetX.Get.back();
            }, null);
          } else if (exception.response.statusCode == 404) {
            mostrarModal(Strings.error, Strings.recursoNoEncontrado,
                Constants.FLARE, 'space.flr', () {
              GetX.Get.back();
            }, null);
          }
        }
        return null;
      }
    }

    return await getData();
  }

  static void mostrarModal(String titulo, String mensaje, String type,
      String image, Function onOK, Function onCancel) {
    Widget modal;
    print('${Constants.GIFS_PATH}$image');
    switch (type) {
      case Constants.FLARE:
        modal = FlareGiffDialog(
          flarePath: '${Constants.GIFS_PATH}$image',
          flareAnimation: 'loading',
          title: Text(
            titulo,
            style: Styles.titleModal,
          ),
          description: Text(
            mensaje,
            style: Styles.descriptionModal,
          ),
          entryAnimation: EntryAnimation.normal,
          onOkButtonPressed: onOK,
          onlyOkButton: onCancel == null,
          onCancelButtonPressed: onCancel,
        );
        break;
      case Constants.GIF:
        modal = AssetGiffDialog(
          image: Image.asset('${Constants.GIFS_PATH}$image', fit: BoxFit.cover),
          title: Text(
            titulo,
            style: Styles.titleModal,
          ),
          description: Text(
            mensaje,
            style: Styles.descriptionModal,
          ),
          entryAnimation: EntryAnimation.normal,
          onOkButtonPressed: onOK,
          onlyOkButton: onCancel == null,
          onCancelButtonPressed: onCancel,
        );
    }
    GetX.Get.dialog(modal);
  }

  static void mostrarCargando() {
    GetX.Get.dialog(
        ProgressBar(
          radius: 20,
          dotRadius: 8,
        ),
        barrierDismissible: false);
  }

  static void cerrarSesion() {
    final SessionManager _sessionManager = GetX.Get.find<SessionManager>();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    _sessionManager.setUser("{}");
    _googleSignIn.signOut();
    _auth.signOut();
    GetX.Get.offNamed(AppRoutes.LOGIN);
  }

  static bool parseBool(String value) {
    return value != null
        ? value.toLowerCase() == 'true' || value == '1'
        : false;
  }
}
