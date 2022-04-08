import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig(
      {@required this.child,
        @required this.appTitle,
        @required this.apiBaseUrl,
        @required this.usuario,
        @required this.password});

  final String appTitle;
  final Widget child;
  final String apiBaseUrl;
  final String usuario;
  final String password;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
